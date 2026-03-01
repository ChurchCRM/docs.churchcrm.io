import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';
// @ts-ignore — no types shipped with this plugin
const localSearch = require('@easyops-cn/docusaurus-search-local');

const config: Config = {
  title: 'ChurchCRM Docs',
  tagline: 'Free & Open-Source Church Management Software',
  favicon: 'img/favicon.ico',

  url: 'https://docs.churchcrm.io',
  baseUrl: '/',

  organizationName: 'ChurchCRM',
  projectName: 'docs.churchcrm.io',
  deploymentBranch: 'gh-pages',
  trailingSlash: false,

  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  plugins: [
    [
      localSearch,
      {
        hashed: true,
        language: ['en'],
        docsRouteBasePath: '/',
        highlightSearchTermsOnTargetPage: true,
        explicitSearchResultPath: true,
      },
    ],
    [
      '@docusaurus/plugin-google-gtag',
      {
        trackingID: 'G-4F7K8Z3T5J',
      },
    ],
    [
      'docusaurus-plugin-openapi-docs',
      {
        id: 'churchcrm-api',
        docsPluginId: 'classic',
        config: {
          publicApi: {
            specPath: 'openapi/public-api.yaml',
            outputDir: 'docs/api/public',
            sidebarOptions: {
              groupPathsBy: 'tag',
              categoryLinkSource: 'tag',
            },
            downloadUrl:
              'https://raw.githubusercontent.com/ChurchCRM/CRM/master/openapi/public-api.yaml',
            showSchemas: true,
          },
          privateApi: {
            specPath: 'openapi/private-api.yaml',
            outputDir: 'docs/api/private',
            sidebarOptions: {
              groupPathsBy: 'tag',
              categoryLinkSource: 'tag',
            },
            downloadUrl:
              'https://raw.githubusercontent.com/ChurchCRM/CRM/master/openapi/private-api.yaml',
            showSchemas: true,
          },
        },
      },
    ],
  ],

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          routeBasePath: '/', // Docs at root, not /docs/
          editUrl: 'https://github.com/ChurchCRM/docs.churchcrm.io/edit/main/',
          showLastUpdateTime: false,
          showLastUpdateAuthor: false,
          docItemComponent: '@theme/ApiItem',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themes: ['docusaurus-theme-openapi-docs'],

  themeConfig: {
    image: 'img/churchcrm-social.png',
    colorMode: {
      defaultMode: 'light',
      disableSwitch: false,
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: 'ChurchCRM Docs',
      logo: {
        alt: 'ChurchCRM Logo',
        src: 'img/logo.png',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'gettingStartedSidebar',
          position: 'left',
          label: 'Getting Started',
        },
        {
          type: 'docSidebar',
          sidebarId: 'userGuideSidebar',
          position: 'left',
          label: 'User Guide',
        },
        {
          type: 'docSidebar',
          sidebarId: 'adminSidebar',
          position: 'left',
          label: 'Administration',
        },
        {
          type: 'docSidebar',
          sidebarId: 'apiSidebar',
          position: 'left',
          label: 'API Reference',
        },
        {
          href: 'https://demo.churchcrm.io',
          label: 'Demo',
          position: 'right',
        },
        {
          href: 'https://churchcrm.io/connect.html',
          label: 'Connect',
          position: 'right',
        },
        {
          href: 'https://github.com/ChurchCRM/CRM',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            { label: 'Installation Guide', to: '/installation' },
            { label: 'First Run Setup', to: '/getting-started/first-run' },
            { label: 'User Guide', to: '/user-guide' },
            { label: 'Troubleshooting', to: '/administration/troubleshooting' },
          ],
        },
        {
          title: 'API Reference',
          items: [
            { label: 'Public API', to: '/api/public' },
            { label: 'Private API', to: '/api/private' },
          ],
        },
        {
          title: 'Community',
          items: [
            { label: 'GitHub Discussions', href: 'https://github.com/ChurchCRM/CRM/discussions' },
            { label: 'Report a Bug', href: 'https://github.com/ChurchCRM/CRM/issues' },
          ],
        },
        {
          title: 'ChurchCRM',
          items: [
            { label: 'Website', href: 'https://churchcrm.io' },
            { label: 'Demo', href: 'https://demo.churchcrm.io' },
            { label: 'Connect', href: 'https://churchcrm.io/connect.html' },
            { label: 'GitHub', href: 'https://github.com/ChurchCRM/CRM' },
            { label: 'Releases', href: 'https://github.com/ChurchCRM/CRM/releases' },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} ChurchCRM. Released under MIT License.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['bash', 'php', 'sql', 'nginx', 'apacheconf'],
    },
    languageTabs: [
      { highlight: 'bash', language: 'curl', logoClass: 'bash' },
      { highlight: 'javascript', language: 'nodejs', logoClass: 'nodejs' },
      { highlight: 'php', language: 'php', logoClass: 'php' },
      { highlight: 'python', language: 'python', logoClass: 'python' },
    ],
    // Uncomment once approved at docsearch.algolia.com/apply/
    // algolia: {
    //   appId: 'YOUR_APP_ID',
    //   apiKey: 'YOUR_SEARCH_API_KEY',
    //   indexName: 'churchcrm',
    //   contextualSearch: true,
    // },
  } satisfies Preset.ThemeConfig,
};

export default config;
