#!/usr/bin/env bash
# Release gate for product-doc pull requests, decided by target branch:
# - main: only pull requests milestoned Current may merge in. Every other milestone
#   (an upcoming version such as 7.8.4, or none) is blocked: that work merges into
#   release-docs/<version>.
# - release-docs/<version>: only pull requests milestoned <version> may merge in.
# - any other base branch: the gate does not apply.
# Maintenance pull requests labeled infrastructure, dependencies, ci, or repo-maintenance skip the check.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${DOCS_REPO:?DOCS_REPO is required}"
CRM_REPO="${CRM_REPO:-ChurchCRM/CRM}"

# workflow_dispatch has no pull_request payload. The publish job starts that event
# on the release branch, so use the open pull request into main for this ref.
if [ -z "${PR_NUMBER:-}" ] && [ -n "${GITHUB_REF_NAME:-}" ]; then
  PR_NUMBER=$(gh pr list --repo "$DOCS_REPO" --head "$GITHUB_REF_NAME" --base main --state open \
    --json number --jq '.[0].number // ""')
  if [ -n "$PR_NUMBER" ]; then
    echo "Using open pull request #$PR_NUMBER for ${GITHUB_REF_NAME}."
    # That pull request targets main by construction.
    BASE_REF="${BASE_REF:-main}"
  fi
fi

if [ -z "${PR_NUMBER:-}" ]; then
  echo "No pull request context; nothing to validate."
  exit 0
fi

# The workflow passes the pull request base ref; discover it when run another way.
if [ -z "${BASE_REF:-}" ]; then
  BASE_REF=$(gh api "repos/$DOCS_REPO/pulls/$PR_NUMBER" --jq '.base.ref // ""')
fi

milestone=$(gh api "repos/$DOCS_REPO/issues/$PR_NUMBER" --jq '.milestone.title // ""')
labels=$(gh api "repos/$DOCS_REPO/issues/$PR_NUMBER" --jq '[.labels[].name] | join(",")')

echo "Base: ${BASE_REF:-<unknown>}"
echo "Milestone: ${milestone:-<none>}"
echo "Labels: ${labels:-<none>}"

if echo ",$labels," | grep -qiE ',(infrastructure|dependencies|ci|repo-maintenance),'; then
  echo "Repository-only change: release gate not required."
  exit 0
fi

case "${BASE_REF:-}" in
  ""|main)
    if [ "$milestone" = "Current" ]; then
      echo "Milestone is Current. Product docs may merge into main."
      exit 0
    fi
    echo "::error::Only pull requests milestoned Current may merge into main (this one: ${milestone:-none})."
    echo "Docs for an unreleased version merge into release-docs/<version> and reach main when the release is published."
    echo "If this is repository-only maintenance, apply one of: infrastructure, dependencies, ci, repo-maintenance."
    exit 1
    ;;
  release-docs/*)
    version="${BASE_REF#release-docs/}"
    if [ "$milestone" = "$version" ]; then
      echo "Milestone matches $BASE_REF. Product docs may merge into $BASE_REF."
      exit 0
    fi
    echo "::error::Pull requests into $BASE_REF must be milestoned $version (this one: ${milestone:-none})."
    echo "Docs for released software merge into main with milestone Current; docs for $version merge into $BASE_REF with milestone $version."
    echo "If this is repository-only maintenance, apply one of: infrastructure, dependencies, ci, repo-maintenance."
    exit 1
    ;;
  *)
    echo "Base branch $BASE_REF is not a gated branch: release gate not applicable."
    exit 0
    ;;
esac
