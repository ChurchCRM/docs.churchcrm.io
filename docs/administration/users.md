---
title: User Management
sidebar_position: 2
---

# Users

![User permissions in ChurchCRM](https://churchcrm.io/images/screenshots/desktop/settings-user-permissions.png)

## How do I add new Users?

1. Open **Admin → System Users** and click **Add User** (`/admin/system/users/new`).
2. A list of people who do not yet have a login appears. Select the person. You can also pre-select a person by appending `?personId=N` to the URL.
3. Set the user's rights and click **Save**.

## What are the different rights available?

- **Add Records** — create new records.
- **Edit Records** — modify existing records. This is also the permission required to approve entries on [Self Registrations](/user-guide/self-registrations).
- **Delete Records** — delete records.
- **Manage [Properties](/user-guide/properties) and [Classifications](/user-guide/classifications)** — manage property/classification metadata.
- **Manage [Groups](/user-guide/groups) and Roles** — add, edit, and delete groups and their roles.
- **Manage Donations and [Finances](/user-guide/finances)** — add, edit, and delete donations.
- **Manage [Fundraisers](/user-guide/fundraiser)** — grants access to the Fundraiser menu (create/edit fundraisers, manage items, buyers, and winners). This permission is only effective when the **Enable Fundraiser menu** setting is turned on in **System Settings → Finance Settings**; if that global toggle is off, the Fundraiser menu is hidden for everyone regardless of this per-user permission. Admins always have access when the feature is enabled.
- **Manage Ministries** — a global ministry manager for [Volunteer Management (v2)](/user-guide/ministries): every ministry — create, deactivate, delete, and grant coordinators and team leaders. Only effective while the volunteer experience on **Admin → Ministry Settings** is V2 or Both.
- **Manage My Ministries** — a ministry coordinator's permission: opens the **Ministries** heading, the Ministry Dashboard and the pages of the ministries the person has been made a coordinator of (on the ministry page), and grants nothing over any other ministry. See [Who can do what](/user-guide/ministries/permissions).
- **View, Add, and Edit [Notes](/user-guide/notes)** — manage notes on person and family records.
- **Edit Self** — lets a user maintain only their own person record and their own family members. Useful for members who update their own contact info.
- **Admin** — grants all of the above.

## How do I edit Users?

1. Open **Admin → System Users**.
2. Open the row menu for that person. The actions are:
    - **Edit User** — `/admin/system/users/{personId}/edit`, where you change rights. Mailto links are the per-user **User Config** row **bEmailMailto**. There is no `sMailtoDelimiter`.
    - **Change Password** — you set the password. The user is not forced to change it again unless you use a reset.
    - **Reset Password via Email** — emails a new password. The user must change it at the next login. This action is shown only when email is configured and the person has an email address.
    - **Disable 2FA** — shown when that user has two-factor authentication turned on.
    - **Delete User** — removes the login. The person record remains.

## What is the default password assigned to new Users?

ChurchCRM creates the account with a random password and does not show that password on screen. If email is already configured, the person gets a welcome email with the username and password, and must change it at first login. If email is off, set a password yourself with **Change Password** on **System Users**.

## Password change behavior

- Users must change their password at first login when the account was created with the random password.
- Users must change their password after **Reset Password via Email**.
- Users are **not** forced to change their password when an administrator uses **Change Password**.

Minimum password length, the failed-login lockout, and whether 2FA is required are under **System Users → Settings → Quick Settings**.

---

## Change Settings

Open the user menu (your name, top right) and click **Change Settings**. An administrator can open the same page from the person's name on **System Users**.

| Section | What you can do |
|---------|-----------------|
| **Account** | Name, email, photo, and security status. **Change Password** is on this section. |
| **Appearance** | Dark mode and the accent color |
| **Localization** | This user's language and formats |
| **API Access** | The account's API key. **Regenerate** replaces it. |
| **Permissions** | What this account can do (read-only on this page). Change them with **Edit User**. |

There is no Permission Groups screen and no Security & Permissions menu.

### Two-factor authentication

Enrollment is **Manage Two-Factor Authentication** in the user menu, not a section of Change Settings.

1. Open the user menu and click **Manage Two-Factor Authentication**.
2. Scan the QR code with an authenticator app (Google Authenticator, Authy, 1Password, etc.).
3. Enter the generated six-digit code to confirm enrollment.
4. Save the recovery codes somewhere safe.

Administrators turn the requirement on under **System Users → Settings → Quick Settings**. To clear 2FA for one person, use **Disable 2FA** on **System Users**.
