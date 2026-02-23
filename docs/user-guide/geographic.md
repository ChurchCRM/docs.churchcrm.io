---
title: Geographic Features
sidebar_position: 20
---


ChurchCRM provides various geographic capabilities including:
*  Converting street addresses to Latitude/Longitude coordinates (Geocoding)
*  Rendering in-browser maps to display locations of People / Families
*  Identifing families in close proximity to eachother

## Address Lookup - Geocoding

ChurchCRM stores the latitude and longitude with each family in order to render push-pins on maps and to caluclate proximity between families.

Converting a given street address into coordinates requires ChurchCRM to be configured with a Geo coding services. We curretly support the Google Maps Geocoding API, and Bing Maps Geocoding API.

### Google Maps Geocoding API
In order to use the Google Maps Geocoding API, you _must_ configure an API key in the Google Cloud Admin panel. At the time of this writing (July 2021), creating and using Maps API keys for Geocoding is free below a threshold **but** still requires billing enabled on the Google Cloud Compute project.

Documentation for creating the API keys is available here: https://cloud.google.com/docs/authentication?hl=en

While creating a Google Maps Geocoding API key, please ensure to configure the API restrictions appropriately:
*  Application Restrictions
   *  IP Addresses - supply the IP Address of your ChurchCRM server
*  API Restrictions
   * Geocoding API

*_Improper API key restriction configuration could result in unexpected charges to your Google Cloud account_*

Google has specifically stopped supporting referrer-based restrictions (link?) and if you have enabled them in hte past, you will start to see errors like this in the ChurchCRM application log:
```
[2021-07-13T10:52:57.986155+10:00] defaultLogger.WARNING: issue creating geoCoder API access denied.
    Request: https://maps.googleapis.com/maps/api/geocode/json?address=URL-encoded-street-address&language=en&key=YOUR_API_KEY -
    Message: API keys with referer restrictions cannot be used with this API. [] {
        "url":"/FamilyEditor.php?FamilyID=xx","remote_ip":"111.222.333.444","correlation_id":"60ece3e9f0c36" }
```

### Bing Maps Geocoding API
* To be determined*

## In-App Maps
From the People Dashboard, a "Family Map" button is available.

This allows you to visualize the locations of all families by classification.

In order for this map to appear, you must have a correctly configured Google Maps API key:
*  Application Restrictions
   *  HTTP Referrers - supply the fully qualified domain name portion of the URL from which your ChurchCRM users will access the application.

*  API Restrictions
   * Maps Javascript API

*_Improper API key restriction configuration could result in unexpected charges to your Google Cloud account_*

Additionally, only families which have been successfully resolved using the configured geocoder in your ChurchCRM installation.

![TODO-SCREENSHOT: Family Map view showing an interactive map with push-pins for each family location, filterable by classification](/img/placeholder.png)

## How do I find Families that live close to each other?

Select _"Family Geographic Utilities"_ from the _"People"_ menu, then select a Family from the list. Press _"Show Neighbors"_ and this page will update with the nearest neighbor families listed at the bottom. The Maximum number of neighbors and Maximum distance fields are used to limit the number of neighbor families displayed.

![TODO-SCREENSHOT: Family Geographic Utilities page showing the family selector, Show Neighbors button, and neighbor results list](/img/placeholder.png)

## Are other types of maps available?

The _"Family Geographic Utilities"_ page can also make annotation files for the GPS Visualizer web site or the Delorme Street Atlas USA map program. To make an annotation file select the desired format and press _"Make Data File"_.
