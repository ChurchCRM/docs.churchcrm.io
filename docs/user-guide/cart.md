---
title: Cart
sidebar_position: 16
---

# Cart

The Cart is a temporary holding space for People records. You can add People to the Cart, then process these People records all at once, by generating labels or dumping the contents of the cart to a group.

You may put an unlimited number of People in the Cart. Putting someone in the Cart does nothing to their record, they are just temporarily assigned to the Cart. You can put someone in the Cart, then remove then without doing any processing, and their record will remain unchanged.

The Cart is user- and session-specific. Every User has his or her own Cart, and that Cart will only last until the User logs off -- Carts do not span sessions.

## How can I see what's in my Cart?

A real-time counter in the header shows how many records are in the Cart; it updates as you add or remove records.

To see the actual records in your Cart, click on the cart icon in the upper right corner. This will display a context menu for quick cart actions. You may also choose to "View Cart" to show all people currently in the cart.

## How do I add a Person to the Cart?

There several ways to do this:

### To add an individual Person

1. Go to **People** → **View All Persons** to list people, or  
2. Enter a name in the search/filter box and press Enter.
3. When the results of the filter are displayed, there will be a link on the far right of every Person record called _"Add to Cart."_ Click this link for the desired Person.
4. If this Person does not already exist in the cart, they will be added.

### Alternately

1. View the desired Person record, and within that record will be a link for "Add to Cart."
2. Clicking this link accomplishes the same thing as the process described above.
3. To add the results of a report: Some reports will allow you to dump the results to the Cart, and some won't -- it depends what the report returns. Since the cart holds People, a report that returned Family records will not allow the results to be placed in the Cart.

## Run the desired report

If the report is Cart-enabled, at the bottom of the results you will find a button labeled _"Add Results to Cart."_ Clicking this button will add all the results of that report to the cart.
To add all people assigned to a Group:

Go to **Groups** → **Cart to Group** (or navigate to `/groups/cart-to-group`).
Click on the desired Group or use the **Create Group + ADD Cart** button to create a new group and add all cart members to it in one step.

## Add to Family

The **Add to Family** workflow lets you bulk-assign all Cart members to an existing Family record.

:::note New in 7.5.0
The Add to Family route is now at `/people/cart/to-family`. The legacy `CartToFamily.php` URL redirects to this new route. The cart is now emptied automatically on the server side when the operation succeeds — you no longer need to navigate to `?Action=EmptyCart` after adding members to a family.
:::

### How to use Add to Family

1. Add the desired people to your [Cart](/user-guide/cart).
2. Navigate to **People** → **Cart** → **Add to Family** (or go to `/people/cart/to-family`).
3. Select the target Family from the dropdown.
4. Click **Add to Family**.
5. The cart members are added to the family and the cart is cleared automatically upon success.

## How do I remove a person from the Cart?

1. Go to **Cart** → **List Cart Items**.
2. On the resulting screen, all the People currently in the Cart will be listed, with a "Remove" link to the far right of their name.
3. Clicking this link will remove the specified Person from the Cart.

> **Note:** To empty the Cart completely, click the _"Empty Cart"_ link at the bottom of the page. (Do not confuse this with _"Empty Cart to Group."_, _"Empty Cart"_ simply removes all People from the Cart, without moving them anywhere.)
