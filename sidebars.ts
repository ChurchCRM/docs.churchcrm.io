import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {

  gettingStartedSidebar: [
    {
      type: 'doc',
      id: 'index',
      label: 'Welcome',
    },
    {
      type: 'category',
      label: '🚀 Installation',
      collapsed: false,
      items: [
        'installation/index',
        'installation/system-requirements',
        'installation/self-hosted-linux',
        'installation/rocky-linux',
        'installation/cpanel-shared-hosting',
        'installation/azure',
        'installation/ssl-https',
      ],
    },
    {
      type: 'category',
      label: '⚙️ First Run',
      collapsed: false,
      items: [
        'getting-started/first-run',
        'getting-started/first-week',
        'getting-started/features-overview',
        'getting-started/video-tutorials',
      ],
    },
  ],

  userGuideSidebar: [
    {
      type: 'doc',
      id: 'user-guide/index',
      label: 'User Guide Overview',
    },
    {
      type: 'category',
      label: '👥 People & Families',
      items: [
        'user-guide/persons',
        'user-guide/families',
        'user-guide/classifications',
        'user-guide/custom-fields',
        'user-guide/custom-fields-types',
        'user-guide/properties',
        'user-guide/notes',
        'user-guide/search',
      ],
    },
    {
      type: 'category',
      label: '📅 Groups & Events',
      items: [
        'user-guide/groups',
        'user-guide/events',
        'user-guide/sunday-school',
        'user-guide/volunteers',
        'user-guide/kiosk-devices',
      ],
    },
    {
      type: 'category',
      label: '💰 Finance',
      items: [
        'user-guide/finances',
        'user-guide/cart',
        'user-guide/fundraiser',
      ],
    },
    {
      type: 'category',
      label: '📧 Communications',
      items: [
        'user-guide/email',
        'user-guide/reports-and-queries',
        'user-guide/geographic',
        'user-guide/data-import',
      ],
    },
  ],

  adminSidebar: [
    {
      type: 'doc',
      id: 'administration/index',
      label: 'Administration Overview',
    },
    {
      type: 'category',
      label: '🔧 System Management',
      items: [
        'administration/users',
        'administration/security',
        'administration/secret-keys',
        'administration/email-setup',
        'administration/localization',
        'administration/reset-password',
      ],
    },
    {
      type: 'category',
      label: '⚙️ Configuration',
      items: [
        'administration/google-maps-setup',
        'administration/server-locale',
      ],
    },
    {
      type: 'category',
      label: '🔄 Maintenance',
      items: [
        'administration/upgrade',
        'administration/backup-restore',
        'administration/rollback',
        'administration/file-system-permissions',
      ],
    },
    {
      type: 'category',
      label: '🩺 Troubleshooting',
      items: [
        'administration/troubleshooting',
        'administration/faqs',
        'administration/error',
        'administration/logging-and-diagnostics',
        'administration/bug-reporting-and-diagnostics',
        'administration/reporting-issues',
      ],
    },
  ],

};

export default sidebars;
