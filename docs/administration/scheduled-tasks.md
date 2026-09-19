---
title: Scheduled Tasks (Cron)
sidebar_position: 9
description: Run ChurchCRM's background jobs (birthday emails and plugin scheduled tasks) from cron, and understand the dashboard warning and the two related settings.
---

# Scheduled Tasks (Cron)

ChurchCRM has a small set of **background jobs** — the automatic birthday greeting emails (see [System Settings](./system-settings.md)) and the scheduled tasks that installed [plugins](./plugins/index.md) register. Together these are called the *timer jobs*.

Out of the box the timer jobs only run when somebody loads a page in ChurchCRM. That is fine for a church where staff log in every day, but on a quiet weekday with no logins **no scheduled mail goes out at all**. To make the jobs run reliably, install the cron entry described below.

---

## How the jobs run

| Trigger | When it runs | Notes |
|---------|--------------|-------|
| **Cron (recommended)** | On the schedule you set in your crontab | Runs whether or not anyone is logged in. This is the supported way to run the jobs. |
| **Page load (fallback)** | Shortly after any signed-in user loads a page | Kept as a safety net. Rate-limited so that a busy Sunday morning does not run the jobs once per page view (see [Settings](#settings) below). |

Both triggers run exactly the same jobs; installing the cron entry does not switch the page-load fallback off, and the fallback does not run again until the configured minimum interval has passed.

---

## Setting up the cron entry

The task runner ships with every ChurchCRM install as `cli/timerjobs.php` inside the ChurchCRM directory. It is a command-line script only — requesting it through the web server returns *403 Forbidden*.

### Self-hosted (Linux server)

1. Find the ChurchCRM directory on your server (for example `/var/www/html/churchcrm`) and the path to the PHP command-line binary (`which php`, typically `/usr/bin/php`).
2. Open the crontab of the **same user your web server runs as** (`www-data` on Ubuntu/Debian, `apache` on Rocky Linux/RHEL). Running the jobs as that user keeps any files they write readable by the web server.

   ```sh
   sudo crontab -u www-data -e
   ```

3. Add one line. Hourly is a good default:

   ```
   0 * * * * /usr/bin/php /var/www/html/churchcrm/cli/timerjobs.php >> /var/log/churchcrm-cron.log 2>&1
   ```

   Replace the two paths with your own. To run more often, use `*/15 * * * *` (every 15 minutes) instead of `0 * * * *`.

4. Save. The next run clears the dashboard warning described below.

The runner exits with status `0` when the jobs ran and `1` when ChurchCRM could not start or a job failed, so it works with any cron monitoring you already use. If you have Composer installed, `composer run timerjobs` from the ChurchCRM directory runs the same script.

### cPanel and other shared hosting

Most hosting control panels offer a **Cron Jobs** page. Create a job that runs hourly with the command:

```
/usr/local/bin/php /home/<your-account>/public_html/churchcrm/cli/timerjobs.php
```

Your host's Cron Jobs page usually shows the correct path to PHP; use that in place of `/usr/local/bin/php`.

:::tip Find the exact command on the Admin Dashboard
When the jobs have not run recently, the Admin Dashboard warning (below) shows a crontab line already filled in with this installation's own path. Copy it from there.
:::

---

## The "Scheduled tasks are not running" warning

The Admin Dashboard (**Admin → Admin Dashboard**) records when the timer jobs last completed. When that is longer ago than the configured threshold — **26 hours** by default, enough for a daily cron plus some drift — the dashboard shows a warning with the last run time and a paste-ready crontab line:

![Admin Dashboard warning that scheduled tasks are not running, with the suggested crontab line](/img/administration/scheduled-tasks-warning.png)

The warning also appears on a fresh install where the jobs have never run. It disappears on its own once the jobs have completed, whether from cron or from the page-load fallback.

---

## Settings

Two settings control this behaviour. Both are numbers; `0` has a special meaning for each.

| Setting | Default | What it does |
|---------|---------|--------------|
| `iTimerJobsStaleHours` | `26` | How many hours may pass since the last run before the Admin Dashboard shows the warning. Set to `0` to turn the warning off. |
| `iTimerJobsMinIntervalMinutes` | `15` | Minimum number of minutes between runs triggered by a **page load**. Stops a busy service morning from running the jobs on every page view. It does not apply to the cron runner, which always runs — your crontab already decides the cadence. Set to `0` to run on every page load, as older versions did. |

A third value, `sLastTimerJobsRunDateTime`, is the recorded time of the last completed run. It is internal — do not edit it.

:::note
At the time of writing these two settings are not shown on the **Admin → System Settings** page, so they run at their defaults unless an administrator with database access changes them in the `config_cfg` table. Leaving the defaults is right for almost every church.
:::

---

## Troubleshooting

| Symptom | Likely cause | What to do |
|---------|--------------|------------|
| Warning stays after adding the cron entry | The entry has not fired yet, or the PHP or ChurchCRM path is wrong | Wait for the next scheduled minute, then run the command by hand as the web-server user and check its output |
| Command prints a database or bootstrap error and exits `1` | Cron runs as a user that cannot read `Include/Config.php` | Install the crontab for the web-server user, not root or your own account |
| Opening `/cli/timerjobs.php` in a browser shows *403 Forbidden* | This is expected | The runner is command-line only |
| Birthday emails still do not arrive | Email is not configured or the birthday-email setting is off | Check [Email Setup](./email-setup.md) and enable **bEnableBirthdayEmails** under **Admin → System Settings → New Members & Greeting** |

---

## Related pages

- [System Settings](./system-settings.md) — where the birthday-email setting lives
- [Email Setup](./email-setup.md) — outbound mail must work for scheduled emails to send
- [Plugins](./plugins/index.md) — plugins can register their own scheduled tasks
- [Logging & Diagnostics](./logging-and-diagnostics.md) — where job errors are logged
