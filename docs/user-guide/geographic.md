---
title: Geographic Features
sidebar_position: 20
---

# Geographic Features

ChurchCRM provides:

- **Geocoding** — Convert street addresses to latitude/longitude
- **In-browser maps** — Show locations of people and families
- **Proximity** — Find families that live close to each other

For setup, see [Google Maps Setup](/administration/google-maps-setup) or use Bing Maps as described there.

---

## Geocoding

ChurchCRM stores latitude and longitude with each family for map push-pins and proximity. You must configure a geocoding service (Google Maps or Bing Maps) in **Admin** → **System Settings** → **Map Settings**. See [Google Maps Setup](/administration/google-maps-setup) for API keys and restrictions.

:::tip API key restrictions
Configure application and API restrictions in Google Cloud Console to avoid unexpected charges. Use HTTP referrers for browser maps and follow the current [Google Maps Platform documentation](https://developers.google.com/maps/documentation).
:::

---

## In-app maps

From the **People** area, use **Family Map** (or **Family Geographic Utilities**) to view family locations by classification. The map requires a correctly configured Google Maps API key (both Geocoding API and Maps JavaScript API). Only families that have been successfully geocoded will appear.

---

## Finding families that live close together

1. Go to **People** → **Family Geographic Utilities**.
2. Select a family from the list.
3. Click **Show Neighbors**.
4. Use **Maximum number of neighbors** and **Maximum distance** to limit results.

---

## Export for other map tools

The Family Geographic Utilities page can generate annotation files for external tools (e.g. GPS Visualizer, mapping software). Choose the desired format and click **Make Data File**.
