// Screenshots and videos are not stored in this repo. They live on https://cdn.churchcrm.io
// (ChurchCRM/visuals, one set per release) and pages link to them there.
//
// 1. No image or video file may be tracked, except the shrinking list in
//    scripts/legacy-screenshots.txt.
// 2. A page may not link a missing local image, or the old churchcrm.io/images copy.
// 3. Every cdn.churchcrm.io image or video a page links must be in the CDN manifest.
//    Unreleased features are not on the CDN yet, so this only warns on release-docs/*
//    pull requests and fails on main (BASE_REF=main) or STRICT=1.
import { execFileSync } from 'node:child_process';
import { readFileSync } from 'node:fs';

const CDN = 'https://cdn.churchcrm.io';
const strict = process.env.BASE_REF === 'main' || process.env.STRICT === '1';
const errors = [];
const warnings = [];

const tracked = execFileSync('git', ['ls-files'], { encoding: 'utf8' }).split('\n').filter(Boolean);
const legacy = new Set(
  readFileSync('scripts/legacy-screenshots.txt', 'utf8')
    .split('\n').map((l) => l.trim()).filter((l) => l && !l.startsWith('#')),
);

for (const f of tracked.filter((t) => /\.(png|jpe?g|gif|webp|webm|mp4)$/i.test(t))) {
  if (!legacy.has(f)) errors.push(`${f}: screenshots are not stored here. Add a capture in ChurchCRM/CRM and link ${CDN}/screenshots/en/desktop/<name>.png`);
}
for (const f of legacy) {
  if (!tracked.includes(f)) errors.push(`scripts/legacy-screenshots.txt lists ${f}, which no longer exists. Remove the line.`);
}

const cdnPaths = new Map();
for (const page of tracked.filter((t) => t.startsWith('docs/') && /\.mdx?$/.test(t))) {
  const text = readFileSync(page, 'utf8');
  for (const m of text.matchAll(/!\[[^\]]*\]\(([^)\s]+)/g)) {
    const url = m[1];
    if (url.startsWith('/img/')) {
      if (!legacy.has(`static${url}`)) errors.push(`${page}: ${url} is not in the repo. Link the capture on ${CDN} instead.`);
    } else if (/^https?:\/\/(www\.)?churchcrm\.io\/images\//.test(url)) {
      errors.push(`${page}: ${url} is the website's copy. Use ${CDN}/screenshots/en/desktop/<name>.png`);
    } else if (url.startsWith(`${CDN}/`)) {
      const path = url.slice(CDN.length + 1).split(/[?#]/)[0];
      cdnPaths.set(path, [...(cdnPaths.get(path) ?? []), page]);
    }
  }
}

if (cdnPaths.size) {
  let published;
  try {
    const res = await fetch(`${CDN}/manifest.json`, { signal: AbortSignal.timeout(20000) });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    published = new Set((await res.json()).map((e) => e.relativePath));
  } catch (e) {
    warnings.push(`Could not read ${CDN}/manifest.json (${e.message}); CDN links were not checked.`);
  }
  if (published) {
    for (const [path, pages] of cdnPaths) {
      if (!published.has(path)) {
        (strict ? errors : warnings).push(`${pages[0]}: ${CDN}/${path} is not on the CDN yet${pages.length > 1 ? ` (and ${pages.length - 1} more pages)` : ''}`);
      }
    }
  }
}

for (const w of warnings) console.log(`::warning::${w}`);
for (const e of errors) console.log(`::error::${e}`);
console.log(`${tracked.filter((t) => /\.(png|jpe?g|gif|webp|webm|mp4)$/i.test(t)).length} image files tracked (${legacy.size} legacy), ${cdnPaths.size} CDN links, ${errors.length} errors, ${warnings.length} warnings.`);
process.exit(errors.length ? 1 : 0);
