---
title: Google Maps Setup
sidebar_position: 6
---

# Google Maps Setup

ChurchCRM uses Google Maps for:

1. **Geocoding** — Converting addresses to latitude/longitude coordinates
2. **Map rendering** — Displaying interactive maps in the browser

## Prerequisites

- A Google Cloud Platform account
- A project in Google Cloud Console
- Billing enabled (Google provides $200/month free credit; most churches stay within free tier)

---

## Step 1: Enable Required APIs

You must enable **both** APIs in Google Cloud Console:

1. Go to [Google Cloud Console - API Library](https://console.cloud.google.com/apis/library)
2. Search for and enable **Geocoding API** — used server-side for address lookups
3. Search for and enable **Maps JavaScript API** — used client-side for map display

:::important Both APIs required
If you only enable Geocoding API, address lookups work but maps won't display. If you only enable Maps JavaScript API, maps load but geocoding fails.
:::

---

## Step 2: Create an API Key

1. Go to [Google Cloud Console - Credentials](https://console.cloud.google.com/apis/credentials)
2. Click **Create Credentials** → **API Key**
3. Copy the generated API key
4. (Recommended) Click **Edit API key** to add restrictions:
   - **Application restrictions**: HTTP referrers (your ChurchCRM domain)
   - **API restrictions**: Restrict to Geocoding API and Maps JavaScript API

---

## Step 3: Configure ChurchCRM

1. Log in to ChurchCRM as an administrator
2. Go to **Admin** → **System Settings** (or **Edit General Settings**)
3. Find the **Map Settings** section
4. Enter your API key in:
   - **sGoogleMapsGeocodeKey** — For address geocoding
   - **sGoogleMapsRenderKey** — For map rendering
5. Click **Save**

:::tip Same key for both
You can use the same API key for both fields if both APIs are enabled on that key.
:::

---

## Step 4: Set Church Location

For maps to center correctly:

1. Go to **Admin** → **System Settings**
2. Find **Church Information**
3. Enter your church address
4. Set **iChurchLatitude** and **iChurchLongitude** (or use **Update All Family Coordinates** to auto-populate)

---

## Step 5: Update Family Coordinates

To geocode all family addresses:

1. Go to **People** → **Family Geographic Utilities**
2. Click **Update All Family Coordinates**
3. Families with valid addresses will have lat/lng populated

---

## Alternative: Bing Maps

ChurchCRM also supports Bing Maps for geocoding:

1. Get a Bing Maps API key from [Bing Maps Portal](https://www.bingmapsportal.com/)
2. In System Settings → Map Settings:
   - Set **sGeoCoderProvider** to `BingMaps`
   - Enter your key in **sBingMapKey**

> **Note:** Bing Maps supports geocoding only; map rendering still requires Google Maps JavaScript API.

---

## Troubleshooting

| Symptom | Cause | Solution |
|---------|-------|----------|
| "InvalidKeyMapError" in browser console | Maps JavaScript API not enabled | Enable Maps JavaScript API in Google Cloud Console |
| Maps load but addresses don't geocode | Geocoding API not enabled | Enable Geocoding API in Google Cloud Console |
| "0 families with no Geodata" but coordinates blank | Geocoding key missing/invalid | Check sGoogleMapsGeocodeKey in System Settings |
| Works locally, fails in production | API key restrictions | Add production domain to HTTP referrer restrictions in API key settings |
| "This API key is not authorized" | API restrictions too narrow | Add both Geocoding API and Maps JavaScript API to allowed APIs |

---

## Cost Considerations

- **Geocoding API**: ~$5 per 1,000 requests (first $200/month free)
- **Maps JavaScript API**: ~$7 per 1,000 loads (first $200/month free)

For typical churches: family geocoding is one-time; map loads occur when users view map pages. Most stay within the free tier. Set up [budget alerts](https://console.cloud.google.com/billing) to monitor usage.
