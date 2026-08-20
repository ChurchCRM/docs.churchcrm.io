---
title: Groups
sidebar_position: 10
---

# Groups

A Group is a collection of [People](/user-guide/persons) who occupy Roles within the Group. Groups can represent organizational, educational, and social constructs within your church.

**Example:** A Group called "Friday Night Bible Study" might have Roles like Leader, Assistant Leader, and Member. If 16 people are assigned to this group, 13 may be Members, 2 may be Assistant Leaders, and 1 may be the Leader.

---

## Groups Dashboard

The **Groups** menu opens a dashboard with:

- **Group list** with filter/search and live counts
- **Group types** quick access
- **Reports** — membership, attendance, and directory exports in one place
- **Group Map** — view groups with members plotted on the map
- **Group Settings** panel — for type and role configuration

Click any group to open the **Group View** page, which has been rebuilt as a modern MVC page with an offcanvas editor, inline role changes, and a dedicated tab for Sunday School classes.

### Key Features

- **Map This Group** — plots all group members on a Leaflet map directly from the Group View page, useful for geographic outreach planning.
- **Kiosk check-in for all groups** — any group can be assigned to a kiosk station, not just Sunday School. Link a group to an event, then assign that event to a kiosk device.
- **Event roster with member photos** — group event rosters show member photos on each row with improved badge contrast.

---

## Step-by-step: Creating a Group

1. Go to **Groups** → **Dashboard**, then click **Add New Group** (top-right of the page).
2. Enter **Group Name** (e.g., "3rd Grade Sunday School").
3. Enter **Description** (optional).
4. Choose **Group Type** (e.g., Sunday School, Small Group, Committee).
5. A default "Member" role is created — add more roles if needed (Leader, Teacher, etc.).
6. Click **Save**.

### Adding People to a Group

1. Search for people or go to **People** → **View All Persons**.
2. Add desired people to your [Cart](/user-guide/cart).
3. Go to **Groups** → **Cart to Group** (or navigate to `/groups/cart-to-group`).
4. Select the target group and optionally a role, then click **Add to Group**.

---

## Cart to Group

The **Cart to Group** page (`/groups/cart-to-group`) lets you bulk-assign all members currently in the Cart to a Group.

:::note New in 7.5.0
The Cart to Group feature is now available at `/groups/cart-to-group`. The legacy `CartToGroup.php` URL redirects to this new page.
:::

### How to use Cart to Group

