#!/usr/bin/env bash
# Require a published CRM release for product-doc pull requests.
# Maintenance pull requests labeled infrastructure, dependencies, ci, or repo-maintenance skip the check.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${DOCS_REPO:?DOCS_REPO is required}"
CRM_REPO="${CRM_REPO:-ChurchCRM/CRM}"

if [ -z "${PR_NUMBER:-}" ]; then
  echo "No pull request context; nothing to validate."
  exit 0
fi

milestone=$(gh api "repos/$DOCS_REPO/issues/$PR_NUMBER" --jq '.milestone.title // ""')
labels=$(gh api "repos/$DOCS_REPO/issues/$PR_NUMBER" --jq '[.labels[].name] | join(",")')

echo "Milestone: ${milestone:-<none>}"
echo "Labels: ${labels:-<none>}"

if echo ",$labels," | grep -qiE ',(infrastructure|dependencies|ci|repo-maintenance),'; then
  echo "Repository-only change: release gate not required."
  exit 0
fi

if [ -z "$milestone" ]; then
  echo "::error::Product documentation PRs require a release milestone matching the CRM release."
  echo "If this is repository-only maintenance, apply one of: infrastructure, dependencies, ci, repo-maintenance."
  exit 1
fi

if ! echo "$milestone" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "::error::Docs milestone '$milestone' is not a ChurchCRM release version (x.y.z)."
  exit 1
fi

release=$(gh api "repos/$CRM_REPO/releases/tags/$milestone" 2>/dev/null || true)
if [ -z "$release" ]; then
  echo "::error::ChurchCRM $milestone has not been released. Keep this docs PR open until the CRM release is published."
  exit 1
fi

draft=$(echo "$release" | jq -r '.draft')
prerelease=$(echo "$release" | jq -r '.prerelease')
if [ "$draft" = "true" ] || [ "$prerelease" = "true" ]; then
  echo "::error::ChurchCRM $milestone is not a production release yet (draft=$draft, prerelease=$prerelease)."
  exit 1
fi

echo "ChurchCRM $milestone is published. Product docs may merge."
