---
title: Background Jobs & Scheduler
sidebar_position: 11
---

# Background Jobs & Scheduler

ChurchCRM 7.7 includes a background-job scheduler for work that should run regularly without requiring an administrator to start it manually. Current jobs include birthday email processing and plugin `CRON_RUN` handlers.

## Recommended setup: cron

For self-hosted installations, run the scheduler hourly with cron. Replace `/path/to/churchcrm` with the path to your ChurchCRM installation:

```bash
0 * * * * /usr/bin/php /path/to/churchcrm/src/cli/timerjobs.php >> /var/log/churchcrm-cron.log 2>&1
```

Run the command as the same operating-system user that runs the web server (commonly `www-data` or `apache`) so ChurchCRM files remain readable and writable by the expected user.

From the `src/` directory, you can also run the scheduler through Composer:

```bash
composer run timerjobs
```

The scheduler returns exit code `0` when jobs complete successfully and `1` when ChurchCRM cannot bootstrap or a job fails. Redirecting output to a log file makes cron failures easier to diagnose.

## Page-load fallback

ChurchCRM also has a fallback for shared-hosting installations where cron is unavailable. Authenticated page loads can trigger the background-job endpoint, rate-limited by **Background jobs interval** (`iTimerJobsMinIntervalMinutes`, default 15 minutes).

This fallback keeps scheduled work moving on active installations, but it is not a replacement for cron: jobs only run when someone loads ChurchCRM. On quiet days, time-sensitive jobs such as birthday email processing may therefore be delayed.

## Dashboard staleness warning

Administrators see a dashboard warning when background jobs have not run within **Background jobs warning** (`iTimerJobsStaleHours`, default 26 hours).

If the warning appears:

1. Confirm the cron entry exists and uses the correct ChurchCRM path.
2. Run the scheduler manually as the web-server user and check its output.
3. Check the configured cron log for PHP, permission, or bootstrap errors.
4. Confirm the server user can read the ChurchCRM installation and write to directories ChurchCRM requires.

Set `iTimerJobsStaleHours` to `0` only if you intentionally want to disable the staleness warning.

## Configuration settings

| Setting | Default | Purpose |
|---|---:|---|
| `iTimerJobsStaleHours` | 26 hours | Warn administrators when no scheduler run has been recorded within this period; `0` disables the warning |
| `iTimerJobsMinIntervalMinutes` | 15 minutes | Minimum interval between page-load fallback runs; `0` allows a run on every eligible load |
| `sLastTimerJobsRunDateTime` | Empty initially | Internal timestamp of the most recent scheduler run; do not edit manually |

## Jobs that run

The scheduler currently runs:

- Birthday email processing
- Plugin handlers registered for the `CRON_RUN` hook

Jobs are isolated so one failing job does not prevent the scheduler from attempting the remaining jobs. A failure still causes a non-zero scheduler exit status so it can be detected by cron monitoring.

## Troubleshooting

### Dashboard warns even though cron is installed

Run the cron command manually as the same user as the web server. Confirm the configured PHP executable and the path to `src/cli/timerjobs.php` are correct, then inspect the cron log.

### Birthday emails are delayed

Check the dashboard for the background-jobs warning. If cron is unavailable and ChurchCRM has little user activity, the page-load fallback may not run frequently enough; configure cron when your hosting environment permits it.

### `No such file` from cron

Use the absolute filesystem path to `src/cli/timerjobs.php`. Cron normally starts with a minimal environment and should not rely on your interactive shell's working directory.

### Permission denied

Run the scheduler as the web-server user. For example, on a Debian/Ubuntu installation using `www-data`:

```bash
sudo -u www-data /usr/bin/php /path/to/churchcrm/src/cli/timerjobs.php
```

## Security

`src/cli/timerjobs.php` is a command-line entry point and is not intended to be executed from a browser. ChurchCRM protects the CLI directory from HTTP execution and the scheduler also checks that it is running through PHP's CLI SAPI.

Do not expose the scheduler as a public web endpoint. Use cron, your hosting provider's scheduled-task feature, or the built-in authenticated page-load fallback.

## Related documentation

- [System Settings & Configuration](/administration/system-settings)
- [Email Setup](/administration/email-setup)
- [Troubleshooting](/administration/troubleshooting)
- [Logging & Diagnostics](/administration/logging-and-diagnostics)
