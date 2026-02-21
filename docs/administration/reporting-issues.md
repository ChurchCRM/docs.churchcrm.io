---
title: Reporting Issues
sidebar_position: 16
---

# Reporting Issues

For comprehensive guidance, see the [Bug Reporting & Diagnostics Guide](/administration/bug-reporting-and-diagnostics).

---

## Best Method: Use the Built-in Issue Reporter

The fastest and most accurate way to report a bug is directly from your ChurchCRM installation.

### Step-by-Step Instructions

1. Log in to your ChurchCRM instance.
2. Navigate to **Support** in the top navigation menu.
3. Select **Report an Issue** to open the built-in reporting tool.
4. Fill out the form:
   - Describe what happened.
   - Include steps to reproduce the issue.
   - Attach any relevant screenshots.
5. Submit the form. The system automatically captures your technical environment and sends the report to the development team.

### What Gets Captured Automatically

When you use the in-app reporter, the following information is collected automatically:

- ChurchCRM version (exact version and build)
- Server environment (PHP version, database type, server OS)
- Browser information (user agent, screen size)
- User context (role, permissions, current page)
- System configuration (relevant settings and enabled modules)
- Recent error logs related to your session

This information is essential for diagnosis and significantly speeds up issue resolution.

---

## Alternative: GitHub Issues

Use GitHub issues only if you cannot access ChurchCRM directly.

### When to Use GitHub Instead

- You cannot log in (authentication issues)
- ChurchCRM is not yet installed
- The server is completely unreachable
- You are reporting a documentation problem
- You are reporting a development environment issue

### GitHub Issue Templates

- [Bug Report](https://github.com/ChurchCRM/CRM/issues/new?template=bug_report.md) — For software defects
- [Feature Request](https://github.com/ChurchCRM/CRM/issues/new?template=feature_request.md) — For new functionality
- [Question](https://github.com/ChurchCRM/CRM/issues/new?template=question.md) — For support questions

---

## Community Support

- [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) — Ask questions, share ideas, and find community solutions

---

## Before Reporting

1. Search existing issues — your problem may have already been reported.
2. Check the documentation — the answer may already be available.
3. Try in a different browser — to rule out browser-specific issues.
4. Clear your browser cache — stale cached files can cause unexpected behavior.

### Information to Include When Reporting via GitHub

- A clear description of what happened
- Steps to reproduce the issue
- Expected versus actual behavior
- Screenshots or error messages
- ChurchCRM version (found in **About** or **System Info**)
- Browser and device

---

## Quick Reference

| Goal | Best Option |
|------|-------------|
| Report a bug | [In-app Support → Report Issue](#step-by-step-instructions) |
| Request a feature | [GitHub Feature Request](https://github.com/ChurchCRM/CRM/issues/new?template=feature_request.md) |
| Ask a question | [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) |
| Report a login issue | [GitHub Bug Report](https://github.com/ChurchCRM/CRM/issues/new?template=bug_report.md) |
