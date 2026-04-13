---
title: User Management
sidebar_position: 2
---

# Users

## How do I add new Users?

1. Open the **Admin** menu and click **Add New User**.
2. A list of all non-users appears. Select the person you want to promote to a user.
3. Set the user's rights and click **Save**.

## What are the different rights available?

- **Add Records** — create new records.
- **Edit Records** — modify existing records.
- **Delete Records** — delete records.
- **Manage [Properties](/user-guide/properties) and [Classifications](/user-guide/classifications)** — manage property/classification metadata.
- **Manage [Groups](/user-guide/groups) and Roles** — add, edit, and delete groups and their roles.
- **Manage Donations and [Finances](/user-guide/finances)** — add, edit, and delete donations.
- **View, Add, and Edit [Notes](/user-guide/notes)** — manage notes on person and family records.
- **Edit Self** — lets a user maintain only their own person record and their own family members. Useful for members who update their own contact info.
- **Admin** — grants all of the above.

## How do I edit Users?

1. Open the **Admin** menu and click **Edit Users**.
2. Pick the user you want to edit.
    - **Reset** — resets the user's password; they must choose a new one at next login.
    - **Edit** — opens the user's settings page, where you can change rights and profile details.
    - **Delete** — removes the individual's user rights (their person record remains).

## What is the default password assigned to new Users?

New users receive an email containing their username and initial password. The first time they log in, they are required to change it.

## Password change behavior

- Users must change their password at first login.
- Users must change their password when an administrator **resets** it.
- Users are **not** forced to change their password when an administrator **sets** it directly.

---

## User Settings page

Each user has a dedicated **User Settings** page (reached from the user's dropdown menu in the top navbar, or from **Admin → Edit Users → Edit**). As of ChurchCRM 7.1, this page has been redesigned with a Tabler-themed left-tab layout and now consolidates several settings that used to live in different places.

Tabs available on the User Settings page:

| Tab | What you can do |
|-----|-----------------|
| **Profile** | Display name, avatar/photo upload, basic profile fields |
| **Password** | Change your own password |
| **Two-Factor Authentication** | Enroll, view recovery codes, or disable 2FA (previously on its own standalone page) |
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