1. Add the desired people to your [Cart](/user-guide/cart).
2. Navigate to **Groups** → **Cart to Group**.
3. Select the target **Group** from the dropdown.
4. Optionally select a **Role** for the new members (defaults to the group's Default Role if left blank).
5. Click **Add to Group** to assign all cart members.

All members of the cart will be added to the specified Group _if_ they do not already exist in that Group. Existing members will not be duplicated.

### Create Group + Add Cart

Use the **Create Group + ADD Cart** button to create a brand-new group and assign all current cart members to it in a single step. This is useful when you want to quickly form a new group from a set of search results or report output without first creating the group manually.

---

## Common Uses for Groups
- Bible study classes
- Ministry teams
- [Sunday School](/user-guide/sunday-school) classes
- Volunteer teams
- Committees
- Small groups

## How do I add a new Group?

1. Go to **Groups** → **Dashboard**, then click **Add New Group** (top-right of the page).

2. Complete the form.

3. Press _"Save"_.

4. When a new Group is created, a Role of "Member" is automatically created and assigned as the Default Role for that Group. (You may immediately change the name of this role, however.)

## How do I change the Name/Description/Type of a Group?

1. Go to **Groups** → **Dashboard**.

2. Click on the desired Group to open its Group View page.

3. Click the **edit (pencil) icon** in the Group View header to open the offcanvas editor.

4. Update the group name, description, or type in the editor.

5. Click **Save**.

## How do I add a new Role to a Group?

1. Go to **Groups** → **Dashboard**.

2. Click on the desired Group to open its Group View page.

3. Click the **edit (pencil) icon** in the Group View header to open the offcanvas editor.

4. In the **Group Roles** card, click the **Add Role** button (top-right of the card).

5. An **Add New Role** dialog appears. Type the name of the new Role in the **Role Name** field.

6. Click **Add Role** (or press Enter) to confirm.

The new Role appears in the roles table immediately. The **Add Role** button in the dialog is disabled until you enter at least one character.

:::note
Sunday School groups have two protected roles — **Student** and **Teacher** — that cannot be renamed or deleted. You can still add extra roles to a Sunday School group.
:::

## How do I change a Role in a Group?

1. Go to **Groups** → **Dashboard**.

2. Click on the desired Group to open its Group View page.

3. Click the **edit (pencil) icon** in the Group View header to open the offcanvas editor.

4. In the **Group Roles** table, click the role name in the **Role Name** column and type the new name.

5. Click or tab away from the field — changes are **saved automatically** when the input loses focus. No separate "Save" button is needed.

:::tip
Role name changes take effect immediately. The success notification confirms the save.
:::

## How do I delete a Role from a Group?

1. Go to **Groups** → **Dashboard**.

2. Click on the desired Group to open its Group View page.

3. Click the **edit (pencil) icon** in the Group View header to open the offcanvas editor.

4. In the **Group Roles** table, click the **trash** icon (🗑) in the **Delete** column for the role you want to remove.

5. A **Delete Confirmation** dialog appears, asking: _"Are you sure you want to remove the role '…'?"_

6. Click **Delete** to confirm, or **Cancel** to abort.

:::warning Last-role protection
If the role you are trying to delete is the **only remaining role** in the group, a warning is displayed in the confirmation dialog and the **Delete** button is disabled. You must add at least one other role before you can delete this one.
:::

:::note Sunday School roles
The **Student** and **Teacher** roles in Sunday School groups are protected — their delete button is disabled and shows a tooltip: _"This role cannot be deleted."_
:::

## What is the Default Role?

Every Group has a Default Role, which is simply the "standard" Role for a Member of that Group. For a class, for instance, the Default Role might be Student, because 95% of the people in the class will be Students. There will be other Roles -- Teacher, Assistant Teacher, etc. -- but most everyone will be a Student, so that's the Default Role.

Default Roles allow you to quickly add new Members to a group. If you have 200 People in your Cart, you don't have to specify Roles for every record to dump the Cart to a Group, they are simply added as the Default Role. This also allows quick sorting of the organizers of a Group. The Group View producers all Members of a Group who do not occupy the Default Role, which are usually the organizers and administrators of the Group.

## How do I change the Default Role for a Group?

1. Go to **Groups** → **Dashboard**.

2. Click on the desired Group to open its Group View page.

3. Click the **edit (pencil) icon** in the Group View header to open the offcanvas editor.

4. In the **Group Roles** table, click the **Default** button next to the role you want to set as default. The current default role shows a checkmark (✓ Default) instead of a button.

## What is Group Type?

Group types allow you to categorize your groups. For example, a group called "Gleaners Class" can be type "Sunday School" and a group called "Franklin House" can be type "Cell Groups". This helps in further classifying groups so that you don't have to memorize which group is associated with which type.

### How do I set a Group Type?

When a new group is created, you are given the option to set the group type.

### How do I change the available Group Types?

Go to **Groups** → **Edit Group Types**.

### What are Group-Specific Properties?

Group-Specific Properties is a powerful feature that allows you to add any fields that you need to use that do not come built-in with ChurchCRM. This feature allows you to, for example, add a Mentor to a person, or add an additional date (such as confirmation). The possibilities are endless.

### How do I use Group-Specific Properties?

See the [Custom Fields](/user-guide/custom-fields) help topic.

### How do I add People to a Group?

1. Add the desired people to your Cart.

2. With people in the Cart, go to **Groups** → **Cart to Group** (or navigate to `/groups/cart-to-group`).

3. On the resulting screen, select the desired Group, then press _"Add to Group"_.

All members of the cart will be added to the specified Group _if_ they do not already exist in that Group. If a Person in the cart already exists in the specified Group, that Person will not be added again.

All People will be added to the Group in that group's Default Role, unless you select a specific Role.

### How do I change the role of a Person in a Group?

1. Go to **Groups** → **Dashboard**.

2. Click on the desired Group to open its Group View page.

3. Click **View Members** (or the Members tab).

4. Find the desired Member and click on _"Change Role"_.

5. Select the new Role from the drop-down list.

6. Press _"Update"_.

### What is _"Add Group Members to Cart"_?

Adding group members to the cart is an easy way to add a group of individuals to the cart. Right now, the cart can be used to add individuals to a group. However, in future releases, the cart will be able to make group mailing lists and other features.

For more information, see the [Cart](/user-guide/cart) help topic.

### How do I assign a Property to a Group?

See the [Properties](/user-guide/properties) help topic.
