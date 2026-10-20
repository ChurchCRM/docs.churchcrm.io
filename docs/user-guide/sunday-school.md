---
title: Sunday School
sidebar_position: 12
---

# Sunday School

Sunday School classes in ChurchCRM are managed as [Groups](/user-guide/groups) with a special "Sunday School Class" type. This provides a dedicated dashboard with class-specific features.

## Creating a Sunday School Class

1. Go to **Groups** → **Dashboard**, then click **Add New Group** (top-right of the page).
2. Enter the class name (e.g., "Children's Class - Ages 5-7")
3. Set **Type of Group** to **Sunday School Class**
4. Click **Save Changes**

### Setting Up Roles

Sunday School groups come with two **pre-created, protected roles**: **Teacher** and **Student**. These roles cannot be renamed or deleted. The Student role is the default role for new members.

You can optionally add extra roles (e.g., "Assistant Teacher", "Substitute") using the **Add Role** button in the group's offcanvas editor.

## Adding Students and Teachers

1. Open the Sunday School class.
2. Use **Add Member** on the group page and choose the person.
3. The new member is a **Student** unless you set another role. Use **Change Role** and **Save** to make someone a **Teacher**.

> **Tip:** To add several students at once, put them in the [Cart](/user-guide/cart) and choose **Empty Cart to Group**. The page title is **Add Cart to Group**. Click **Add to Group**.

### Teachers managed from a ministry

With [Volunteer Management (v2)](./ministries/index.md) on, a ministry that provides teachers for Sunday School can link one of its teams to a class. From then on the class's teachers are managed in the ministry: everyone qualified for a position of that team is a **Teacher** of the class. The class page says *"Teachers of this class are managed in Ministries → … → …"* (with an **Open the ministry** link for those who may manage it), and teacher changes are refused here. Students are added and removed on the class page as before. See [Linking a team to a Sunday School class](./ministries/ministries-teams-positions.md#linking-a-team-to-a-sunday-school-class).

## Filling a class by grade

If you record [school grades](/user-guide/school-grades), next year's class starts from a range of grades:

1. Open **Reports → People Reports → People by Grade**.
2. Choose **From Grade** and **Through Grade**, for example **Kindergarten** through **5th**, and click **Run Report**.
3. Click **Add All to Cart**.
4. In the [Cart](/user-guide/cart), choose **Empty Cart to Group** and pick the class.

The class roster has a **Grade** column, so you can see each student's grade at a glance.

## Tracking Attendance

Sunday School attendance is tracked through [Events](/user-guide/events):

1. Create an Event Type for your Sunday School (e.g., "Sunday School - Children")
2. Create individual events for each class session
3. Check in students as they arrive
4. Generate attendance reports over time

See the [Events](/user-guide/events) documentation for detailed instructions.

## Sunday School Dashboard

Each Sunday School class has a dedicated dashboard showing:
- Class roster with student and teacher lists
- Attendance statistics
- Quick actions for common tasks

## Contacting the class

There is no **View Members** action and no **Compose Message** button.

On the class group page, **Email** opens a message to the class when email is turned on. **Text** copies numbers or opens the device messaging app. See [Text Messages](/user-guide/text-messages).
