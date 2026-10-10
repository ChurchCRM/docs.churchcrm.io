# ChurchCRM Documentation

This repo powers **[docs.churchcrm.io](https://docs.churchcrm.io)** — the official user, administrator, installation, and developer documentation for free, open-source [ChurchCRM](https://churchcrm.io/?utm_source=github&utm_medium=referral&utm_campaign=github_content&utm_content=docs_readme_website).

Built with [Docusaurus](https://docusaurus.io/). Auto-deployed to GitHub Pages on every push to `main`.

## Local Development

```bash
npm install
npm run start   # live preview at http://localhost:3000
```

## Contributing

Click **"Edit this page"** at the bottom of any docs page to submit a PR directly from GitHub.

Humans: [Docs workflow](docs/workflow.md). Agents: [`.agents/DOCS_GUIDE.md`](.agents/DOCS_GUIDE.md). Product docs use a release milestone and stay open until that ChurchCRM version is published. Site and CI changes use the `ci` label and no milestone.

## Structure

| Folder | Content |
|--------|---------|
| `docs/installation/` | Install guides (Linux, cPanel, Azure, SSL) |
| `docs/getting-started/` | First run setup, features overview |
| `docs/user-guide/` | How-to pages for People, Finance, Events, etc. |
| `docs/administration/` | Upgrades, backup, troubleshooting, FAQs |
| `docs/api/` | Generated public and private API reference |
| `docs/contributing.md` | How to contribute to the docs |
| `static/img/` | Screenshots and images |

## Asset Ownership

The marketing website is the single source for shared ChurchCRM logos, favicons, app icons, the web manifest, the default social-preview image, and reusable product screenshots. This docs site references those assets from `https://churchcrm.io/` instead of keeping copies that can drift.

Keep only documentation-specific screenshots and diagrams with no suitable canonical website equivalent in `static/img/`. Marketing strategy belongs in `ChurchCRM/marketing`; shared brand assets and reusable product screenshots belong in `ChurchCRM/ChurchCRM.io`; shipped product behavior belongs in `ChurchCRM/CRM`.

## API reference version

The public API reference follows the ChurchCRM release in `crm-release.json`, currently the latest published release. Builds download that tag's OpenAPI specs. They do not track `master`.

Product documentation for a version that is not released yet stays in an open pull request with that version's milestone. When the CRM release is published, automation opens a pull request to move the pin, then those staged pull requests can merge. The published docs commit is tagged `v<version>` and branched as `release/<version>`.

## Deployment

Every push to `main` triggers `.github/workflows/deploy.yml` which builds and deploys to `gh-pages`.  
**Do not push directly to `gh-pages`.**

## License

MIT — same as the main [ChurchCRM project](https://github.com/ChurchCRM/CRM).
