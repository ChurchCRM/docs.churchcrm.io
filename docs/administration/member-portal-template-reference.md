---
title: Member Portal Template Reference
sidebar_position: 43
description: The Member Portal template contract - blocks, partials, functions, globals and the variables each page template receives.
---


Everything a Member Portal template may rely on. Read this next to the
[theme authoring guide](./member-portal-theme-guide.md), which explains how a theme is put
together; this file is the reference for what is inside a template.

Templates are [Twig 3](https://twig.symfony.com/). They are rendered with
`autoescape: 'html'` — every variable you print is escaped for you — and with
`strict_variables: false`, so reading a variable that does not exist yields
nothing rather than an error.

## Where templates are resolved from

The loader looks in two places, in order:

1. `Include/themes/<active theme>/templates/`
2. `Include/themes/default/templates/`

The first hit wins, so a theme file replaces the core file at the same relative
path. The namespace `@default` always addresses the second list, which is how an
override extends the very template it replaces:

```twig
{% extends "@default/home.html.twig" %}
```

---

## The page shell

Every page extends `layout.html.twig`, which a theme may also override.

### Blocks

| Block | What goes in it | Filled by default |
|---|---|---|
| `head_extra` | Extra `<link>` / `<meta>` / `<style>` for this page | empty |
| `header` | The church identity bar | `partials/header.html.twig` |
| `nav` | The portal navigation | `partials/nav.html.twig` |
| `hero` | A full-width band under the navigation | empty |
| `content` | **The page itself.** Every page template fills this. | empty |
| `sidebar` | An optional column beside the content | empty |
| `footer` | The church contact line and the church's social links | `partials/footer.html.twig` |
| `scripts_extra` | Extra `<script>` for this page — with `nonce="{{ nonce() }}"` | empty |

### Partials

Each is a separate file, so a theme can replace one without touching the others:

| Partial | Renders |
|---|---|
| `partials/header.html.twig` | Church logo and name, and the account menu ("Hello &lt;first name&gt;" → Email History; Sign-in and devices while the member holds `portal.devices.manage`; Change Password in a staff session; Admin Console when `member.adminConsoleUrl` is set; Sign out). Signed out, there is no menu: a page that sets `guestPage` offers **Sign in** and/or **Register your family** links instead (see [The signed-out pages](#the-signed-out-pages)) |
| `partials/nav.html.twig` | The `nav` entries, and the toggle target `#portal-nav` |
| `partials/footer.html.twig` | Church contact details on the leading edge, `church.socialLinks` as icon links on the trailing edge |
| `partials/flash.html.twig` | The fixed notice container, holding this request's `flash` messages. **A theme that overrides `layout.html.twig` must keep this include** — without it there is no container, and every message the portal raises goes unseen. |
| `partials/login-as-person-banner.html.twig` | While an administrator uses Login as Person (`portal.loginAsPerson`): who they are seeing the portal as, whether changes are allowed, and **Stop**, their only way back. Keep the include in an overridden layout; if a page lacks it, the portal inserts the system theme's banner right after `<body>` |
| `partials/passkey-offer.html.twig` | The one-time "Use a passkey on this device?" card, included above `content` while `portal.passkeyOffer` is true |
| `login/remember-device.html.twig` | The "This is my own device. Keep me signed in." box on the code and link pages, drawn only while `offerRememberDevice` is true. Never pre-tick it |

### What the layout already loads

The layout supplies all of this; load nothing a second time:

- ChurchCRM's core CSS and JS bundle (Tabler, Bootstrap 5, jQuery), the RTL
  variant when the locale is right-to-left
- `moment`
- `portal.min.css`, then the active theme's `theme.css` when it has one
- `bootbox` (confirmations and prompts), `i18next` and the locale loader, then
  `portal.min.js`, then the active theme's `theme.js` when it has one
- whatever `<head>` and footer HTML the enabled plugins inject

`portal.min.js` also publishes `window.CRM.portalToast(message, type)` — `type`
being `success`, `warning`, `danger` or `info` (the default). Call it from a
theme's `theme.js` to show a message the way the portal shows all of them: a
toast in the fixed top-right stack that fades away on its own.

### Page IDs and classes worth knowing

| Selector | What it is |
|---|---|
| `.portal-body` | `<body>` |
| `.portal-shell` | The column that holds header, nav, main and footer |
| `.portal-container` | The width-limited wrapper used by every band |
| `#portal-nav` / `#portal-nav-toggle` | The navigation and the button that opens it on a phone |
| `#portal-account` / `#portal-account-toggle` / `#portal-account-menu` | The header's account menu: its wrapper, the "Hello &lt;first name&gt;" button and the `role="menu"` dropdown. `portal.min.js` binds to these ids, so a theme that overrides `partials/header.html.twig` must keep them |
| `#portal-main` | The `<main>` element |
| `.portal-card` | The standard content card |
| `.portal-subnav` | A page's own secondary tab bar, e.g. the two volunteering pages |
| `.portal-page-title` | The `<h1>` at the top of a page's content |
| `.portal-detail-list` | A `<dl>` of label/value pairs — one column on a phone, two from the tablet breakpoint up |
| `.portal-card-details` | The same `<dl>` inside a card: one column at every width, because a card is a column and a long email address has nowhere to wrap |
| `.portal-contact-list` / `.portal-contact-item` | The church office's contact lines on `family/none.html.twig` — an icon and a `mailto:` or `tel:` link |
| `.portal-form` / `.portal-field` / `.portal-input` | A portal form, one of its fields, and the control inside it |
| `.portal-field-error` | The inline message for a field; it is hidden while empty |
| `.portal-button` / `.portal-button-quiet` | The primary and secondary action buttons |
| `.portal-avatar` / `.portal-avatar-initials` | A member's photo, and the initials shown when there is none |
| `.portal-member-list` / `.portal-member` | The family members list; the member's own row also carries `.is-self` |
| `.portal-member-badge` / `.portal-member-badge-pending` | The "You" badge on a member row, and the "Waiting for review" badge on a proposed member |
| `.portal-dialog` | A `<dialog>` in the portal's own chrome |
| `.portal-breadcrumb` | The single "← back" link above a nested page's title (My Teams) |
| `.portal-team-card` / `.portal-team-ministry` | One team on **My Teams**, and the ministry line under a team's name |
| `.portal-signin` / `.portal-signin-welcome` | The column that holds a sign-in page's card, and the welcome heading above it |
| `.portal-header-guest` / `.portal-header-link` | The signed-out header's **Sign in** / **Register your family** links |
| `.portal-register` | The family registration page |
| `.portal-directory-entry` | One family or person on **Directory** |
| `#login-as-person-banner` | The Login as Person banner |
| `#portal-toasts` / `.portal-flash` | The fixed notice container, and one notice in it. `position: fixed`, so a notice never moves the page; see [theme authoring guide](./member-portal-theme-guide.md) for its colour tokens |

### Hooks the page bundles look for

The page bundles bind to these ids and attributes, so a theme that overrides one
of those pages must keep them if it wants the page to work:

| Id | On |
|---|---|
| `portal-profile-form`, `portal-profile-save` | `profile/edit.html.twig` |
| `portal-photo-input`, `portal-photo-preview`, `portal-photo-error` | `profile/edit.html.twig` |
| `portal-family-form`, `portal-family-save` | `family/edit.html.twig` |
| `portal-confirm-form`, `portal-confirm-submit`, `portal-confirm-comment`, `portal-confirm-comment-field` | `family/confirm.html.twig` |
| `portal-add-member-dialog`, `portal-add-member-form`, `portal-add-member-open`, `portal-add-member-submit`, `portal-add-member-cancel` | `family/index.html.twig` |
| `portal-team`, `portal-team-tabs`, `nav-item-positions` / `-volunteers` / `-schedules` / `-occurrences` | `teams/team.html.twig` |
| `portalSignInForm`, `portalSignInEmail`; with passkeys `[data-passkey-sign-in]`, `portalPasskeySignInButton`, `[data-passkey-error]` and the hidden `portalPasskeyForm` | `login/request.html.twig` (`portal-passkeys.min.js`) |
| `[data-passkey-add]` holding `[data-passkey-create]` and `[data-passkey-error]`, plus a `csrf_field()` | `devices/index.html.twig` and `partials/passkey-offer.html.twig`; the offer also carries `[data-passkey-offer]` and `[data-passkey-dismiss]` |
| `[data-directory-browse]`, `[data-directory-entry]`, `[data-directory-heading]`, `[data-directory-letter]`, `portal-directory-search`, `portal-directory-no-match` | `directory/index.html.twig` (`portal-directory.min.js`) |
| `registration-stepper`, `registration-form`, the `step-*` panels, `member-card-template` with its `member-*` classes, `members-container`, the `displayFamily*` ids and `registration-success` | `register/index.html.twig` (`FamilyRegister.js`, which posts to the public registration API) |

A field's inline message is the element with `data-error-for="<field name>"`
inside the form; a read-only value the bundle refreshes after a save is the
element with `data-field="<field name>"`. Any form marked `data-submit-once`
locks its submit button after the first press and shows the button's
`data-busy-label`, as the sign-in form does with "Sending…".

---

## Functions

These, and only these, are callable from a portal template. There is no PHP, no
filesystem access, no database access and no session.

| Function | Returns |
|---|---|
| `url(path)` | A path inside this installation, with the install's root path in front: `url('/portal/profile')` |
| `asset(path)` | A core ChurchCRM asset URL, cache-busted: `asset('/skin/v2/portal.min.js')` |
| `theme_asset(path)` | A file from the active theme, cache-busted: `theme_asset('images/hero.jpg')`. If the active theme does not carry the file but the system theme does, you get the system theme's copy. |
| `csrf_field()` | The hidden input every portal form must contain. Safe HTML — do not escape it. |
| `nonce()` | This request's Content-Security-Policy nonce. Every inline `<script>` needs `nonce="{{ nonce() }}"`. |
| `portal_can(capability, scope)` | Whether the member holds a portal capability, such as `portal.family.contacts.view`, to show or hide a section or button. `scope` is optional: the record the template has (a family, a team) or its id. Without it, holding the capability anywhere is enough. The routes check again for themselves, so hiding a button is never the only guard. |
| `gettext(text)` | The translation of `text` |
| `ngettext(singular, plural, count)` | The translation of `singular`/`plural` for `count` |
| `email_wrap` (filter) | An email address, escaped, that may wrap after the `@` and before each `.` instead of mid-word: `{{ profile.email\|email_wrap }}`. Safe HTML — do not escape it again. |

---

## Globals

Available in every template, including yours.

### `church`

The church's identity, from **Admin → Church Information**.

| Field | Type | Notes |
|---|---|---|
| `name` | string | May be empty on a brand-new install |
| `address`, `city`, `state`, `zip` | string | |
| `phone`, `email` | string | |
| `website` | string | |
| `logoUrl` | string | The uploaded church logo, or ChurchCRM's stock image when none is set |
| `logoOnDarkUrl` | string | The same church logo, but when none is set ChurchCRM's light-on-dark mark instead of the stock image. The default header, which is dark, uses this one |
| `socialLinks` | list | The church's social accounts, already filtered to the ones that are set and ordered X, YouTube, Facebook, Instagram. Each entry is `{id, label, url, icon}` — `icon` is a Font Awesome Free brand class such as `fa-brands fa-facebook`. Empty when the church has configured none, so `{% if church.socialLinks is not empty %}` is the whole guard you need. |

### `member`

The person the portal is acting for: the signed-in member, or during Login as
Person the person the administrator is seeing it as. No template, and no portal
route, ever addresses somebody else. On the signed-out pages `id` is `0` and
every other field is empty.

| Field | Type | Notes |
|---|---|---|
| `id` | int | The person id |
| `firstName`, `lastName` | string | |
| `fullName` | string | Formatted per the installation's name format |
| `familyName` | string | The family's surname; empty when the person has no family |
| `email` | string | |
| `avatarUrl` | string | `/api/portal/me/photo`, cache-busted; **empty when no photo has been uploaded** — render initials instead |
| `familyId` | int | `0` when the person has no family |
| `isTeamLeader` | bool | `true` when this person leads at least one volunteer team. Kept for older themes; `portal_can('volunteer.team.manage')` asks the same |
| `isStaff` | bool | `true` in a staff session: the portal was opened from a staff sign-in |
| `signedInWithPassword` | bool | `true` in a staff session, which is the only kind with a password; the account menu offers Change Password only then |
| `adminConsoleUrl` | string | Where the account menu's Admin Console goes: back to the staff side from a staff session, or to the staff sign-in from a member session whose person also has a staff account. Empty otherwise, and during Login as Person |

### `nav`

An ordered list of entries. Render all of them; the list is already filtered to
what this member may see.

| Field | Type | Notes |
|---|---|---|
| `id` | string | Stable identifier, e.g. `home` |
| `label` | string | Already translated |
| `url` | string | Ready to use in `href` |
| `icon` | string | A Font Awesome class, e.g. `fa-solid fa-house` |
| `active` | bool | `true` for the page being rendered |
| `badge` | string | A short count or flag; empty when there is nothing to show |

### `flash`

One-shot messages queued by the previous request. Reading them empties the list,
so a reload never repeats them.

| Field | Type | Notes |
|---|---|---|
| `type` | string | `info`, `success`, `warning` or `danger` |
| `message` | string | Already translated |

### `portal`

Facts about this request and this installation.

| Field | Type | Notes |
|---|---|---|
| `rootPath` | string | The install's root path — `''` at a domain root, `/churchcrm` in a subdirectory |
| `themeName` | string | The active theme's folder name |
| `locale` | string | e.g. `en_US` |
| `isRTL` | bool | Right-to-left locale |
| `colorMode` | string | `auto`, `light` or `dark`. Always `auto` (follow the device) for a member; a staff session gets the staff account's choice |
| `developerMode` | bool | `true` when the template cache is off |
| `showCalendar` | bool | Whether the calendar is there for this member: at least one calendar is shared |
| `showVolunteer` | bool | Whether the volunteering pages are there for this member |
| `allowBirthdayEdit` | bool | Whether members may change birthdays |
| `passkeyOffer` | bool | Whether this page shows the one-time passkey offer. Reading it spends it, as with `flash` |
| `loginAsPerson` | object | During Login as Person: `{personName, actorName, allowsChanges, stopUrl}`; `null` otherwise |
| `hasThemeCss` | bool | Whether a `theme.css` is available to link |
| `hasThemeJs` | bool | Whether a `theme.js` is available to load |
| `pluginHead` | HTML | The `<head>` content enabled plugins inject — print it verbatim |
| `pluginFooter` | HTML | The footer content enabled plugins inject — print it verbatim |
| `bootstrapJson` | JSON | The `window.CRM` seed the core bundles expect |
| `localeConfigJson` | JSON | The argument for `window.CRM.loadLocaleFiles(…)` |

The last four are pre-rendered fragments the layout emits as-is. Print them
without `|escape` and without `|raw` — they are already marked safe. If you
override `layout.html.twig`, keep emitting all four, or plugins and translations
will stop working on your pages.

---

## Page templates

| Template | Rendered for | Its own variables |
|---|---|---|
| `home.html.twig` | `GET /portal` | `pageTitle`, `upcomingEvents`, `hasVisibleCalendars`, `showVolunteering`, `familySummary`, `profile` |
| `calendar/index.html.twig` | `GET /portal/calendar` | `pageTitle`, `calendars`, `hasCalendars`, `calendarConfigJson` |
| `volunteer/schedule.html.twig` | `GET /portal/volunteer/schedule` | `pageTitle`, `activeTab` |
| `volunteer/opportunities.html.twig` | `GET /portal/volunteer/opportunities` | `pageTitle`, `activeTab` |
| `volunteer/partials/tabs.html.twig` | included by both volunteering pages | `activeTab` |
| `profile/index.html.twig` | `GET /portal/profile` | `pageTitle`, `profile` |
| `profile/edit.html.twig` | `GET /portal/profile/edit` | `pageTitle`, `profile`, `languages` |
| `profile/password.html.twig` | `GET/POST /portal/profile/password`, in a staff session only | `pageTitle`, `formAction`, `minPasswordLength`, `oldPasswordError`, `newPasswordError` |
| `profile/password-changed.html.twig` | The same route, after a successful change | `pageTitle` |
| `profile/two-factor.html.twig` | `GET /portal/profile/two-factor`, in a staff session only | `pageTitle` |
| `devices/index.html.twig` | `GET /portal/devices` (Sign-in and devices) | `pageTitle`, `devices`, `offerRememberDevice`, `passkeysOn`, `passkeys`, `passkeyAddProblem`, `emailToConfirm` |
| `family/index.html.twig` | `GET /portal/family` | `pageTitle`, `family`, `members`, `canEdit`, `canConfirm`, `canSeeContacts`, `familyRoles`, `defaultNewMemberRoleId` |
| `family/edit.html.twig` | `GET /portal/family/edit` | `pageTitle`, `family`, `members`, `canEdit`, `canConfirm`, `canSeeContacts`, `countries` |
| `family/confirm.html.twig` | `GET /portal/family/confirm` | `pageTitle`, `family`, `members`, `canEdit`, `canConfirm`, `canSeeContacts` |
| `directory/index.html.twig` | `GET /portal/directory` | `pageTitle`, `groups`, `entryCount`, `browse`, `query`, `truncated`, `searchMinLength`, `searchLimit` |
| `giving/index.html.twig` | `GET /portal/giving` (My Giving) | `pageTitle`, `year`, `isHousehold`, `years` |
| `teams/index.html.twig` | `GET /portal/teams` | `pageTitle`, `teams` |
| `teams/team.html.twig` | `GET /portal/teams/{teamId}` | `pageTitle`, `team` |
| `teams/occurrence.html.twig` | `GET /portal/teams/{teamId}/occurrences/{occurrenceId}` | `pageTitle`, `team`, `occurrence`, `headcount` |
| `family/none.html.twig` | All three family URLs, and `GET /portal/giving/statement`, for a member with no family | `pageTitle`, `officeEmail`, `officePhone`, `officePhoneHref` |
| `email/index.html.twig` | `GET /portal/email-history` | `pageTitle`, `emails`, `page`, `pages`, `total`, `previousUrl`, `nextUrl` |
| `email/show.html.twig` | `GET /portal/email-history/{id}` | `pageTitle`, `email`, `body`, `hasBody` |
| `login/request.html.twig` | `GET/POST /portal/login`, while member sign-in is on | `pageTitle`, `email`, `emailError`, `passkeySignIn`, plus the [sign-in page variables](#the-signed-out-pages) |
| `login/code.html.twig` | `GET/POST /portal/login/code`: the answer to every email request | `pageTitle`, `codeError`, plus the sign-in page variables |
| `login/confirm.html.twig` | `GET /portal/login/confirm/{token}`: the page an emailed link opens | `pageTitle`, `firstName`, `churchName`, `confirmUrl`, plus the sign-in page variables |
| `login/link-expired.html.twig` | A link that is unknown, expired, used or replaced | `pageTitle`, `loginUrl` |
| `login/failed.html.twig` | A code, link or passkey that signed nobody in | `pageTitle`, `loginUrl`, `passkey` |
| `login/unavailable.html.twig` | Every `/portal/login` page while member sign-in is off and self-registration is on | `pageTitle`, `guestPage`, `selfRegistrationEnabled`, `memberSignInEnabled` |
| `register/index.html.twig` | `GET /portal/register`, while self-registration is on | `pageTitle`, `guestPage`, `memberSignInEnabled`, `selfRegistrationEnabled`, `familyRoles`, `phoneFormat`, `phoneFormatCell`, `defaults` |
| `email-change/confirm.html.twig` | `GET/POST /portal/email/confirm/{token}`: the link in an email-change message | `pageTitle`, `state`, `kind`, `email`, `firstName`, `churchName`, `token` |
| `errors/403.html.twig` | A page this member may not open | `pageTitle` |
| `errors/404.html.twig` | An unknown portal URL (and 405) | `pageTitle` |
| `errors/500.html.twig` | An unexpected failure | `pageTitle` |
| `errors/unavailable.html.twig` | Shown to **members** when the active theme fails to render | none |
| `errors/theme-error.html.twig` | Shown to **administrators** when the active theme fails to render | `themeName`, `file`, `line`, `message` |

`pageTitle` is the page's own title; the layout puts the church's name after it.

`formAction` on `profile/password.html.twig` is the URL that page's form posts
back to. An override must post to `formAction`, not to a hard-coded path.

`languages` on `profile/edit.html.twig` is `{selected, churchName, choices}`:
the member's choice (`''` for the church default), the name of the church's own
language, and `{locale, name}` for each language ChurchCRM ships. It is `null` in
a staff session, which uses the staff account's language, so leave the field
out then. The select is named `language`; the page reloads after a change so
the new language shows at once.

### `profile`

The signed-in member's own person record, as `GET /api/portal/me` returns it.

| Field | Type | Notes |
|---|---|---|
| `id` | int | The person id |
| `title`, `firstName`, `middleName`, `lastName`, `suffix` | string | |
| `email`, `workEmail` | string | `email` is the address on record, which is also the sign-in address |
| `pendingEmail` | string | A new address the member asked for and has not confirmed with the emailed link yet; empty otherwise |
| `emailLocked` | bool | `true` when only an administrator may change this person's email (they have a staff account or portal permissions); the form shows the field read-only |
| `language` | string | The member's own portal language, e.g. `de_DE`; empty for the church default |
| `homePhone`, `cellPhone`, `workPhone` | string | |
| `birthday` | string | ISO `YYYY-MM-DD`, empty when unknown |
| `fullName` | string | Formatted per the installation's name format |
| `familyRole` | string | e.g. `Spouse`; `Unassigned` when the person has no role |
| `familyId` | int | `0` when the person has no family |
| `familyName` | string | The family's surname |
| `photoUrl` | string | `/api/portal/me/photo`, cache-busted; **empty when no photo has been uploaded** — render initials instead |
| `hasPhoto` | bool | Whether a photo has been uploaded |
| `canEditBirthday` | bool | Mirrors `bPortalAllowBirthdayEdit`; when false the birthday is neither shown nor accepted |

### `family`

The member's own family. Never another family: the routes take no family id.

| Field | Type | Notes |
|---|---|---|
| `id` | int | |
| `name` | string | The family's surname |
| `address1`, `address2`, `city`, `state`, `zip`, `country` | string | |
| `homePhone` | string | A family has no email of its own; each person's is on their own record |
| `weddingDate` | string | ISO `YYYY-MM-DD`, empty when unset |

### `members`

Everyone in the member's family, adults first, as `Family::getPeopleSorted()`
orders them.

| Field | Type | Notes |
|---|---|---|
| `id` | int | |
| `fullName` | string | |
| `role` | string | The family-role name |
| `email`, `cellPhone` | string | Empty for everyone but the member's own row unless `canSeeContacts` is true |
| `photoUrl` | string | `/api/portal/family/members/{id}/photo` (or `/api/portal/me/photo` for the member's own row), cache-busted; empty when that member has no photo |
| `initials` | string | The two-letter stand-in for a missing photo |
| `isSelf` | bool | `true` for the signed-in member's own row |
| `isAdult` | bool | `true` for an adult of the family: a head or spouse (the roles `sDirRoleHead` and `sDirRoleSpouse` name) aged 18 or over, or with no birth year; someone proposed in the portal only once approved |
| `awaitingReview` | bool | `true` for someone a member proposed with "Add a family member" whom staff have not approved yet (People → Self Registrations) |

### `canEdit`, `canConfirm`, `canSeeContacts`, `countries`, `familyRoles`, `familySummary`

| Variable | Type | Notes |
|---|---|---|
| `canEdit` | bool | Whether this member may change the family's details and add a family member (`portal.family.edit`): an adult of the family, or someone the church gave it |
| `canConfirm` | bool | Whether the "Confirm your family details" card is offered (`portal.family.confirm`) |
| `canSeeContacts` | bool | Whether the other members' email and mobile are filled in (`portal.family.contacts.view`) |
| `countries` | map | Country code → country name, for the address form's `<select>` |
| `familyRoles` | list | `{id, name}` for each family role, for the "add a family member" form |
| `defaultNewMemberRoleId` | int | The role that form starts on — the configured child role, not head of household |
| `familySummary` | object | On the home page only: `{name, memberCount}`, or `null` when the member has no family |
| `profile` | object | On the home page too: the same `profile` the Profile page gets, or `null` for an account with no person record |

### A member with no family

`/portal/family`, `/portal/family/edit` and `/portal/family/confirm` all render
`family/none.html.twig` when the acting member has no family record — and when
the account has no person record at all. It is an ordinary portal page: HTTP
200, the usual chrome, "My Family" still the active navigation entry. Only URLs
that really do not exist get `errors/404.html.twig`.

| Variable | Type | Notes |
|---|---|---|
| `officeEmail` | string | **Admin → Church Information**'s email. Empty when unset — leave the line out rather than linking to nowhere |
| `officePhone` | string | The church's phone, exactly as it was typed. Print this |
| `officePhoneHref` | string | The same number reduced to what a `tel:` link can dial — digits, plus a leading `+` for an international number. Empty when the church configured no phone, or typed one with no digits in it |

With neither configured the system theme drops both lines and says only
"Please contact the church office."

### The home page's Profile card

The card prints the member's own details rather than a sentence describing them.
It reads them out of `profile` — the very view-model `profile/index.html.twig`
renders, so the two pages can never disagree — and skips every empty field: with
nothing on file it says "No contact details on file yet." The birthday follows
the Profile page and appears only while `profile.canEditBirthday` is true, and
the family role is shown only when `profile.familyId` is non-zero. Values sit in
`<dd data-field="…">` inside `#portal-home-profile-details`, with the same field
names the Profile page uses.

### `teams`, `team` and `occurrence` (My Teams)

`teams` is the list **My Teams** renders, one entry per team this member runs,
ordered by ministry then team.

| Field | Type | What it is |
|---|---|---|
| `id` | int | The team |
| `name` | string | The team's name |
| `ministryId` / `ministryName` | int / string | The ministry above it |
| `active` | bool | False for a deactivated team; the card says so |
| `positionCount` | int | How many positions the team owns, active or not |
| `nextOccurrence` | object | `{id, date}` for the soonest scheduled date from today, or `null` |
| `url` | string | The team's page, root-path aware |

`team` on the team page is `{id, name, description, active, ministryId,
ministryName, classGroupName, sundaySchool}` — `description` is `''` when the
team has none, `classGroupName` is the Sunday School class the team is linked
to (`''` when none), and `sundaySchool` says whether the ministry provides
Sunday School teachers. On the occurrence page `team` is `{id, name, ministryId,
ministryName}`.

`occurrence` is `{id, scheduleName, status, date, start, end, eventId,
eventTitle, eventLocation, offsetNote}`. `status` is `'scheduled'` or
`'cancelled'`; `start` is `YYYY-MM-DD HH:MM` and `end` is `HH:MM`, both `''` for
an occurrence with no resolved window; `eventId` is `0` when the date is not
linked to a calendar event, and the two event fields are `''` then.
`offsetNote` is the schedule's volunteer times in words, `''` when volunteers
keep the event's own times. `headcount` is the linked event's read-only
headcount, `{recorded, total, counts[{name, count}], editPath, roster{checkedIn,
members}}`, or `null` without an event.

The two theme-failure pages are always rendered from the **system** theme, so a
broken theme cannot break the page that reports it. A theme may still override
them — its version is used everywhere except when that theme is the one that
failed.

### The home page's calendar card

`upcomingEvents` is the next three events from the calendars the church shares —
`{title, when, start, allDay, calendarName}`, where `when` is a date string in the
installation's own format and `start` the raw local start. The system theme prints
`when` inside `<time datetime="{{ event.start }}" data-format="daytime">` (`day` for
an all-day event), which the portal's script rewrites in the church's locale
("Sunday, October 4 at 9:30 AM"), matching the volunteering cards. It is empty when nothing is
coming up, and the system theme then says "Nothing is on the calendar just
now." `hasVisibleCalendars` is the same as `portal.showCalendar`.

The card is only rendered when `portal.showCalendar` is on, that is while the
church shares at least one calendar with members.

### The calendar page

`calendars` is the legend: `{key, name, color, isMine}` for each calendar an
administrator switched on, in the order People → Admin → Member Portal → Calendars lists
them, with `color` a CSS colour ready for a swatch and `key` the
`calendar:<id>` / `system:<id>` string that every event of that calendar carries.
`hasCalendars` is `false` when nothing is shared, and the page then says so
instead of drawing a grid. Members cannot open the page at all then, so this is
only a safeguard.

The events are **not** in the template. FullCalendar fetches
`GET /api/portal/calendar/events?from=…&to=…` for the window it is showing, so
paging through months costs one small request each. An override must therefore
keep three things, which the page's bundle looks for:

| Keep | Why |
|---|---|
| `<div id="portal-calendar">` | Where FullCalendar renders |
| `<section id="portal-calendar-detail">` and its `portal-calendar-detail-*` ids | The panel an event click fills in — title, when, where, calendar, details |
| `window.CRM.portalCalendar = {{ calendarConfigJson }}` plus `asset('/skin/v2/portal-calendar.min.js')` | The endpoint, the church's timezone, the window cap, and the two subscription endpoints |

Each legend entry may also be a switch. A `<button type="button" data-calendar-key="{{ calendar.key }}"
aria-pressed="true">` hides and shows that calendar's events without reloading, and the bundle
remembers the choice in the member's browser (`localStorage`, key
`churchcrm.portal.calendar.hidden`). The bundle sets `aria-pressed` itself; style the off state with
`[aria-pressed="false"]`. The default theme sets the swatch colour as `--portal-calendar-swatch` on
the swatch, so the off state can draw it hollow. A legend without such buttons stays a plain legend
and every event is shown, whatever the browser stored earlier.

### Subscribing to the calendar

The **Subscribe** button opens a dialog where a member ticks the calendars they
want in their own calendar app and gets one address back. The bundle draws the
checkboxes and fills in the address from
`GET /api/portal/calendar/subscription`, so none of it is server-rendered: the
feed address is a bearer secret and is fetched only when the dialog opens.

A theme that keeps the feature must keep these ids:

| Keep | What it is |
|---|---|
| `#portal-calendar-subscribe` | The button that opens the dialog |
| `#portal-calendar-subscribe-dialog` | The dialog itself |
| `#portal-calendar-subscribe-form` | A `<form>` carrying `{{ csrf_field() }}` — the bundle reads the token out of it |
| `#portal-calendar-subscribe-choices` | The empty container the checkboxes are drawn into |
| `#portal-calendar-subscribe-error` | Where a refused save is reported |
| `#portal-calendar-subscribe-save`, `#portal-calendar-subscribe-close` | Save, and dismiss |
| `#portal-calendar-subscribe-result` | The address block, `hidden` until there is an address |
| `#portal-calendar-subscribe-url` | A read-only `<input>` holding the feed address |
| `#portal-calendar-subscribe-copy` | Copy to clipboard (falls back to selecting the text) |
| `#portal-calendar-subscribe-open-row` | The paragraph holding the link below. Starts `hidden`; the bundle reveals it **only when the feed address is `https`** |
| `#portal-calendar-subscribe-open` | An `<a>` whose `href` the bundle sets to the `webcal://` address |
| `#portal-calendar-subscribe-manual-hint` | The sentence shown instead of that link when the site is on plain `http` — Apple's calendar clients rewrite `webcal://` to `https://` and never fall back, so the one-tap link cannot work there |
| `#portal-calendar-subscribe-reset` | Opens the confirmation below |
| `#portal-calendar-reset-dialog` with `#portal-calendar-reset-confirm` / `#portal-calendar-reset-cancel` | "Get a new calendar address?" |

A theme that wants none of this drops the button and both dialogs together; the
bundle does nothing when the button is absent.

`calendarConfigJson` is a pre-rendered fragment like the four above: print it
inside a `<script nonce="{{ nonce() }}">` without `|escape` and without `|raw`.
Link `asset('/skin/v2/portal-calendar.min.css')` from `head_extra` — that is
FullCalendar's own stylesheet, not portal styling.

A theme that would rather draw its own calendar can drop all of this and call
the same endpoint itself; it is session-gated and needs no token.

### The volunteering pages

`showVolunteering` is `true` when the installation offers the volunteering pages;
the home page renders its "My volunteering" card only then. `activeTab` is
`'schedule'` or `'opportunities'` and is what the tab partial highlights.

**The two volunteering pages are container markup and nothing else.** Their ids —
`#volunteer-my-schedule`, `#assignments-loading` / `-error` / `-empty` / `-content`,
`#substitute-modal` and friends on one page; `#volunteer-opportunities`,
`#help-wanted-section` / `-content`, `#opportunities-loading` / `-error` / `-empty` /
`-content` on the other — are read by `skin/v2/portal-volunteer-schedule.min.js` and
`skin/v2/portal-volunteer-opportunities.min.js`, which fill them from
`/api/ministries/me/*`. A theme overriding either template must keep every id, or
the page renders empty. Override the wrapper, the headings and the surrounding
layout freely.

**The team and occurrence pages are container markup too.** `teams/team.html.twig`
is filled by `skin/v2/portal-teams.min.js` and
`teams/occurrence.html.twig` by `skin/v2/ministries-occurrence.min.js` — the
admin occurrence page's bundle, unchanged. Both address their markup by id, and
those ids are deliberately the same ones the admin ministry and occurrence views
carry, so the same components can draw either. A theme overriding one of these
templates must keep every id it finds there: `volunteerPositionsTable`,
`volunteerQualificationsTable`, `volunteerSchedulesTable`,
`volunteerOccurrencesTable` and their `-loading` / `-error` / `-empty` /
`-table-wrapper` state blocks; `positionModal` and `scheduleModal` with their
`*-form-*` fields; and on the occurrence page `requirements-*`, `swaps-*`,
`volunteer-assign-modal` and `volunteer-needs-modal`. Override the wrapper, the
headings, the tab strip and the surrounding layout freely.

A control a theme **removes** is not an error: every one of those bundles looks
its controls up by id and does nothing when one is absent. That is how the
portal's own templates leave out the things a team leader may not do.

### Email History

`email/index.html.twig` is a paginated list of what the church has emailed this
member — reached from the header's account menu, not from the main navigation,
so **no nav entry is active while it is open**. Only mail that was sent is
listed, and rows carry no delivery status: queued, failed and skipped mail is
for staff, and an unsent row's detail URL is the same 404 as somebody else's.

`emails` is the page's rows, newest first. Every field is a finished string;
nothing here needs formatting or reasoning about in a template:

| Field | Type | Notes |
|---|---|---|
| `id` | int | Use it to build the detail URL |
| `subject` | string | Empty for an email that was sent without one — print `(no subject)` |
| `kindLabel` | string | The kind in words: `Message`, `Birthday greeting`, `Password reset link`, … |
| `address` | string | The address the message went to |
| `dateSent` | string | Formatted in the installation's date format, with the time |
| `hasBody` | bool | False for the account emails, whose content is never stored |

`page`, `pages` and `total` drive "Page X of Y"; `previousUrl` and `nextUrl` are
query strings (`?page=2`) and are empty strings at the ends of the list, which is
how the template knows not to draw that link. The list is server-rendered — there
is no bundle on this page — but the same rows are available to a theme that would
rather fetch them, at `GET /api/portal/me/emails?page=&limit=`.

The list is one `<table class="portal-table">` at every width. On a phone
`_portal.scss` unrolls it into a stack of blocks, taking each cell's column name
from its `data-label` attribute, so an override that keeps the table markup gets
the phone layout for free.

`email/show.html.twig` is one email: `email` is a single row in the shape above,
`hasBody` says whether there is anything to show, and `body` is **the stored HTML
of the message**.

> **`body` goes in exactly one place: the `srcdoc` of an iframe with an empty
> `sandbox` attribute.** It is markup somebody else wrote, kept as it was sent.
> Twig's autoescaping is what makes the attribute safe; `|raw` on it, or printing
> it anywhere in the document, hands a member's browser foreign markup with the
> portal's own origin behind it. The frame does not grow to fit its content — an
> empty `sandbox` puts the document in its own opaque origin, so its height
> cannot be measured from the page, and the two ways to measure it
> (`allow-same-origin`, or a script inside the frame) are the two permissions
> this page must not grant. It scrolls instead.

Scope: the page shows only the rows addressed to this person.

### The signed-out pages

The sign-in pages, the registration page and the email-confirmation page work
without a session. They extend `layout.html.twig` with an empty `nav` block,
and `member.id` is `0` on them, so the header draws no account menu.

Every `login/*` page except `login/unavailable.html.twig` gets these sign-in page variables:

| Variable | Type | Notes |
|---|---|---|
| `loginUrl` | string | `/portal/login`, root-path aware. Forms post to it and to `{{ loginUrl }}/code` |
| `offerRememberDevice` | bool | Whether "This is my own device" is offered: false when the church set **Keep me signed in (days)** to 0 |
| `memberSignInEnabled` | bool | Whether member sign-in is on |

`login/request.html.twig` also gets `email` and `emailError` (the typed address
and its message after a refused post), `passkeySignIn` (passkeys are on and this
site address can use them: draw the passkey button and load
`asset('/skin/v2/portal-passkeys.min.js')`), `selfRegistrationEnabled`, and
`guestPage: 'login'`. The page reads the same whatever address was typed; an
override must not add anything that tells the two apart.

`guestPage` is how the header decides its signed-out links: a page with
`guestPage` other than `'login'` offers **Sign in** while `memberSignInEnabled`
is true, and one other than `'register'` offers **Register your family** while
`selfRegistrationEnabled` is true. `login/unavailable.html.twig` sets
`guestPage: 'register'`, because it carries its own **Register your family**
button and a **Church leader sign-in** link to `/admin/`.

`login/code.html.twig` gets `codeError`. `login/confirm.html.twig` gets
`firstName`, `churchName` and `confirmUrl`, the address its form posts to:
opening the page must change nothing, so keep the sign-in a form post.
`login/failed.html.twig` gets `passkey`, true after a passkey that signed
nobody in. Every form here carries `{{ csrf_field() }}`.

`register/index.html.twig` is container markup for `FamilyRegister.js`:
`familyRoles` is `[{id, name}]`, `phoneFormat` and `phoneFormatCell` are the
input masks, and `defaults` is `{city, state, zip, country}` from the church's
address defaults. Keep the ids listed under [Hooks the page bundles look
for](#hooks-the-page-bundles-look-for).

`email-change/confirm.html.twig` draws one of three `state`s: `confirm` (a form
that posts back to `/portal/email/confirm/{{ token }}`), `done` or `invalid`.
`kind` is `change` when the link went to the new address and `confirm` when it
went to the address the member last signed in with.

### Sign-in and devices

`devices/index.html.twig`. Every date arrives formatted.

| Variable | Type | Notes |
|---|---|---|
| `devices` | list | `{id, label, addedAt, lastUsedAt, isThisDevice}` for each remembered device; `label` is the browser and system, e.g. `Chrome · Windows` |
| `offerRememberDevice` | bool | As on the sign-in pages |
| `passkeysOn` | bool | Whether the church allows passkeys; without it, leave the passkey section out |
| `passkeys` | list | `{id, label, addedAt, lastUsedAt}`; `lastUsedAt` is empty for a passkey never used |
| `passkeyAddProblem` | string | Why a passkey cannot be added right now, in words for the member (for example, more than 15 minutes after the email sign-in); empty when it can |
| `emailToConfirm` | string | After a passkey sign-in, an unconfirmed address the member may confirm with **Email me a confirmation link**; empty otherwise |

Each sign-out and removal is a plain form post to
`/portal/devices/{id}/sign-out`, `/portal/devices/passkeys/{id}/remove`,
`/portal/devices/sign-out-everywhere` or `/portal/devices/confirm-email`, each
with `{{ csrf_field() }}`.

### Directory

`directory/index.html.twig` lists what **People → Admin → Member Portal →
Directory** chooses to share; a detail the church does not show arrives as `''` or an empty
list.

| Variable | Type | Notes |
|---|---|---|
| `groups` | list | `{letter, entries}`, A to Z |
| `entryCount` | int | How many entries there are in all |
| `browse` | bool | `false` when the church allows search only: `groups` then holds only the matches for `query`, and nothing before a search |
| `query` | string | What was searched for (`?q=`) |
| `truncated` | bool | Search only: more than `searchLimit` matched and only the first ones are listed |
| `searchMinLength`, `searchLimit` | int | The shortest search answered (2) and the most matches shown (20) |

An entry is `{kind, id, name, searchText, photoUrl, initials, address,
mailingAddress, homePhone, anniversary, members}`, where `kind` is `family` or
`person` and `address` and `mailingAddress` are lists of lines. A member is
`{id, name, photoUrl, initials, birthday, homePhone, cellPhone, workPhone,
email, workEmail}`.

### My Giving

`giving/index.html.twig`: `isHousehold` is `true` for an adult of the family,
who gets the year-end statement form; anyone else gets only the line telling
them to ask the church office. `years` is `{value, label, hasGiving}` for each
year from the one the family was entered in to the current one, newest first,
and `year` is the one selected at first: last year, or the family's first year
when it is newer. The form is a plain `GET` to
`/portal/giving/statement?year=`, which answers with a PDF.

---

## Compatibility

Core may **add** a block, a variable or a global at any time; that never breaks a
theme. Renaming or removing one is called out in the release notes, and the old
name keeps working for one release.

The validator's "this version of ChurchCRM does not use a template at this path"
warning is how a theme finds out that a template it overrode has moved — run
**Check** on **People → Admin → Member Portal → Themes** after upgrading.
