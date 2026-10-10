#!/usr/bin/env bash
# Print the docs milestones to ensure, one version per line.
# REQUESTED_VERSION, when set, is the only version. Otherwise use CRM package.json and the latest stable release.
# Also appends versions=<space-separated> to GITHUB_OUTPUT when that file is set.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"

add() {
  local version="$1"
  if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "::error::Invalid version: $version" >&2
    exit 1
  fi
  case " ${versions} " in
    *" ${version} "*) ;;
    *) versions="${versions} ${version}" ;;
  esac
}

versions=""
if [ -n "${REQUESTED_VERSION:-}" ]; then
  add "$REQUESTED_VERSION"
else
  add "$(curl -fsSL https://raw.githubusercontent.com/ChurchCRM/CRM/master/package.json | jq -r '.version')"
  add "$(gh api repos/ChurchCRM/CRM/releases/latest --jq '.tag_name')"
fi

versions="${versions# }"
echo "Milestones to ensure: ${versions}" >&2
printf '%s\n' $versions
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "versions=${versions}" >> "$GITHUB_OUTPUT"
fi
