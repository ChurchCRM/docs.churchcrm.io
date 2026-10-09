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
  git push origin "v${version}"
fi

ref="refs/heads/release/${version}"
if git fetch origin "$ref"; then
  git push --force-with-lease="${ref}:$(git rev-parse FETCH_HEAD)" origin "HEAD:${ref}"
else
  git push origin "HEAD:${ref}"
fi
