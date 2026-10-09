#!/usr/bin/env bash
# Open the pull request that moves crm-release.json to LATEST.
# Writes number to GITHUB_OUTPUT when that file is set.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${LATEST:?LATEST is required}"

branch="release/${LATEST}"
existing=$(gh pr list --base main --head "$branch" --state open --json number --jq '.[0].number // ""')
if [ -n "$existing" ]; then
  echo "Pin pull request #$existing is already open."
  if [ -n "${GITHUB_OUTPUT:-}" ]; then
    echo "number=$existing" >> "$GITHUB_OUTPUT"
  fi
  exit 0
fi

git checkout -B "$branch"
jq --arg version "$LATEST" '.version = $version' crm-release.json > crm-release.json.tmp
mv crm-release.json.tmp crm-release.json
git add crm-release.json
git -c user.name="github-actions[bot]" -c user.email="41898282+github-actions[bot]@users.noreply.github.com" \
  commit -m "Pin API docs to ChurchCRM ${LATEST}."

if git fetch origin "refs/heads/${branch}"; then
  git push --force-with-lease="refs/heads/${branch}:$(git rev-parse FETCH_HEAD)" origin "HEAD:refs/heads/${branch}"
else
  git push origin "HEAD:refs/heads/${branch}"
fi

cat > /tmp/pin-pr.md <<EOF
## Summary

- Move \`crm-release.json\` to **${LATEST}**.
- CI and the live site download OpenAPI specs from tag \`${LATEST}\`, not from \`master\`.
- After this merges, \`v${LATEST}\` and \`release/${LATEST}\` point at the published docs commit.

Merge this before product-doc pull requests milestoned ${LATEST}.
EOF

url=$(gh pr create --base main --head "$branch" \
  --title "Publish docs for ChurchCRM ${LATEST}" \
  --body-file /tmp/pin-pr.md)
number=${url##*/}
echo "Opened pin pull request #$number"
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "number=$number" >> "$GITHUB_OUTPUT"
fi
