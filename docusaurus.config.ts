import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';
import crmRelease from './crm-release.json';
// @ts-ignore — no types shipped with this plugin
const localSearch = require('@easyops-cn/docusaurus-search-local');

const openApiSpec = (file: string) =>
  `https://raw.githubusercontent.com/ChurchCRM/CRM/${crmRelease.version}/docs/openapi/generated/${file}`;

const config: Config = {
  title: 'ChurchCRM Docs',
  tagline: 'Our ministry: open-source, community-built, freely given.',
  favicon: 'https://churchcrm.io/media/favicon-32x32.png',

  headTags: [
    { tagName: 'link', attributes: { rel: 'icon', type: 'image/png', sizes: '16x16', href: 'https://churchcrm.io/media/favicon-16x16.png' } },
    { tagName: 'link', attributes: { rel: 'apple-touch-icon', sizes: '180x180', href: 'https://churchcrm.io/media/apple-touch-icon.png' } },
    { tagName: 'link', attributes: { rel: 'manifest', href: 'https://churchcrm.io/site.webmanifest' } },
  ],

  url: 'https://docs.churchcrm.io',
  baseUrl: '/',
  organizationName: 'ChurchCRM',
  projectName: 'docs.churchcrm.io',
  deploymentBranch: 'gh-pages',
  trailingSlash: false,
  onBrokenLinks: 'throw',
  onBrokenAnchors: 'throw',
  markdown: {
    hooks: {
      onBrokenMarkdownLinks: 'throw',
    },
  },
  i18n: { defaultLocale: 'en', locales: ['en'] },

  plugins: [
    [localSearch, { hashed: true, language: ['en'], docsRouteBasePath: '/', highlightSearchTermsOnTargetPage: true, explicitSearchResultPath: true }],
    ['@docusaurus/plugin-google-gtag', { trackingID: 'G-HDZJHBTJ11' }],
    ['docusaurus-plugin-openapi-docs', {
      id: 'churchcrm-api',
      docsPluginId: 'classic',
      config: {
        publicApi: {
          specPath: 'openapi/public-api.yaml', outputDir: 'docs/api/public',
          sidebarOptions: { groupPathsBy: 'tag', categoryLinkSource: 'tag' },
          downloadUrl: openApiSpec('public-api.yaml'), showSchemas: true,
        },
        privateApi: {
          specPath: 'openapi/private-api.yaml', outputDir: 'docs/api/private',
          sidebarOptions: { groupPathsBy: 'tag', categoryLinkSource: 'tag' },
          downloadUrl: openApiSpec('private-api.yaml'), showSchemas: true,
        },
      },
    }],
  ],

  presets: [['classic', {
    docs: {
      sidebarPath: './sidebars.ts', routeBasePath: '/',
      editUrl: 'https://github.com/ChurchCRM/docs.churchcrm.io/edit/main/',
      showLastUpdateTime: true, showLastUpdateAuthor: false, docItemComponent: '@theme/ApiItem',
    },
    blog: false,
    theme: { customCss: './src/css/custom.css' },
  } satisfies Preset.Options]],

  themes: ['docusaurus-theme-openapi-docs'],

  themeConfig: {
    image: 'https://cdn.churchcrm.io/screenshots/en/desktop/dashboard-hero.png',
    colorMode: { defaultMode: 'light', disableSwitch: false, respectPrefersColorScheme: true },
    navbar: {
      title: 'ChurchCRM Docs',
      logo: {
        alt: 'ChurchCRM', src: 'https://churchcrm.io/media/brand/churchcrm-logo-ink-blue.svg',
        srcDark: 'https://churchcrm.io/media/brand/churchcrm-logo-paper-blue.svg', width: 120, height: 40,
      },
      items: [
        { type: 'docSidebar', sidebarId: 'gettingStartedSidebar', position: 'left', label: 'Getting Started' },
        { type: 'docSidebar', sidebarId: 'userGuideSidebar', position: 'left', label: 'User Guide' },
        { type: 'docSidebar', sidebarId: 'adminSidebar', position: 'left', label: 'Administration' },
        { type: 'docSidebar', sidebarId: 'apiSidebar', position: 'left', label: 'API Reference' },
        { href: `https://github.com/ChurchCRM/CRM/releases/tag/${crmRelease.version}`, label: `ChurchCRM ${crmRelease.version}`, position: 'right' },
        { href: 'https://churchcrm.io/install.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=navbar_install', label: 'Install', position: 'right' },
        { href: 'https://churchcrm.io/demo.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=navbar_demo', label: 'Demo', position: 'right' },
        { href: 'https://churchcrm.io/connect.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=navbar_connect', label: 'Connect', position: 'right' },
        { href: 'https://github.com/ChurchCRM/CRM', label: 'GitHub', position: 'right' },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        { title: 'Docs', items: [
          { label: 'Installation Guide', to: '/installation' }, { label: 'First Run Setup', to: '/getting-started/first-run' },
          { label: 'User Guide', to: '/user-guide' }, { label: 'Troubleshooting', to: '/administration/troubleshooting' },
        ] },
        { title: 'API Reference', items: [
          { label: 'Public API', to: '/api/public' }, { label: 'Private API', to: '/api/private' },
        ] },
        { title: 'Need help?', items: [
          { label: "Can't find it? Ask on Discord", href: 'https://discord.gg/tuWyFzj3Nj' },
          { label: 'Or open a GitHub issue', href: 'https://github.com/ChurchCRM/CRM/issues/new/choose' },
        ] },
        { title: 'ChurchCRM', items: [
          { label: 'Website', href: 'https://churchcrm.io/?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=footer_website' }, { label: 'Install', href: 'https://churchcrm.io/install.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=footer_install' }, { label: 'Demo', href: 'https://churchcrm.io/demo.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=footer_demo' },
          { label: 'Connect', href: 'https://churchcrm.io/connect.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=footer_connect' }, { label: 'GitHub', href: 'https://github.com/ChurchCRM/CRM' },
          { label: 'Releases', href: 'https://github.com/ChurchCRM/CRM/releases' },
        ] },
      ],
      copyright: `These docs describe ChurchCRM ${crmRelease.version}, the latest release. Copyright © ${new Date().getFullYear()} ChurchCRM. Released under MIT License.`,
    },
    prism: {
      theme: prismThemes.github, darkTheme: prismThemes.dracula,
      additionalLanguages: ['bash', 'php', 'sql', 'nginx', 'apacheconf'],
    },
    languageTabs: [
      { highlight: 'bash', language: 'curl', logoClass: 'bash' },
      { highlight: 'javascript', language: 'nodejs', logoClass: 'nodejs' },
      { highlight: 'php', language: 'php', logoClass: 'php' },
      { highlight: 'python', language: 'python', logoClass: 'python' },
    ],
  } satisfies Preset.ThemeConfig,
};

export default config;
