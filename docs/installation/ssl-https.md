---
title: SSL / HTTPS
sidebar_position: 7
---

# SSL

To protect the data of your church, we *highly recommend* that you run ChurchCRM on a site with SSL configured.

ChurchCRM will display an administrative task in the application if it detects that SSL is not in use.

This task will automatically be removed when ChurchCRM is accessed via SSL.

For additional security, ChurchCRM can issue an `HTTP Strict Transport Security (HSTS)` header so that client browsers will always connect over HTTPS. This setting is configured at the database level, so if you migrate your database to a new host, the header will still be issued.

To enable HSTS:

* On the side menu, select Admin, which expands and then select "Edit General Settings"
* Select the System Settings tab
* Scroll down to `bHSTSEnable`, and set it to TRUE
