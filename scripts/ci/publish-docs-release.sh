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

if [ "$MERGE" != "true" ]; then
  echo "MERGE is not true. The pin pull request is staged and will merge when the release is published."
  exit 0
fi

ready_to_merge() {
  local number="$1"
  local pending rabbit
  pending=$(gh pr view "$number" --repo "$DOCS_REPO" --json statusCheckRollup \
    --jq '[.statusCheckRollup[]? | select(.name != null and (.status != "COMPLETED" or .conclusion != "SUCCESS"))] | length')
  rabbit=$(gh api --paginate "repos/${DOCS_REPO}/pulls/${number}/reviews" \
    --jq '[.[] | select(.user.login=="coderabbitai")] | last | .state // "NONE"')
  if [ "$pending" != "0" ]; then
    echo "Pull request #$number is not merged. A CI check is missing or not successful."
    return 1
  fi
  if [ "$rabbit" != "APPROVED" ]; then
    echo "Pull request #$number is not merged. CodeRabbit review is ${rabbit}."
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

pin_branch="release/${VERSION}"
pin_number=$(gh pr list --repo "$DOCS_REPO" --base main --head "$pin_branch" --state open --json number --jq '.[0].number // ""')
skipped=0
if [ -n "$pin_number" ]; then
  merge_pr "$pin_number" || skipped=1
else
  echo "No open API pin pull request for $VERSION."
fi

while read -r number; do
  [ -z "$number" ] && continue
  [ "$number" = "$pin_number" ] && continue
  merge_pr "$number" || skipped=1
done < <(gh pr list --repo "$DOCS_REPO" --state open --limit 100 --json number,milestone,isDraft \
  --jq ".[] | select(.isDraft == false and .milestone.title == \"$VERSION\") | .number")

if [ "$skipped" -ne 0 ]; then
  echo "::error::At least one docs pull request is waiting for CI or a CodeRabbit approval."
  exit 1
fi

gh workflow run "Deploy to GitHub Pages" --repo "$DOCS_REPO" --ref main || echo "Deploy dispatch was not accepted. A token push to main still starts it."
echo "Docs for ChurchCRM $VERSION are merged."
