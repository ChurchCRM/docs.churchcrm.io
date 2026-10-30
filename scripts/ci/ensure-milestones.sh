#!/usr/bin/env bash
# Create any missing docs-repo milestones named in VERSIONS (space-separated): Current and the upcoming versions.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
: "${VERSIONS:?VERSIONS is required}"

for version in $VERSIONS; do
  existing=$(gh api --paginate "repos/${GITHUB_REPOSITORY}/milestones?state=all&per_page=100" \
    --jq ".[] | select(.title == \"$version\") | .number" | head -n 1)
  if [ -n "$existing" ]; then
    echo "Milestone $version already exists as #$existing"
    continue
  fi
  number=$(gh api "repos/${GITHUB_REPOSITORY}/milestones" \
    --method POST \
    -f title="$version" \
    -f description="$(case "$version" in Current) echo 'Docs for the latest published ChurchCRM release. The only milestone that may merge into main.';; *) echo "Docs for ChurchCRM $version. Merges into release-docs/$version, never main.";; esac)" \
    --jq '.number')
  echo "Created milestone $version as #$number"
done
