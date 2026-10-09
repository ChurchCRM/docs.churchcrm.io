#!/usr/bin/env bash
# Compare crm-release.json with the latest stable ChurchCRM release.
# Writes pinned, latest, and behind to GITHUB_OUTPUT when that file is set.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"

pinned=$(jq -r '.version' crm-release.json)
latest=$(gh api repos/ChurchCRM/CRM/releases/latest --jq '.tag_name')
draft=$(gh api repos/ChurchCRM/CRM/releases/latest --jq '.draft')
prerelease=$(gh api repos/ChurchCRM/CRM/releases/latest --jq '.prerelease')

if [ "$draft" = "true" ] || [ "$prerelease" = "true" ]; then
  echo "::error::Latest CRM release is not a stable release." >&2
  exit 1
fi
if ! [[ "$latest" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error::Unexpected CRM release tag: $latest" >&2
  exit 1
fi

behind=false
if [ "$pinned" = "$latest" ]; then
  echo "Docs already pin ChurchCRM ${pinned}."
elif [ "$(printf '%s\n%s\n' "$pinned" "$latest" | sort -V | tail -n 1)" != "$latest" ]; then
  echo "::error::Pinned version ${pinned} is newer than the latest CRM release ${latest}." >&2
  exit 1
else
  behind=true
  echo "ChurchCRM ${latest} is published. Docs still pin ${pinned}."
fi

if [ -n "${GITHUB_OUTPUT:-}" ]; then
  {
    echo "pinned=$pinned"
    echo "latest=$latest"
    echo "behind=$behind"
  } >> "$GITHUB_OUTPUT"
fi
