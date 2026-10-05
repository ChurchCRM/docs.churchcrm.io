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

Maps use **OpenStreetMap** tiles rendered via **Leaflet**. Addresses are geocoded with **Nominatim** (OpenStreetMap), a free, keyless service. Administrators can also turn on the free **US Census Bureau** geocoder for United States addresses that Nominatim cannot place — see [Geocoding services](#geocoding-services).

:::tip Zero configuration
There is nothing to set up. No Google Cloud account, no API key, no billing. Maps work out of the box on every new install and every upgrade.
:::

---

## Geocoding services

**People → Admin → People Settings → Map Settings** (administrators only) has a **Geocoding services** field. The **Map Settings** button on the Family Map opens the same place. Pick the services ChurchCRM should ask: it tries them in the order you picked them until one returns coordinates. Changes save as soon as you make them. The default is **Nominatim** alone, and Nominatim is also used when nothing is picked.

| Service | Coverage | Strengths and limits |
|---------|----------|----------------------|
| **Nominatim** (OpenStreetMap) | Worldwide | Free, no key. Needs the street spelled the way OpenStreetMap has it, and house-number coverage is thin outside well-mapped cities. |
| **US Census** (US Census Bureau geocoder) | United States only | Free, no key, off until you pick it. Interpolates house numbers from TIGER street ranges, so it resolves most suburban and rural US addresses that Nominatim misses. Skipped for addresses outside the United States. |

- To turn on US Census, pick it after Nominatim. To stop using a service, click the **×** on it.
- Order matters: the first service that finds the address wins. To try US Census first, remove both and pick US Census first.
- To decide whether an address is in the United States, ChurchCRM uses the record's own country, then the **Default Country** in People Settings, then the church's country. When all three are blank, US Census is not asked.
- Once about 18 seconds have passed on one lookup, ChurchCRM stops trying further services, so a slow service cannot hold up saving an address for long.
- The order applies everywhere ChurchCRM geocodes — family and person addresses on save, the church address on the Church Information page, and **Update All Coordinates** on the Family Map.

Before an address is sent to any service, ChurchCRM normalises common street-name variants (for example `NW 10 Street` is looked up as `NW 10th Street`), which improves the hit rate for addresses typed in a hurry.

---

## Personal address priority

When a person has their own address on record (overriding the family address), ChurchCRM uses the **personal address** for geocoding instead of the family address. Members who live at a different location from their household are mapped to the right place automatically.

---

## Setting your church location

The church location centers the main map view and the Church Information preview.

1. Log in as an administrator
2. Go to **Admin → Church Information** (or complete the first-run wizard)
3. Enter your church address in the **Location** card
4. Under **Map Coordinates**, click **Generate Coordinates** to look up the latitude and longitude from the address, or type them in yourself
5. Click **Save Church Information**. If both coordinates are blank, ChurchCRM looks them up from the address when you save. Once coordinates are saved, a Leaflet map shows the church's location.

Saving does not look up the address again while coordinates are filled in. If you move or correct the address, the card warns that the address has changed since the coordinates were set: click **Generate Coordinates** before you save to refresh them.

---

## Geocoding family addresses

Geocoding a family record happens automatically when you save an address in the Family Editor — coordinates are filled in as soon as the save succeeds, so ongoing maintenance is hands-off.

To backfill coordinates for existing records, open **People → Family Map** as an administrator and click **Update All Coordinates**. The button shows how many families are still missing coordinates. It works through them in batches of 50 (about a minute per batch) using the geocoding services chosen in Map Settings, runs to completion from one click, and lists the families it could not resolve when it finishes. Each batch reports at most 20 failed families; if a batch has more, the page shows how many are not listed. You can keep the page open while it runs.

---

## Finding neighbors and viewing the map

Once families are geocoded, use **People → Family Map** to see them plotted on the map, and **Find Neighbors** (from the map page) to locate families near a given family for pastoral visits or outreach — see [Geographic Features](/user-guide/geographic) for the full walkthrough.

---

## Fair use and rate limits

Nominatim is a free public service with a [usage policy](https://operations.osmfoundation.org/policies/nominatim/) that caps lookups at roughly 1 request per second and prohibits heavy bulk scraping. The US Census Bureau geocoder, when you turn it on, is likewise a free public service. ChurchCRM's usage — a handful of lookups whenever an address is saved, and a paced batch run for **Update All Coordinates** — stays well within these limits for any normal church.

If your installation does frequent bulk imports that save many family addresses in a short window, consider running your own [Nominatim instance](https://nominatim.org/release-docs/latest/admin/Installation/) to avoid throttling.

---

## Troubleshooting

| Symptom | Cause | Solution |
|---------|-------|----------|
| Map tiles don't load | Server or client can't reach `tile.openstreetmap.org` | Check outbound HTTPS from your server and from the user's browser |
| Address saves but no coordinates appear | `nominatim.openstreetmap.org` or `geocoding.geo.census.gov` is unreachable from your server | Check your server's outbound HTTPS and DNS |
| Many US suburban or rural addresses stay unresolved | Only Nominatim is picked under Geocoding services | Pick **US Census** in People Settings → Map Settings, then run **Update All Coordinates** again |
| Map shows but centers on the wrong place | Church location not set | Open **Admin → Church Information**, save a valid address |
| Coordinates are wrong for one family | The geocoding service couldn't parse the address | Edit the family address for clarity (spell out street suffixes, include country) and re-save |

---

## Related pages

- [Families](/user-guide/families) — where addresses are edited
- [Geographic Features](/user-guide/geographic) — neighbor finder and map view
- [First Run Configuration](/getting-started/first-run) — initial church location setup
