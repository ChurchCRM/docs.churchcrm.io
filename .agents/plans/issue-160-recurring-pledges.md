# Issue #160: recurring pledge documentation handoff

Internal preparation only; this file is outside the published Docusaurus docs.

Tracking: [docs #160](https://github.com/ChurchCRM/docs.churchcrm.io/issues/160), dependent on [CRM #2398](https://github.com/ChurchCRM/CRM/issues/2398).

## Status checked November 6, 2026

- CRM #2398 is open. No implementing pull request was identified in the recurring-pledge search.
- Local branch `fix/issue-2398-recurring-pledges`, checked out at `/private/tmp/churchcrm-2398`, contains uncommitted implementation, tests, design notes and a workflow capture spec. These are provisional sources, not evidence of released behavior or successful validation.
- The local upgrade file targets 7.8.4; confirm the implementing PR's actual milestone before selecting a docs release branch. The docs pin is currently 7.8.3.
- No completed finance-staff walkthrough was found in the issue discussion or local design notes. Do not mark that acceptance criterion complete.

The PR review skill says **“Not merged — Do not document it.”** Keep product-page edits pending until the implementing CRM PR merges. Issue #160 additionally requires publication after the implementing release and the workflow capture after UI and staff validation. Do not close #160 from this preparation.

## Planned page changes after implementation merges

| Page | Change to verify against merged code |
| --- | --- |
| `docs/user-guide/finances.md` | Expand **How do I enter a pledge?** into entry → preview → save → compare giving → prepare reminders. Explain installment amount versus total commitment, the first and last dates within one fiscal year, and reviewing the full commitment before saving. Retain the existing section anchor. Add the worked example below and the existing-record caution. Add practical reminder-letter steps using the final report controls. |
| `docs/user-guide/pledge-dashboard.md` | Define the displayed pledge amount as the full commitment for the selected family, fund and fiscal year. Explain that Remaining and the completion colours compare giving with that full commitment; they do not calculate overdue installments. Link to the entry workflow. Recheck the existing statements about editor fiscal-year selection and return navigation against the merged implementation. |
| `docs/user-guide/fund-contributors.md` | Explain the same full-commitment basis for Pledged Amount, Payments and Remaining. Keep family, fund and fiscal year consistent when comparing with the dashboard and reports. Link to the workflow and balance explanation. |

Do not change generated API pages, the release pin, dependencies, or screenshot automation for this task.

## Details to confirm, not yet reader instructions

The local editor currently proposes **Pledge Schedule**, **Amounts represent** with **Total commitment** / **Each installment**, and **Last installment on or before**. **Date** supplies the first installment date. Weekly, Monthly and Quarterly support installment entry. The preview shows installment count and full commitment, including fund allocations. Confirm these labels and defaults in the merged UI before writing steps.

The proposed date boundaries stay within the selected fiscal year. Verify partial periods, a July–June fiscal year, short-month handling, and whether the end date is a boundary rather than an actual installment date. Do not describe cross-year entry as supported.

Existing pledges must retain their recorded totals even when their schedule says Monthly. Staff must explicitly change the amount basis and review the resulting total when correcting a record. Merely opening and saving an existing pledge must not multiply its amount. Recording a pledge does not record a payment or move money; gifts still use the payment/deposit workflow.

## Acceptance walkthrough to run with finance staff

Use a test family and a single fund without other transactions, with a January–December fiscal year, so existing giving cannot distort the example.

1. Enter $100 **Each installment**, Monthly, with January 1 as the first date and December 31 as the last boundary. Confirm the preview counts 12 installments and shows $1,200 committed before saving.
2. Save, reopen and save again. Confirm the installment stays $100 and the total stays $1,200.
3. Record $200 giving for the same family, fund and fiscal year through the normal payment workflow.
4. Check the family row on the Pledge Dashboard, the fund contributor view, the family summary report and the reminder letter: $1,200 committed, $200 given, $1,000 remaining. Use matching year, family and fund filters throughout. Confirm the letter's actual labels and report controls before documenting them.
5. Explain to the staff reviewer that $1,000 is the remaining balance for the entire commitment period. It includes future installments and is not an overdue amount or a calculation of what should have been paid by today. Confirm the wording supports how the church follows up with families.
6. Enter July 1–December 31 at $100 monthly and confirm six installments / $600. Repeat an appropriate period with a July–June fiscal year; confirm a period crossing the selected fiscal year is rejected.
7. Open an existing $1,200 pledge with a Monthly schedule. Confirm it remains a $1,200 total after saving. Separately validate explicitly changing the amount basis and reviewing the new preview before saving.
8. Review entry, preview, errors, save, return navigation and payment entry in both themes and at desktop, tablet and phone sizes.

Record the implementing PR, final milestone, staff reviewer, walkthrough date, results and any corrections before considering this validated. Automated test files alone do not establish that the walkthrough passed.

## Workflow capture and release checklist

- Proposed CRM-owned spec: `playwright/workflows/finance-recurring-pledge.spec.ts`, capture name `finance-recurring-pledge`. It currently exercises entry and preview only; it does not prove the reporting/reminder workflow passed.
- After UI and staff validation, confirm the capture is included in the implementing release's published manifest. Then link `https://cdn.churchcrm.io/screenshots/en/desktop/finance-recurring-pledge.png` with alt text describing the monthly amount and full commitment preview. Do not add an image binary or capture tooling here.
- Once the implementation merges, prepare product edits against the confirmed `release-docs/<version>` branch with the implementing version's milestone and no maintenance label. Preserve issue #160's requirement to publish after that release; do not publish these instructions on the current site early.
- Run `npm run typecheck`, the screenshot check and `npm run build` for the actual product-page changes. Check the rendered pages, internal anchors and capture availability before publication. These checks have not been run for nonexistent page edits.
