#!/usr/bin/env bash
# Point the docs site at a published ChurchCRM version and, when MERGE=true,
# merge the API pin plus every open docs pull request milestoned Current.
# Milestones: Current (the latest published release; the only one that may merge into main) and one
# x.y.z milestone per upcoming version. Publishing VERSION moves its open items into Current.
#
# Required: GH_TOKEN with contents and pull-request access to the docs repo.
# VERSION: stable x.y.z release tag.
# MERGE: true to merge, false to only open the pin pull request and milestone.
# NEXT_VERSION: optional upcoming version. Blank, invalid or not newer than VERSION means the next patch.
set -euo pipefail

# Decide from the pull request rollup plus the newest workflow run for the head SHA.
# A workflow_dispatch run never appears on statusCheckRollup, so the run is authoritative
# when one exists. CodeRabbit is ignored. Prints "ok" or one reason per line.
evaluate_merge_gates() {
  jq -nr --argjson rollup "$1" --argjson ci "$2" --argjson gate "$3" '
    def fold: if . == null or . == "" then "" else ascii_downcase end;
    def run_state($run):
      ($run.status | fold) as $s
      | ($run.conclusion | fold) as $c
      | if $s == "" or $s == "missing" then "missing"
        elif $s != "completed" then $s
        elif $c == "success" then "success"
        else "finished " + (if $c == "" then "unsuccessful" else $c end)
        end;
    def rollup_state($name):
      ([$rollup[]? | select(.name == $name)] | last) as $c
      | if $c == null then "missing"
        elif (($c.status // "") | fold) != "completed" then (($c.status // "pending") | fold)
        elif (($c.conclusion // "") | fold) == "success" then "success"
        else "finished " + (if (($c.conclusion // "") | fold) == "" then "unsuccessful" else (($c.conclusion // "") | fold) end)
        end;
    def prefer($run; $name):
      run_state($run) as $r
      | if $r != "missing" then $r else rollup_state($name) end;
    def blocked:
      [$rollup[]?
        | select(.name != "Validate Docusaurus site" and .name != "Released software gate")
        | select(.name != "CodeRabbit" and .name != "CodeRabbit approval" and .context != "CodeRabbit")
        | if (.context != null and .name == null) or .__typename == "StatusContext" then
            if ((.state // "") | fold) == "success" then empty
            else "\(.context // "check") is \((.state // "pending") | fold)"
            end
          elif ((.status // "") | fold) == "completed" and ((.conclusion // "") | fold) == "success" then empty
          elif ((.status // "") | fold) != "completed" then
            "\(.name // .context // "check") is \((.status // "pending") | fold)"
          else
            "\(.name // .context // "check") finished \((.conclusion // "unsuccessful") | fold)"
          end];
    [prefer($ci; "Validate Docusaurus site")] as $ci_state
    | [prefer($gate; "Released software gate")] as $gate_state
    | (if $ci_state[0] != "success" then ["Validate Docusaurus site is \($ci_state[0])"] else [] end)
      + (if $gate_state[0] != "success" then ["Released software gate is \($gate_state[0])"] else [] end)
      + blocked
    | if length == 0 then "ok" else .[] end
  '
}

if [ "${1:-}" = "--decision-fixture" ]; then
  result=$(evaluate_merge_gates "$2" "$3" "$4")
  printf '%s\n' "$result"
  [ "$result" = "ok" ]
  exit $?
fi

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${VERSION:?VERSION is required}"
DOCS_REPO="${DOCS_REPO:-ChurchCRM/docs.churchcrm.io}"
MERGE="${MERGE:-false}"

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error::VERSION must be a stable x.y.z tag. Found: $VERSION" >&2
  exit 1
fi

ensure_milestone() {
  local title="$1" description="$2"
  local number
  number=$(gh api --paginate "repos/${DOCS_REPO}/milestones?state=all&per_page=100" \
    --jq ".[] | select(.title == \"$title\") | .number" | head -n 1)
  if [ -z "$number" ]; then
    number=$(gh api "repos/${DOCS_REPO}/milestones" --method POST \
      -f title="$title" -f description="$description" --jq '.number')
    echo "Created docs milestone #$number ($title)"
  else
    gh api -X PATCH "repos/${DOCS_REPO}/milestones/$number" -f state=open --silent
    echo "Docs milestone $title already exists (#$number)"
  fi
}

milestone_number() {
  gh api --paginate "repos/${DOCS_REPO}/milestones?state=open&per_page=100" \
    --jq ".[] | select(.title == \"$1\") | .number" | head -n 1
}

NEXT_VERSION="${NEXT_VERSION:-}"
if ! [[ "$NEXT_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] \
  || [ "$(printf '%s\n%s\n' "$VERSION" "$NEXT_VERSION" | sort -V | tail -n 1)" != "$NEXT_VERSION" ] \
  || [ "$NEXT_VERSION" = "$VERSION" ]; then
  NEXT_VERSION="${VERSION%.*}.$(( 10#${VERSION##*.} + 1 ))"
fi

ensure_milestone "Current" "Docs for the latest published ChurchCRM release. The only milestone that may merge into main."
if [ "$MERGE" != "true" ]; then
  ensure_milestone "$VERSION" "Docs for ChurchCRM $VERSION. Merges into release-docs/$VERSION, never main."
fi
ensure_milestone "$NEXT_VERSION" "Docs for ChurchCRM $NEXT_VERSION. Merges into release-docs/$NEXT_VERSION, never main."

# Publishing VERSION makes its docs the released docs: the open items on the VERSION milestone move
# to Current and the VERSION milestone closes. Only runs when the release is published (MERGE=true).
rotate_version_into_current() {
  local current from number
  current=$(milestone_number "Current")
  from=$(milestone_number "$VERSION")
  [ -z "$current" ] || [ -z "$from" ] && return 0
  while read -r number; do
    [ -z "$number" ] && continue
    gh api -X PATCH "repos/${DOCS_REPO}/issues/$number" -F milestone="$current" --silent
    echo "Moved #$number from $VERSION to Current."
  done < <(gh api --paginate "repos/${DOCS_REPO}/issues?state=open&milestone=${from}&per_page=100" --jq '.[].number')
  gh api -X PATCH "repos/${DOCS_REPO}/milestones/$from" -f state=closed --silent
  echo "Closed docs milestone $VERSION."
}

# The next release's docs start from the main that now holds this release's docs.
ensure_next_docs_branch() {
  local branch="release-docs/${NEXT_VERSION}" sha
  if git ls-remote --exit-code --heads origin "$branch" > /dev/null 2>&1; then
    echo "Branch $branch already exists."
    return 0
  fi
  sha=$(gh api "repos/${DOCS_REPO}/git/ref/heads/main" --jq '.object.sha')
  gh api "repos/${DOCS_REPO}/git/refs" -f ref="refs/heads/${branch}" -f sha="$sha" --silent
  echo "Created $branch from main (${sha:0:12})."
}

if [ "$MERGE" = "true" ]; then
  rotate_version_into_current
  pr_milestone="Current"
else
  pr_milestone="$VERSION"
fi

open_pin_pr() {
  local pinned newer
  pinned=$(gh api "repos/${DOCS_REPO}/contents/crm-release.json?ref=main" --jq '.content' | base64 -d | jq -r '.version')
  echo "Docs pin is $pinned. Requested version is $VERSION."

  if [ "$pinned" != "$VERSION" ]; then
    newer=$(printf '%s\n%s\n' "$pinned" "$VERSION" | sort -V | tail -n 1)
    if [ "$newer" != "$VERSION" ]; then
      echo "::error::Refusing to move the docs pin backwards from $pinned to $VERSION." >&2
      exit 1
    fi
    LATEST="$VERSION" MILESTONE="$pr_milestone" ./scripts/ci/open-pin-pr.sh
  fi
}

# Product docs for a release merge into release-docs/<version> as they are
# approved. That branch reaches main as one pull request.
docs_branch="release-docs/${VERSION}"
docs_pr=""
if git ls-remote --exit-code --heads origin "$docs_branch" > /dev/null 2>&1; then
  docs_pr=$(gh pr list --repo "$DOCS_REPO" --base main --head "$docs_branch" --state open --json number --jq '.[0].number // ""')
  if [ -z "$docs_pr" ]; then
    url=$(gh pr create --repo "$DOCS_REPO" --base main --head "$docs_branch" --milestone "$pr_milestone" \
      --title "docs: ChurchCRM ${VERSION}" \
      --body "Every product docs pull request for ChurchCRM ${VERSION}, merged into \`${docs_branch}\` as it was approved.")
    docs_pr="${url##*/}"
    echo "Opened release docs pull request #$docs_pr"
  fi
fi

if [ "$MERGE" != "true" ]; then
  open_pin_pr
  echo "MERGE is not true. The pin pull request is staged and will merge when the release is published."
  exit 0
fi

latest_workflow_run() {
  local workflow="$1" sha="$2"
  gh run list --repo "$DOCS_REPO" --workflow "$workflow" --commit "$sha" --limit 1 \
    --json status,conclusion,databaseId,event,headSha \
    --jq '.[0] // {"status":"missing"}'
}

# Newest run for this SHA wins. A missing run falls back to the pull request rollup.
# Return 0 when both required workflows succeeded and no other non-CodeRabbit check is red or pending.
# Return 1 while a required run is missing, pending, or still failed (a re-run may be in flight).
# Return 2 when the gate rules reject the pull request. That does not clear by waiting.
ready_to_merge() {
  local number="$1" sha rollup ci gate result
  sha=$(gh pr view "$number" --repo "$DOCS_REPO" --json headRefOid --jq .headRefOid)
  rollup=$(gh pr view "$number" --repo "$DOCS_REPO" --json statusCheckRollup --jq '.statusCheckRollup // []')
  ci=$(latest_workflow_run ci.yml "$sha")
  gate=$(latest_workflow_run release-gate.yml "$sha")
  result=$(evaluate_merge_gates "$rollup" "$ci" "$gate")
  if [ "$result" != "ok" ]; then
    echo "Pull request #$number @ ${sha:0:12} is not ready to merge:"
    printf '%s\n' "$result" | sed 's/^/  /'
    return 1
  fi
  if ! PR_NUMBER="$number" DOCS_REPO="$DOCS_REPO" ./scripts/ci/validate-product-docs-release.sh; then
    echo "Pull request #$number failed the released-software gate rules."
    return 2
  fi
}

merge_pr() {
  local number="$1" rc=0
  ready_to_merge "$number" || rc=$?
  if [ "$rc" -ne 0 ]; then
    return 1
  fi
  echo "Merging docs pull request #$number"
  gh pr merge "$number" --repo "$DOCS_REPO" --merge
}

# A failed or missing run is started once, then polled. workflow_dispatch does not
# attach a check to the pull request, so the wait follows the run for the head SHA.
ensure_workflow() {
  local workflow="$1" check="$2" branch="$3" sha="$4"
  local run id status conclusion
  run=$(latest_workflow_run "$workflow" "$sha")
  status=$(jq -r '.status // "missing"' <<<"$run")
  conclusion=$(jq -r '.conclusion // ""' <<<"$run")
  id=$(jq -r '.databaseId // ""' <<<"$run")
  if [ "$status" = "missing" ]; then
    echo "Starting $workflow for $check on $branch @ ${sha:0:12}; no run exists for that commit."
    gh workflow run "$workflow" --repo "$DOCS_REPO" --ref "$branch" \
      || echo "Could not start $workflow for $check."
  elif [ "$status" = "completed" ] && [ "$conclusion" != "success" ]; then
    echo "Re-running $check run $id ($conclusion) for ${sha:0:12}."
    if ! gh run rerun "$id" --repo "$DOCS_REPO"; then
      echo "Re-run of $id failed. Starting $workflow on $branch instead."
      gh workflow run "$workflow" --repo "$DOCS_REPO" --ref "$branch" \
        || echo "Could not start $workflow for $check."
    fi
  else
    echo "$check on ${sha:0:12} is $status${conclusion:+ ($conclusion)}."
  fi
}

wait_for_checks() {
  local number="$1" branch="$2" sha attempt=0 rc=0
  sha=$(gh pr view "$number" --repo "$DOCS_REPO" --json headRefOid --jq .headRefOid)
  echo "Waiting for CI on pull request #$number ($branch @ ${sha:0:12})."
  ensure_workflow ci.yml "Validate Docusaurus site" "$branch" "$sha"
  ensure_workflow release-gate.yml "Released software gate" "$branch" "$sha"
  for attempt in $(seq 1 60); do
    rc=0
    ready_to_merge "$number" || rc=$?
    if [ "$rc" -eq 0 ]; then
      return 0
    fi
    if [ "$rc" -eq 2 ]; then
      echo "Not merging pull request #$number. The released-software gate rejected it."
      return 1
    fi
    echo "Still waiting for pull request #$number ($attempt/60)."
    sleep 30
  done
  echo "Timed out waiting for CI on pull request #$number."
  return 1
}

if [ -n "$docs_pr" ]; then
  wait_for_checks "$docs_pr" "$docs_branch"
  merge_pr "$docs_pr" || { echo "::error::Release docs pull request #$docs_pr is waiting for CI."; exit 1; }
  # The pin pull request must start from the main that now holds the release docs.
  git fetch --quiet origin main
  git checkout --quiet -B main origin/main
fi
open_pin_pr

pin_branch="release/${VERSION}"
pin_number=$(gh pr list --repo "$DOCS_REPO" --base main --head "$pin_branch" --state open --json number --jq '.[0].number // ""')
skipped=0
if [ -n "$pin_number" ]; then
  wait_for_checks "$pin_number" "$pin_branch"
  merge_pr "$pin_number" || skipped=1
else
  echo "No open API pin pull request for $VERSION."
fi

current_number=$(milestone_number "Current")
pr_numbers=""
if [ -n "$current_number" ]; then
  pr_numbers=$(gh api --paginate "repos/${DOCS_REPO}/issues?state=open&milestone=${current_number}&per_page=100" \
    --jq '.[] | select(.pull_request != null and .draft != true) | .number')
fi
while read -r number; do
  [ -z "$number" ] && continue
  [ "$number" = "$pin_number" ] && continue
  merge_pr "$number" || skipped=1
done <<< "$pr_numbers"

if [ "$skipped" -ne 0 ]; then
  echo "::error::At least one docs pull request is waiting for CI."
  exit 1
fi

ensure_next_docs_branch

gh workflow run "Deploy to GitHub Pages" --repo "$DOCS_REPO" --ref main || echo "Deploy dispatch was not accepted. A token push to main still starts it."
echo "Docs for ChurchCRM $VERSION are merged."
