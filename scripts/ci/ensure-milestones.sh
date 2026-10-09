#!/usr/bin/env bash
# Create any missing docs-repo milestones named in VERSIONS (space-separated).
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
: "${VERSIONS:?VERSIONS is required}"

for version in $VERSIONS; do
  existing=$(gh api "repos/${GITHUB_REPOSITORY}/milestones?state=all&per_page=100" \
    --jq ".[] | select(.title == \"$version\") | .number" | head -n 1)
  if [ -n "$existing" ]; then
    echo "Milestone $version already exists as #$existing"
    continue
  fi
  number=$(gh api "repos/${GITHUB_REPOSITORY}/milestones" \
    --method POST \
    -f title="$version" \
    -f description="Documentation for ChurchCRM $version. Product docs may merge only after this CRM release is published. The API reference moves to this version when the pin PR merges." \
    --jq '.number')
  echo "Created milestone $version as #$number"
done
