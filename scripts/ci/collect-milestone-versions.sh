#!/usr/bin/env bash
# Print the docs milestones to ensure, one per line: Current (documents the latest published release;
# the only milestone that may merge into main) and one x.y.z milestone for each upcoming CRM version
# (the open CRM x.y.z milestones newer than the latest stable release, for example a patch and a minor).
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
CRM_REPO="${CRM_REPO:-ChurchCRM/CRM}"

latest=$(gh api "repos/$CRM_REPO/releases/latest" --jq '.tag_name')
milestones="Current"
while read -r title; do
  [[ "$title" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || continue
  [ "$(printf '%s\n%s\n' "$latest" "$title" | sort -V | tail -n 1)" = "$title" ] || continue
  [ "$title" = "$latest" ] && continue
  milestones="${milestones} ${title}"
done < <(gh api --paginate "repos/$CRM_REPO/milestones?state=open&per_page=100" --jq '.[].title' | sort -V)

echo "Milestones to ensure: ${milestones}" >&2
printf '%s\n' $milestones
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "versions=${milestones}" >> "$GITHUB_OUTPUT"
fi
