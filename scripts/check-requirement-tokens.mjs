import {readdirSync, readFileSync, statSync} from 'node:fs';
import {join} from 'node:path';

const TOKEN = /@@\w+@@/;
const leaks = [];

function scan(dir) {
  for (const name of readdirSync(dir)) {
    const path = join(dir, name);
    if (statSync(path).isDirectory()) {
      scan(path);
    } else if (/\.(html|json|js|xml|txt)$/.test(name) && TOKEN.test(readFileSync(path, 'utf8'))) {
      leaks.push(path);
    }
  }
}

scan('build');
if (leaks.length) {
  console.error(`Unfilled requirement tokens in the build:\n${leaks.map((file) => `  ${file}`).join('\n')}`);
  console.error('Tokens in a page\'s first paragraph reach the meta description and search index. Add a "description:" to that page\'s front matter that has no token.');
  process.exit(1);
}
