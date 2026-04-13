---
title: Geographic Features
sidebar_position: 20
---

# Geographic Features

ChurchCRM provides:

- **Geocoding** — Convert street addresses to latitude/longitude
- **In-browser maps** — Show locations of people and families
- **Proximity** — Find families that live close to each other

Maps and geocoding work out of the box using **OpenStreetMap** tiles and **Nominatim** — no API key, no billing, and no setup required. If you want background on how it works or how to troubleshoot, see [Maps & Geocoding](/administration/maps-and-geocoding).

---

## Geocoding

ChurchCRM stores latitude and longitude with each family for map push-pins and proximity. Coordinates are filled in automatically when a family address is saved. To populate coordinates in bulk for existing records, use **People → Family Geographic Utilities → Update All Family Coordinates**.

:::tip Fair use
Nominatim is a free public service. "Update All Family Coordinates" spaces requests out to respect the [Nominatim usage policy](https://operations.osmfoundation.org/policies/nominatim/) — expect it to take a few seconds per 1,000 families.
:::

---

## In-app maps

From the **People** area, use **Family Map** (or **Family Geographic Utilities**) to view family locations by classification. The map uses Leaflet and OpenStreetMap tiles. Only families that have been successfully geocoded will appear as pins.

---

## Finding families that live close together

1. Go to **People** → **Family Geographic Utilities**.
2. Select a family from the list.
3. Click **Show Neighbors**.
4. Use **Maximum number of neighbors** and **Maximum distance** to limit results.

The neighbor finder is also available via the `/api/map/neighbors/{familyId}` API endpoint for custom integrations.

---

## Export for other map tools

The Family Geographic Utilities page can generate annotation files for external tools (e.g. GPS Visualizer, mapping software). Choose the desired format and click **Make Data File**.
