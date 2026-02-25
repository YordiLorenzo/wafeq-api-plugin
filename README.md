# wafeq-api-plugin

A Claude Code plugin providing comprehensive reference for the [Wafeq](https://wafeq.com) accounting and e-invoicing API.

## What's included

Complete API reference for **150+ endpoints** across 20+ resource categories:

| Category | Endpoints |
|----------|-----------|
| Invoices (standard, simplified, bulk) | 34 |
| Bills, expenses, credit/debit notes | 50 |
| Accounts, bank accounts, transactions | 36 |
| Quotes, payments, payslips | 40+ |
| Reports (P&L, balance sheet, cash flow, trial balance) | 4 |
| Entity management (contacts, employees, branches, etc.) | 30+ |

Plus:
- Authentication (API Key + OAuth2 with PKCE)
- All 18 enum types with every possible value
- Idempotency, pagination, error handling
- Common workflow guides (B2B, B2C, e-commerce, expense management)

## Install

### As a Claude Code plugin

```bash
claude --plugin-dir ./wafeq-api-plugin
```

Or if published to a marketplace:

```
/plugin install wafeq-api@marketplace-name
```

### As a personal skill (no plugin)

Copy the `skills/wafeq-api/` directory to `~/.claude/skills/wafeq-api/`.

## Usage

Claude will automatically use this skill when you mention Wafeq, invoicing, or related API tasks. You can also invoke it directly:

```
/wafeq-api:wafeq-api
```

## Quick reference

- **Base URL:** `https://api.wafeq.com/v1/`
- **Auth:** `Authorization: Api-Key <key>` or `Authorization: Bearer <token>`
- **Idempotency:** `X-Wafeq-Idempotency-Key: <uuid-v4>`
- **Docs:** https://developer.wafeq.com

## Files

| File | Lines | Content |
|------|-------|---------|
| `SKILL.md` | 88 | Main entrypoint, quick reference, common workflows |
| `core-concepts.md` | 352 | Auth, OAuth2, idempotency, guides, use cases |
| `enums.md` | 348 | All 18 enum types with values |
| `invoices.md` | 1,007 | Standard + bulk + simplified invoices |
| `accounts-banking-contacts.md` | 739 | Accounts, banking, contacts, beneficiaries |
| `bills-expenses-notes.md` | 752 | Bills, expenses, credit/debit notes |
| `quotes-payments-remaining.md` | 788 | Quotes, payments, payslips, journals, reports, entities |

## License

MIT
