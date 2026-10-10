# /pr-review

Review a docs.churchcrm.io pull request.

**Arguments:** a PR number or URL. If omitted, use the PR already in context.

Read in order:

1. `.agents/DOCS_GUIDE.md`
2. `.agents/skills/pr-review/SKILL.md`

## Rules

- Draft in chat first. Do not post until a maintainer says to post.
- Do not approve. Do not merge.
- Hard blocks → Request changes. Everything else → Comment.
- Base branch: product docs for a version that is not published go to `release-docs/<version>`, not `main`. `main` is only for fixes to a published version and for repo maintenance.
- Milestone and labels: a product PR has the version milestone and no maintenance label. A maintenance PR has no milestone and one of `ci`, `repo-maintenance`, `infrastructure`, `dependencies`.
- Check each fact against the CRM code for that version (the release tag, or `master` for a merged change): menu paths, setting labels, defaults, accepted file formats. Say which file you checked.
- Search the other pages for the same fact. Release docs are written by several PRs at once, so the same format list, path or default often disagrees between pages.
- A product PR names its CRM docs tracking issue as `Closes ChurchCRM/CRM#N`. After the PR merges into the release branch, a maintainer must manually close the issue.
- No image or video files. A screenshot is a link to `https://cdn.churchcrm.io/screenshots/en/desktop/<name>.png`. Check the name against `https://cdn.churchcrm.io/manifest.json`; if it is not there yet, find the capture (a CRM spec or the CRM capture issue) and say so.
- No "since x.y.z" or "new in x.y.z" wording (the site states which release the docs match), no developer material.
- Posted reviews include a checkbox list of what is still open.
- Be thankful. Do not nitpick wording that is correct.
