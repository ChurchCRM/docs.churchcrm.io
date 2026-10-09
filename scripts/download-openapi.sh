#!/usr/bin/env bash
# Download the OpenAPI specs for the ChurchCRM release pinned in crm-release.json.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
version="$(jq -r '.version' "$root/crm-release.json")"

if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "crm-release.json version must be a stable semantic version, found: $version" >&2
  exit 1
fi

base="https://raw.githubusercontent.com/ChurchCRM/CRM/${version}/docs/openapi/generated"
mkdir -p "$root/openapi"

curl -fsSL "${base}/public-api.yaml" -o "$root/openapi/public-api.yaml"
curl -fsSL "${base}/private-api.yaml" -o "$root/openapi/private-api.yaml"
test -s "$root/openapi/public-api.yaml"
test -s "$root/openapi/private-api.yaml"

echo "Downloaded OpenAPI specs for ChurchCRM ${version}"
