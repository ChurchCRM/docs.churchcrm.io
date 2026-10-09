#!/usr/bin/env bash
# Comment on open pull requests milestoned LATEST, once, that the CRM release is published.
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
: "${LATEST:?LATEST is required}"
: "${PIN_PR:?PIN_PR is required}"

marker="<!-- docs-release-ready:${LATEST} -->"
gh pr list --state open --limit 100 --json number,milestone \
  --jq ".[] | select(.milestone.title == \"$LATEST\") | .number" | while read -r number; do
    [ "$number" = "$PIN_PR" ] && continue
    if gh api "repos/${GITHUB_REPOSITORY}/issues/${number}/comments" --paginate --jq '.[].body' | grep -F "$marker" >/dev/null; then
      echo "Pull request #$number already marked ready for $LATEST."
      continue
    fi
    cat > /tmp/ready.md <<EOF
${marker}
ChurchCRM **${LATEST}** is published. This pull request can merge after the API pin in #${PIN_PR}.

The release gate stays red until that published release is visible to CI, then it goes green on the next run.
EOF
    gh pr comment "$number" --body-file /tmp/ready.md
  done
