# ChurchCRM Documentation

This repo powers **[docs.churchcrm.io](https://docs.churchcrm.io)** — the official user manual for [ChurchCRM](https://churchcrm.io).

Built with [Docusaurus](https://docusaurus.io/). Auto-deployed to GitHub Pages on every push to `main`.

## Local Development

```bash
npm install
npm run start   # live preview at http://localhost:3000
```

## Contributing

Click **"Edit this page"** at the bottom of any docs page to submit a PR directly from GitHub.

See [`.agents/DOCS_GUIDE.md`](.agents/DOCS_GUIDE.md) for full contributor and AI agent conventions.

## Structure

| Folder | Content |
|--------|---------|
| `docs/installation/` | Install guides (Linux, cPanel, Azure, SSL) |
| `docs/getting-started/` | First run setup, features overview |
| `docs/user-guide/` | How-to pages for People, Finance, Events, etc. |
| `docs/administration/` | Upgrades, backup, troubleshooting, FAQs |
| `docs/developers/` | Dev setup, contributing, code reference |
| `static/img/` | Screenshots and images |

## Deployment

Every push to `main` triggers `.github/workflows/deploy.yml` which builds and deploys to `gh-pages`.  
**Do not push directly to `gh-pages`.**

## License

MIT — same as the main [ChurchCRM project](https://github.com/ChurchCRM/CRM).
