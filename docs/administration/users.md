---
title: User Management
sidebar_position: 2
---

# Users

![User permissions in ChurchCRM](https://churchcrm.io/images/screenshots/desktop/settings-user-permissions.png)

## How do I add new Users?

1. Open the **Admin** menu and click **Add New User**, or navigate directly to `/admin/system/users/new`.
2. A list of all non-users appears. Select the person you want to promote to a user. You can also pre-select a person by appending `?personId=N` to the URL.
3. Set the user's rights and click **Save**.

## What are the different rights available?

- **Add Records** — create new records.
- **Edit Records** — modify existing records.
- **Delete Records** — delete records.
- **Manage [Properties](/user-guide/properties) and [Classifications](/user-guide/classifications)** — manage property/classification metadata.
- **Manage [Groups](/user-guide/groups) and Roles** — add, edit, and delete groups and their roles.
- **Manage Donations and [Finances](/user-guide/finances)** — add, edit, and delete donations.
- **Manage [Fundraisers](/user-guide/fundraiser)** — grants access to the Fundraiser menu (create/edit fundraisers, manage items, buyers, and winners). This permission is only effective when the **Enable Fundraiser menu** setting is turned on in **System Settings → Finance Settings**; if that global toggle is off, the Fundraiser menu is hidden for everyone regardless of this per-user permission. Admins always have access when the feature is enabled.
- **View, Add, and Edit [Notes](/user-guide/notes)** — manage notes on person and family records.
- **Edit Self** — lets a user maintain only their own person record and their own family members. Useful for members who update their own contact info.
- **Admin** — grants all of the above.

## How do I edit Users?

1. Open the **Admin** menu and click **Edit Users**, or navigate to `/admin/system/users`.
2. Pick the user you want to edit.
    - **Reset** — resets the user's password; they must choose a new one at next login.
    - **Edit** — opens the user editor at `/admin/system/users/{personId}/edit`, where you can change rights and profile details.
    - **Delete** — removes the individual's user rights (their person record remains).

## How do I see ChurchCRM as another user? (Login as User) {#login-as-user}

An administrator can open a session as another user and see ChurchCRM exactly as that user sees it — the same menus, the same permissions, the same records — then return to their own account. Use it to reproduce a "why can't I see X" report without a screen share and without asking for the user's password.

### Starting a masquerade

1. Open the **Admin** menu and click **Edit Users**, or navigate to `/admin/system/users`.
2. Click the user you want to log in as. Their **Settings** page opens on the **Account** tab.
3. At the bottom of the **Account** tab, click **Login as User** (next to **Advanced Settings**).
4. Confirm **Log in as (name)?** in the dialog.

![Login as User button on a user's Settings page](/img/administration/login-as-user-button.png)

You land on the dashboard as that user. Every page now shows an orange banner across the top: **You are logged in as (name). Actions are recorded as them.**

![The masquerade banner shown on every page](/img/administration/login-as-user-banner.png)

The **Login as User** button is only offered when all of the following are true:

- You are an administrator.
- The record is not your own.
- The user is not another administrator. Administrators cannot log in as each other.
- You are not already logged in as someone else. Finish the current masquerade first.

### Ending a masquerade

Do either of the following:

- Click the exit icon at the right end of the banner (**Exit and return to your own account**).
- Open the user menu in the top navbar and click **Exit to your account**. While you are masquerading this item replaces **Sign out**, so you cannot accidentally end your own session instead.

You are returned to your own account, on the Settings page of the user you were logged in as.

### What happens to the other user's account

Nothing. A masquerade is not a login for that user:

- Their password is not checked and their two-factor authentication is not prompted for.
- Their **Last login** date and login counts are not updated.
- If they must change their password at next login, or must still enroll in two-factor authentication, that requirement is not applied to you and is not cleared — it still applies the next time they sign in themselves.
- A user with only the **Edit Self** right is taken to their limited-access page, with the banner on it, exactly as they would be.

:::warning
While you are masquerading, anything you save is recorded under the other user's name — edits, notes, deposits, sent email. Look; do not change things you would not change while logged in as them.
:::

Both the start and the end of every masquerade are written to the authentication log with both user IDs (`Masquerade started: admin 1 (…) as user 3 (…)`), so it is always possible to tell who really performed an action. See [Logging and Diagnostics](./logging-and-diagnostics.md) for where the `yyyy-mm-dd-auth.log` file lives.

## What is the default password assigned to new Users?

New users receive an email containing their username and initial password. The first time they log in, they are required to change it.

## Password change behavior

- Users must change their password at first login.
- Users must change their password when an administrator **resets** it.
- Users are **not** forced to change their password when an administrator **sets** it directly.

---

## User Settings page

Each user has a dedicated **User Settings** page (reached from the user's dropdown menu in the top navbar, or from **Admin → Edit Users → Edit**). The page uses a tab layout and consolidates several settings in one place.

Tabs available on the User Settings page:

| Tab | What you can do |
|-----|-----------------|
| **Profile** | Display name, avatar/photo upload, basic profile fields |
| **Password** | Change your own password |
| **Two-Factor Authentication** | Enroll, view recovery codes, or disable 2FA |
| **Theme** | Toggle dark mode and choose a primary accent color for the Tabler interface |
| **Localization** | Per-user language and locale preferences |
| **API Access** | Create and revoke personal API tokens |
| **Advanced** | Link to legacy per-user settings (power users only) |

### Two-Factor Authentication

If 2FA is enabled site-wide in System Settings, each user enrolls from the **Two-Factor Authentication** tab of their own User Settings page:

1. Open **User menu → User Settings**
2. Click the **Two-Factor Authentication** tab
3. Scan the QR code with an authenticator app (Google Authenticator, Authy, 1Password, etc.)
4. Enter the generated six-digit code to confirm enrollment
5. **Save your recovery codes** somewhere safe — they are the only way to recover access if you lose your device

Administrators can disable a user's 2FA from **Admin → Edit Users** in an emergency (for example, if a user loses their phone).
