---
title: Maps & Geocoding
sidebar_position: 6
---

# Maps & Geocoding

ChurchCRM displays interactive maps and geocodes addresses (converting street addresses into latitude/longitude coordinates) so you can:

- View family and person locations on a map
- Find neighbors for pastoral visits and community outreach
- Auto-center the church map on your location
- Show a preview map on the Church Information page

## No API key required

Maps and geocoding use **OpenStreetMap** tiles rendered via **Leaflet**, and addresses are geocoded with **Nominatim** — OpenStreetMap's free, public geocoding service.

:::tip Zero configuration
There is nothing to set up. No Google Cloud account, no API key, no billing. Maps work out of the box on every new install and every upgrade.
:::

---

## Personal address priority

When a person has their own address on record (overriding the family address), ChurchCRM uses the **personal address** for geocoding instead of the family address. Members who live at a different location from their household are mapped to the right place automatically.

---

## Setting your church location

The church location centers the main map view and the Church Information preview.

1. Log in as an administrator
2. Go to **Admin → Church Information** (or complete the first-run wizard)
3. Enter your church address on the **Location & Map** tab
4. Click **Save** — the system automatically geocodes the address and displays a Leaflet map showing the detected location

Coordinates are detected automatically — no manual entry is required. Re-saving the address will refresh coordinates if you move or correct the address.

---

## Geocoding family addresses

Geocoding a family record happens automatically when you save an address in the Family Editor — coordinates are filled in as soon as the save succeeds, so ongoing maintenance is hands-off. There is currently no bulk "geocode all families" action; to backfill coordinates for existing records, re-save each family's address to trigger geocoding individually.

---

## Finding neighbors and viewing the map

Once families are geocoded, use **People → Family Map** to see them plotted on the map, and **Find Neighbors** (from the map page) to locate families near a given family for pastoral visits or outreach — see [Geographic Features](/user-guide/geographic) for the full walkthrough.

---

## Fair use and rate limits

Nominatim is a free public service with a [usage policy](https://operations.osmfoundation.org/policies/nominatim/) that caps lookups at roughly 1 request per second and prohibits heavy bulk scraping. ChurchCRM's usage — a handful of lookups whenever an address is saved — stays well within these limits for any normal church.

If your installation does frequent bulk imports that save many family addresses in a short window, consider running your own [Nominatim instance](https://nominatim.org/release-docs/latest/admin/Installation/) to avoid throttling.

---

## Troubleshooting

| Symptom | Cause | Solution |
|---------|-------|----------|
| Map tiles don't load | Server or client can't reach `tile.openstreetmap.org` | Check outbound HTTPS from your server and from the user's browser |
| Address saves but no coordinates appear | `nominatim.openstreetmap.org` is unreachable from your server | Check your server's outbound HTTPS and DNS |
| Map shows but centers on the wrong place | Church location not set | Open **Admin → Church Information**, save a valid address |
| Coordinates are wrong for one family | Nominatim couldn't parse the address | Edit the family address for clarity (spell out street suffixes, include country) and re-save |

---

## Related pages

- [Families](/user-guide/families) — where addresses are edited
- [Geographic Features](/user-guide/geographic) — neighbor finder and map view
- [First Run Configuration](/getting-started/first-run) — initial church location setup
