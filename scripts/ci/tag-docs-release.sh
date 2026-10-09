#!/usr/bin/env bash
# Tag the current commit v<version> and point release/<version> at it.
set -euo pipefail

version=$(jq -r '.version' crm-release.json)
if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error::crm-release.json version must be a stable semantic version. Found: $version" >&2
  exit 1
fi

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

if git rev-parse "v${version}" >/dev/null 2>&1; then
  echo "Tag v${version} already exists."
else
  git tag -a "v${version}" -m "Docs for ChurchCRM ${version}"
  if ! git push origin "v${version}"; then
    git fetch origin "refs/tags/v${version}:refs/tags/v${version}"
    echo "Tag v${version} was created by another run."
  fi
fi

ref="refs/heads/release/${version}"
if git fetch origin "$ref"; then
  if git merge-base --is-ancestor FETCH_HEAD HEAD; then
    git push origin "HEAD:${ref}"
  else
    echo "release/${version} is not behind this commit. Leaving the branch where it is."
  fi
else
  git push origin "HEAD:${ref}"
fi
