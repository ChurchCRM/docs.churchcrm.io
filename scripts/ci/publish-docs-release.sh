#!/usr/bin/env bash
# Point the docs site at a published ChurchCRM version and, when MERGE=true,
# merge the API pin plus every open docs pull request on that milestone.
#
# Required: GH_TOKEN with contents and pull-request access to the docs repo.
# VERSION: stable x.y.z release tag.
# MERGE: true to merge, false to only open the pin pull request and milestone.
# NEXT_VERSION: optional upcoming milestone to create.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${VERSION:?VERSION is required}"
DOCS_REPO="${DOCS_REPO:-ChurchCRM/docs.churchcrm.io}"
MERGE="${MERGE:-false}"

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error::VERSION must be a stable x.y.z tag. Found: $VERSION" >&2
  exit 1
fi

ensure_milestone() {
  local version="$1"
  local number
  number=$(gh api --paginate "repos/${DOCS_REPO}/milestones?state=all&per_page=100" \
    --jq ".[] | select(.title == \"$version\") | .number" | head -n 1)
  if [ -z "$number" ]; then
    number=$(gh api "repos/${DOCS_REPO}/milestones" --method POST \
      -f title="$version" \
      -f description="Documentation for ChurchCRM $version." \
      --jq '.number')
    echo "Created docs milestone #$number ($version)"
  else
    gh api -X PATCH "repos/${DOCS_REPO}/milestones/$number" -f state=open --silent
    echo "Docs milestone $version already exists (#$number)"
  fi
}

ensure_milestone "$VERSION"
if [ -n "${NEXT_VERSION:-}" ] && [[ "$NEXT_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  ensure_milestone "$NEXT_VERSION"
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
    LATEST="$VERSION" ./scripts/ci/open-pin-pr.sh
  fi
}

# Product docs for a release merge into release-docs/<version> as they are
# approved. That branch reaches main as one pull request.
docs_branch="release-docs/${VERSION}"
docs_pr=""
if git ls-remote --exit-code --heads origin "$docs_branch" > /dev/null 2>&1; then
  docs_pr=$(gh pr list --repo "$DOCS_REPO" --base main --head "$docs_branch" --state open --json number --jq '.[0].number // ""')
  if [ -z "$docs_pr" ]; then
    url=$(gh pr create --repo "$DOCS_REPO" --base main --head "$docs_branch" --milestone "$VERSION" \
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

ready_to_merge() {
  local number="$1"
  local pending
  pending=$(gh pr view "$number" --repo "$DOCS_REPO" --json statusCheckRollup --jq \
    '[.statusCheckRollup[]? | select(.name != "CodeRabbit approval" and .name != "CodeRabbit" and .context != "CodeRabbit")] as $all
     | ([$all[] | select(.__typename == "CheckRun") | .name]) as $names
     | if (($names | index("Validate Docusaurus site")) == null
           or ($names | index("Released software gate")) == null) then 1
       elif any($all[];
         if .__typename == "CheckRun" then (.status != "COMPLETED" or .conclusion != "SUCCESS")
         elif .__typename == "StatusContext" then (.state != "SUCCESS")
         else true end) then 1
       else 0 end')
  if [ "$pending" != "0" ]; then
    echo "Pull request #$number is not merged. A CI check is missing or not successful."
    return 1
  fi
}

merge_pr() {
  local number="$1"
  if ! ready_to_merge "$number"; then
    return 1
  fi
  echo "Merging docs pull request #$number"
  gh pr merge "$number" --repo "$DOCS_REPO" --merge
}

if [ -n "$docs_pr" ]; then
  # The released-software gate failed while the version was unpublished: run it again.
  gate_run=$(gh run list --repo "$DOCS_REPO" --workflow release-gate.yml --branch "$docs_branch" --limit 1 \
    --json databaseId,conclusion --jq '.[0] | select(.conclusion == "failure") | .databaseId // empty')
  if [ -n "$gate_run" ]; then
    gh run rerun "$gate_run" --repo "$DOCS_REPO" || true
  fi
  # A pull request opened with the workflow token starts no checks of its own.
  if ! gh pr view "$docs_pr" --repo "$DOCS_REPO" --json statusCheckRollup \
    --jq '[.statusCheckRollup[]?.name] | index("Validate Docusaurus site")' | grep -qv null; then
    gh workflow run ci.yml --repo "$DOCS_REPO" --ref "$docs_branch" || true
  fi
  for _ in $(seq 1 60); do
    if ready_to_merge "$docs_pr" > /dev/null; then
      break
    fi
    sleep 30
  done
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
  merge_pr "$pin_number" || skipped=1
else
  echo "No open API pin pull request for $VERSION."
fi

milestone_number=$(gh api --paginate "repos/${DOCS_REPO}/milestones?state=open&per_page=100" \
  --jq ".[] | select(.title == \"$VERSION\") | .number" | head -n 1)
pr_numbers=""
if [ -n "$milestone_number" ]; then
  pr_numbers=$(gh api --paginate "repos/${DOCS_REPO}/issues?state=open&milestone=${milestone_number}&per_page=100" \
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

gh workflow run "Deploy to GitHub Pages" --repo "$DOCS_REPO" --ref main || echo "Deploy dispatch was not accepted. A token push to main still starts it."
echo "Docs for ChurchCRM $VERSION are merged."
