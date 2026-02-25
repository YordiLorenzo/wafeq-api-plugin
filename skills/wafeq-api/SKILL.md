---
name: wafeq-api
description: Comprehensive Wafeq accounting & e-invoicing API reference. Use when building integrations with Wafeq, creating invoices, managing contacts/accounts, recording payments/expenses, generating reports, or any task involving the Wafeq API.
---

# Wafeq API Reference

Wafeq is an accounting and e-invoicing platform for the Middle East (UAE, Saudi Arabia). This skill provides complete API reference for all endpoints.

## Quick Reference

- **Base URL:** `https://api.wafeq.com/v1/`
- **Auth (API Key):** `Authorization: Api-Key <api_key>` -- get keys at `https://app.wafeq.com/c/api-keys`
- **Auth (OAuth2):** `Authorization: Bearer <access_token>` -- contact Wafeq for client credentials
- **Idempotency:** `X-Wafeq-Idempotency-Key: <uuid-v4>` on POST/PUT/PATCH/DELETE (1hr cache)
- **Pagination:** `?page=1&page_size=25` -- response: `{ count, next, previous, results[] }`
- **Content-Type:** `application/json`

## API Domains

| Domain | Endpoints | Reference File |
|--------|-----------|----------------|
| Auth, guides, use cases | Authentication, OAuth2, idempotency, quickstart | [core-concepts.md](core-concepts.md) |
| Enum types | 18 enum definitions (currencies, statuses, classifications) | [enums.md](enums.md) |
| Invoices | Standard, simplified, bulk invoices + line items + tax authority reporting | [invoices.md](invoices.md) |
| Accounts & Banking | Chart of accounts, bank accounts, ledger/statement transactions, contacts, beneficiaries | [accounts-banking-contacts.md](accounts-banking-contacts.md) |
| Bills & Notes | Bills, expenses, credit notes, debit notes + line items + bulk operations | [bills-expenses-notes.md](bills-expenses-notes.md) |
| Quotes, Payments & More | Quotes, payments, payment requests, payslips, items, files, journals, reports, branches, cost centers, employees, projects, warehouses, org, tax rates | [quotes-payments-remaining.md](quotes-payments-remaining.md) |

## Common Workflows

### Create and Send an Invoice
1. Create contact: `POST /contacts/`
2. Get revenue account: `GET /accounts/?classification=REVENUE`
3. Get tax rates: `GET /tax-rates/`
4. Create invoice: `POST /invoices/` (with `line_items`, `contact`, `currency`, `invoice_date`, `invoice_due_date`, `invoice_number`)
5. Report to tax authority: `POST /invoices/{id}/tax-authority-report/`
6. Download PDF: `GET /invoices/{id}/download/`

### Bulk Send Invoices (E-Commerce / High Volume)
1. `POST /api-invoices/bulk_send/` with array of invoice objects including `channels` for email delivery
2. Response: `{ "queued": N }`
3. Generate summary: `GET /api-invoices/{id}/summary/`

### Record Expense
1. Get expense account: `GET /accounts/?classification=EXPENSE`
2. Create expense: `POST /expenses/` with `paid_through_account`, `contact`, `date`, `currency`, `tax_amount_type`, `line_items`

### Record Payment Against Invoice
1. `POST /payments/` with `invoice_payments` array linking to invoice IDs and amounts

### Generate Financial Reports
- Balance Sheet: `GET /reports/balance-sheet/?currency=SAR&date=2025-12-31`
- Profit & Loss: `GET /reports/profit-and-loss/?currency=SAR&date_after=2025-01-01&date_before=2025-12-31`
- Cash Flow: `GET /reports/cash-flow/?currency=SAR&date_after=2025-01-01&date_before=2025-12-31`
- Trial Balance: `GET /reports/trial-balance/?from_date=2025-01-01&to_date=2025-12-31`

### Quote to Invoice Conversion
1. Create quote: `POST /quotes/`
2. Convert to invoice: `POST /quotes/{id}/invoice/`

## Standard CRUD Pattern

Most resources follow this pattern (replace `{resource}` with `invoices`, `contacts`, `bills`, etc.):

| Operation | Method | Path |
|-----------|--------|------|
| Create | POST | `/{resource}/` |
| List | GET | `/{resource}/?page=1&page_size=25` |
| Retrieve | GET | `/{resource}/{id}/` |
| Full Update | PUT | `/{resource}/{id}/` |
| Partial Update | PATCH | `/{resource}/{id}/` |
| Delete | DELETE | `/{resource}/{id}/` |
| Download PDF | GET | `/{resource}/{id}/download/` |

## Key Entity IDs

All entity IDs are prefixed strings (e.g., `cnt_...` for contacts, `acc_...` for accounts, `inv_...` for invoices). Always use the `id` field from create/list responses when referencing entities.

## Important Notes

- **Tax authority reporting** is available for invoices, simplified invoices, and credit notes via `POST /{resource}/{id}/tax-authority-report/`
- **Simplified invoices** are for B2C transactions (no buyer tax registration required)
- **Standard invoices** are for B2B transactions
- **Place of supply** field is UAE-specific (emirate codes or `OUTSIDE_UAE`)
- **Currency** defaults vary by organization; always specify explicitly
- Use `reference` fields as unique identifiers to prevent duplicate creation
- For detailed schemas, field types, and enum values, see the reference files linked above
