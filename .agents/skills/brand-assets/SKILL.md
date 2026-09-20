---
name: brand-assets
description: Maintain ChurchCRM logos, favicons, app icons, manifests, social-preview images, and other shared visual identity references across the docs and marketing sites. Use when changing Docusaurus branding or shared image metadata.
---

# ChurchCRM Brand Assets

Keep shared visual identity consistent without duplicating files across repositories.

## Sources of truth

| Repository | Authority |
|---|---|
| `ChurchCRM/marketing` | Approved marketing strategy, brand direction, and asset-governance decisions |
| `ChurchCRM/ChurchCRM.io` | Canonical published logos, favicons, app icons, web manifest, shared social-preview assets, and reusable product screenshots |
| `ChurchCRM/CRM` | Shipped product behavior and authentic product-generated screenshots |
| `ChurchCRM/docs.churchcrm.io` | Documentation-specific screenshots and references to canonical shared assets |

## Rules

- Reference shared brand assets from `https://churchcrm.io/` in `docusaurus.config.ts`; do not copy them into `static/img/`.
- Use the approved `CHURCH | CRM` wordmarks. Do not redraw, recolor, or generate a logo.
- Use the ink/blue wordmark on light surfaces and the paper/blue wordmark on dark surfaces.
- Reuse current screenshots from `https://churchcrm.io/images/screenshots/` when they show the documented workflow.
- Keep a documentation-specific screenshot local only when no suitable canonical website image exists and it needs to evolve with the instructions.
- Use authentic CRM screenshots for product UI. Do not generate or mock product screens.
- Before changing a canonical URL, confirm that the replacement is already deployed on the website and update all consumers in the same coordinated change.
- Treat missing shared artwork as an asset request for the website/marketing workflow, not permission to invent a replacement in the docs repository.

## Current canonical references

- Light wordmark: `https://churchcrm.io/media/brand/churchcrm-logo-ink-blue.svg`
- Dark wordmark: `https://churchcrm.io/media/brand/churchcrm-logo-paper-blue.svg`
- Favicons and touch icon: `https://churchcrm.io/media/`
- Web manifest: `https://churchcrm.io/site.webmanifest`
- Default product preview: `https://churchcrm.io/images/screenshots/desktop/dashboard-hero.png`
- Product screenshot library: `https://churchcrm.io/images/screenshots/{desktop,tablet,mobile}/`

Validate with `npm run typecheck` and `npm run build`. Inspect the generated HTML to confirm metadata contains absolute `https://churchcrm.io/` asset URLs and no removed local logo or favicon paths.
