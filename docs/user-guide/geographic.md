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

ChurchCRM stores latitude and longitude with each family for map push-pins and proximity. Coordinates are filled in automatically whenever a family address is saved — there's no separate bulk step to run.

---

## In-app maps

From the **People** area, use **Family Map** to view family locations by classification. The map uses Leaflet and OpenStreetMap tiles. Only families that have been successfully geocoded will appear as pins.

---

## Finding families that live close together

1. Go to **People** → **Family Map**.
2. Click **Find Neighbors** (header button on the map page).
3. Select a family, then set **Maximum number of neighbors** and **Maximum distance**, and optionally filter by classification.
4. Click **Find Neighbors** to see results as map markers and as a results table (distance, direction, family, people).
5. Use **Add All to Cart** / **Remove All from Cart** to act on the results.

The neighbor finder is also available via the `/api/map/neighbors/{familyId}` API endpoint for custom integrations.
