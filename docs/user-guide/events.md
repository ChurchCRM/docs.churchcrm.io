---
title: Events
sidebar_position: 11
---

# Events

ChurchCRM allows you to create events which will appear in your church calendar.

Events can be recurring (such as a weekly church service) or unique (such as a community outreach day).

Once an event is created, you can:

* Take attendance for your event and review attendance metrics
* Manage child care security by checking children in and out of classrooms
* View event history and statistics

> **Tip:** Events appear on your church calendar and can be set to recur automatically.

---

## Step-by-step: Recording Attendance

1. **Create an event type** (if needed): **Events** → **List Event Types** → **Add Event Type**.
2. **Create an event**: **Events** → **Add Church Event** — choose type, date, time, and save.
3. **Add people to the Cart**: Search or browse people, click **Add to Cart**.
4. **Record attendance**: **Cart** → **Empty Cart to Event** → select the event → **Add Cart to Event**.

Attendance is saved automatically. Use **Data/Reports** → **Event Attendance Reports** to view attendance history.

---

## Creating an Event Type

Event types behave like templates which define the parameters for events you will create in the future. Event types allow you to set details such as the recurrence frequency and the default start time an event can have.

You can also create free-form text fields allowing you to identify the type of individuals you would like to count for the purpose of attendance. These fields are arbitrary, carry no inherent meaning, and possess no relationship with the ChurchCRM database itself.

To create an event type:

1. Choose *Events – List Event Types*.
2. Choose *Add Event Type*.
3. Make your entries and choose *Save Changes*.

### Example

You want to create an event type to support the "Newcomers' Lunch" you host once in a while at your church. The lunch doesn't take place on a regular basis, and you want to be able to see the number of regular churchgoers (whether they are members or not) as well as newcomers who attended this lunch.

To do this, you will add a new event type and make the following settings:

* **Event Type Name**: Newcomers' Lunch
* **Recurrence Pattern**: None
* **Default Start Time**: 12:30PM
* **Attendance Counts**: Regular Churchgoers, Newcomers

## Creating an Event

Events inherit some properties from event types. You can additionally define the event title, description, date range, event sermon (if any), and status.

To create an event:

1. Choose *Events -> Add Church Event*.
2. Select an event type.
3. Make your entries and choose *Save Changes*.

![TODO-SCREENSHOT: Add Church Event form showing event type selection, title, date range, and description fields](/img/placeholder.png)

## Taking Attendance for an Event

Throughout the course of an event, you can take attendance to track the participation across various people classifications, such as members, regular attenders, visitors, and so on.

To add an existing person to an event:

1. Choose *Members -> View All Persons*.
2. In the **Filter and Cart** area, enter a name in the search field and choose *Apply Filter*.
3. In the **Listing** area, choose the *Add to Cart* icon.
4. Continue adding people to the cart as described in the previous steps.
5. Choose the shopping cart icon in the header bar at the top of the screen.
6. Choose *Empty Cart to Event*.
7. Select your event and choose *Add Cart to Event*.

To add a visitor to an event:

1. Choose *Members -> Add New Person*.
2. Make your entries, ensuring you set the **Classification** field to *Guest*.
3. Choose *Save*.
4. Choose *Add to Cart*.
5. Choose the shopping cart icon in the header bar at the top of the screen.
6. Choose *Empty Cart to Event*.
7. Select your event and choose *Add Cart to Event*.

## Generating Attendance Reports for an Event

You can generate reports based on attendance history for an event. The tracked person types measured are defined in the event type.

To generate a report:

1. Choose *Data/Reports -> Reports Menu*.
2. Choose an event type from the *Event Attendance Reports* area.
3. Choose a person type corresponding to the event for which you wish to generate a report.

## Checking Children In and Out of an Event

During any event, you can monitor the checking in and checking out of children to comply with your church child protection policy.
In this scenario, you use the `PersonID` number associated with an individual to identify them in the system. This `PersonID` number is recognizable in the URL of the individual’s record in the system.

![TODO-SCREENSHOT: Check-in and Check-out screen showing event selection and PersonID entry fields for child and parent/guardian](/img/placeholder.png)

To check a child into an event:

1. Choose *Events -> Check-in and Check-out*.
2. Select an event.
3. Enter the `PersonID` of the child in the left-hand field and the `PersonID` of the parent or guardian in the right-hand field. Note that you can use the Person Listing (*Members -> View All Members*) to look up and determine the `PersonID` of any individual.
4. Choose *Verify*.
5. Review the data and choose *CheckIn*.

To check a child out of an event:

1. Choose *Events -> Check-in and Check-out*.
2. Select an event.
3. Locate the entry of a child who had previously been checked into the system and choose *Checkout*.
4. Enter the `PersonID` of the parent or guardian in the right-hand field. Note that you can use the **Person Listing** (*Members -> View All Members*) to look up and determine the `PersonID` of any individual.
5. Choose *Verify CheckOut*.
6. Review the data and choose *Finalize CheckOut*.
