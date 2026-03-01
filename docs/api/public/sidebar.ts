import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "api/public/churchcrm-public-api",
    },
    {
      type: "category",
      label: "Utility",
      link: {
        type: "doc",
        id: "api/public/utility",
      },
      items: [
        {
          type: "doc",
          id: "api/public/get-echo",
          label: "Health check / echo",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "api/public/log-csp-report",
          label: "Log a Content Security Policy violation report",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Auth",
      link: {
        type: "doc",
        id: "api/public/auth",
      },
      items: [
        {
          type: "doc",
          id: "api/public/user-login",
          label: "Log in and retrieve an API key",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "api/public/password-reset-request",
          label: "Request a password reset email",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Registration",
      link: {
        type: "doc",
        id: "api/public/registration",
      },
      items: [
        {
          type: "doc",
          id: "api/public/register-family-api",
          label: "Register a new family",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "api/public/register-person-api",
          label: "Register a new individual person",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Calendar",
      link: {
        type: "doc",
        id: "api/public/calendar",
      },
      items: [
        {
          type: "doc",
          id: "api/public/get-public-calendar-events",
          label: "Get public calendar events as JSON",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "api/public/get-public-calendar-ics",
          label: "Download public calendar as ICS file",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "api/public/get-public-calendar-full-calendar-events",
          label: "Get public calendar events in FullCalendar format",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Lookups",
      link: {
        type: "doc",
        id: "api/public/lookups",
      },
      items: [
        {
          type: "doc",
          id: "api/public/get-countries",
          label: "List all countries",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "api/public/get-states",
          label: "List states/provinces for a country",
          className: "api-method get",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
