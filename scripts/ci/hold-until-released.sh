#!/usr/bin/env bash
# Hold a product-doc pull request until its milestone is a published CRM release.
# Tooling pull requests omit the milestone and are not held.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${PR_NUMBER:?PR_NUMBER is required}"
: "${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"

milestone=$(gh api "repos/${GITHUB_REPOSITORY}/issues/${PR_NUMBER}" --jq '.milestone.title // ""')

if [ -z "$milestone" ]; then
  echo "No release milestone: not holding this pull request."
  exit 0
fi

if ! [[ "$milestone" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error::Product documentation milestones must be semantic versions such as 7.7.1. Found: $milestone"
  exit 1
fi

echo "Docs target release: $milestone"
release=$(curl -fsSL "https://api.github.com/repos/ChurchCRM/CRM/releases/tags/${milestone}" || true)
published=$(printf '%s' "$release" | jq -r '.published_at // empty')
draft=$(printf '%s' "$release" | jq -r '.draft // true')
prerelease=$(printf '%s' "$release" | jq -r '.prerelease // true')

if [ -z "$published" ] || [ "$draft" = "true" ] || [ "$prerelease" = "true" ]; then
  echo "::error::ChurchCRM ${milestone} is not a published stable release. Leave this pull request open until that release exists."
  exit 1
fi

echo "ChurchCRM ${milestone} was published at ${published}. This pull request may merge."
