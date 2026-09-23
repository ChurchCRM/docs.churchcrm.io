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

Maps use **OpenStreetMap** tiles rendered via **Leaflet**. Addresses are geocoded by the free, keyless services listed under **Geocoding services** in Map Settings — **Nominatim** (OpenStreetMap) first, then the **US Census Bureau** geocoder for United States addresses Nominatim cannot place.

:::tip Zero configuration
There is nothing to set up. No Google Cloud account, no API key, no billing. Maps work out of the box on every new install and every upgrade.
:::

---

## Geocoding services

**People → Family Map → Map Settings** (administrators only) has a **Geocoding services** field. It is a comma-separated ranking of the services ChurchCRM asks, in order, until one returns coordinates. The default is `Nominatim, Census`.

![Map Settings panel on the Family Map with the Geocoding services field set to "Nominatim, Census"](/img/administration/family-map-map-settings.png)

| Service | Coverage | Strengths and limits |
|---------|----------|----------------------|
| **Nominatim** (OpenStreetMap) | Worldwide | Free, no key. Needs the street spelled the way OpenStreetMap has it, and house-number coverage is thin outside well-mapped cities. |
| **Census** (US Census Bureau geocoder) | United States only | Free, no key. Interpolates house numbers from TIGER street ranges, so it resolves most suburban and rural US addresses that Nominatim misses. Skipped automatically for families whose country is not the United States. |

- To stop using a service, delete it from the list and click **Save Settings**. `Nominatim` alone gives the pre-7.7 behaviour.
- Order matters: the first service that answers wins. Put the one you trust most first.
- Names are matched case-insensitively. Unknown names are logged and ignored; an empty list falls back to Nominatim.
- The ranking applies everywhere ChurchCRM geocodes — family and person addresses on save, the church address on the Church Information page, and **Update All Coordinates** on the Family Map.

Before an address is sent to any service, ChurchCRM normalises common street-name variants (for example `NW 10 Street` is looked up as `NW 10th Street`), which improves the hit rate for addresses typed in a hurry.

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

Geocoding a family record happens automatically when you save an address in the Family Editor — coordinates are filled in as soon as the save succeeds, so ongoing maintenance is hands-off.

To backfill coordinates for existing records, open **People → Family Map** as an administrator and click **Update All Coordinates**. The button shows how many families are still missing coordinates. It works through them in batches of 50 (about a minute per batch) using the geocoding services chosen in Map Settings, runs to completion from one click, and lists any families it could not resolve when it finishes. You can keep the page open while it runs.

![Family Map header with the Find Neighbors, Map Settings and Update All Coordinates buttons](/img/administration/family-map-header-buttons.png)

---

## Finding neighbors and viewing the map

Once families are geocoded, use **People → Family Map** to see them plotted on the map, and **Find Neighbors** (from the map page) to locate families near a given family for pastoral visits or outreach — see [Geographic Features](/user-guide/geographic) for the full walkthrough.

---

## Fair use and rate limits

Nominatim is a free public service with a [usage policy](https://operations.osmfoundation.org/policies/nominatim/) that caps lookups at roughly 1 request per second and prohibits heavy bulk scraping. The US Census Bureau geocoder is likewise a free public service. ChurchCRM's usage — a handful of lookups whenever an address is saved, and a paced batch run for **Update All Coordinates** — stays well within these limits for any normal church.

If your installation does frequent bulk imports that save many family addresses in a short window, consider running your own [Nominatim instance](https://nominatim.org/release-docs/latest/admin/Installation/) to avoid throttling.

---

## Troubleshooting

| Symptom | Cause | Solution |
|---------|-------|----------|
| Map tiles don't load | Server or client can't reach `tile.openstreetmap.org` | Check outbound HTTPS from your server and from the user's browser |
| Address saves but no coordinates appear | `nominatim.openstreetmap.org` or `geocoding.geo.census.gov` is unreachable from your server | Check your server's outbound HTTPS and DNS |
| Many US suburban or rural addresses stay unresolved | Only Nominatim is listed under Geocoding services | Make sure `Census` is in the list, then run **Update All Coordinates** again |
| Map shows but centers on the wrong place | Church location not set | Open **Admin → Church Information**, save a valid address |
| Coordinates are wrong for one family | The geocoding service couldn't parse the address | Edit the family address for clarity (spell out street suffixes, include country) and re-save |

---

## Related pages

- [Families](/user-guide/families) — where addresses are edited
- [Geographic Features](/user-guide/geographic) — neighbor finder and map view
- [First Run Configuration](/getting-started/first-run) — initial church location setup
