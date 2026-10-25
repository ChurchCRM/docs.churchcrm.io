#!/usr/bin/env bash
# Only product-doc pull requests milestoned Current may merge into main.
# Every other milestone (an upcoming version such as 7.8.3, or none) is blocked: that work merges into release-docs/<version>.
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

if [ "$milestone" = "Current" ]; then
  echo "Milestone is Current. Product docs may merge into main."
  exit 0
fi

echo "::error::Only pull requests milestoned Current may merge into main (this one: ${milestone:-none})."
echo "Docs for an unreleased version merge into release-docs/<version> and reach main when the release is published."
echo "If this is repository-only maintenance, apply one of: infrastructure, dependencies, ci, repo-maintenance."
exit 1
