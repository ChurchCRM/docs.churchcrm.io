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

As of ChurchCRM 7.1, maps and geocoding use **OpenStreetMap** tiles rendered via **Leaflet**, and addresses are geocoded with **Nominatim** — OpenStreetMap's free, public geocoding service.

:::tip Zero configuration
There is nothing to set up. No Google Cloud account, no API key, no billing. Maps work out of the box on every new install and every upgrade.
:::

### What changed from earlier versions

Earlier ChurchCRM releases required a Google Maps API key (and optionally a Bing Maps key) to render maps or geocode addresses. Those keys are no longer used:

- `sGoogleMapsGeocodeKey` — **removed**
- `sGoogleMapsRenderKey` — **removed**
- `sBingMapKey` / `sGeoCoderProvider` — **removed**
- The **Map Settings** section of System Settings has been removed; only **Map Zoom Level** remains (under general settings)

If you are upgrading from an older release, no action is required. Your existing latitude/longitude coordinates on family records are preserved, and the app will use them immediately with the new map.

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

To populate latitude/longitude for all families in bulk:

1. Go to **People → Family Geographic Utilities**
2. Click **Update All Family Coordinates**
3. Families with valid addresses will have their coordinates filled in

Geocoding a single family record happens automatically when you save an address in the Family Editor, so ongoing maintenance is hands-off.

---

## Fair use and rate limits

Nominatim is a free public service with a [usage policy](https://operations.osmfoundation.org/policies/nominatim/) that caps lookups at roughly 1 request per second and prohibits heavy bulk scraping. ChurchCRM's usage — a handful of lookups when an address is saved, plus periodic "update all coordinates" runs — stays well within these limits for any normal church.

If your installation has tens of thousands of family records and you run frequent full re-geocodes, consider running your own [Nominatim instance](https://nominatim.org/release-docs/latest/admin/Installation/) to avoid throttling.

---

## Troubleshooting

| Symptom | Cause | Solution |
|---------|-------|----------|
| Map tiles don't load | Server or client can't reach `tile.openstreetmap.org` | Check outbound HTTPS from your server and from the user's browser |
| Address saves but no coordinates appear | `nominatim.openstreetmap.org` is unreachable from your server | Check your server's outbound HTTPS and DNS |
| Map shows but centers on the wrong place | Church location not set | Open **Admin → Church Information**, save a valid address |
| "Update All Family Coordinates" is slow | Nominatim rate-limits at ~1 req/sec | This is expected; the job spaces requests to stay polite |
| Coordinates are wrong for one family | Nominatim couldn't parse the address | Edit the family address for clarity (spell out street suffixes, include country) and re-save |

---

## Related pages

- [Families](/user-guide/families) — where addresses are edited
- [Geographic Utilities](/user-guide/geographic) — neighbor finder and map view
- [First Run Configuration](/getting-started/first-run) — initial church location setup
