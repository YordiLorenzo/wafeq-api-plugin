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

## Setup

```bash
export WAFEQ_API_KEY='your-key-here'
# Validate:
./scripts/setup.sh
```

## Files

| File | Content |
|------|---------|
| `skills/wafeq-api/SKILL.md` | Main entrypoint, quick reference, common workflows |
| `skills/wafeq-api/references/core-concepts.md` | Auth, OAuth2, idempotency, guides, use cases |
| `skills/wafeq-api/references/enums.md` | All 18 enum types with values |
| `skills/wafeq-api/references/invoices.md` | Standard + bulk + simplified invoices |
| `skills/wafeq-api/references/accounts-banking-contacts.md` | Accounts, banking, contacts, beneficiaries |
| `skills/wafeq-api/references/bills-expenses-notes.md` | Bills, expenses, credit/debit notes |
| `skills/wafeq-api/references/quotes-payments-remaining.md` | Quotes, payments, payslips, journals, reports, entities |
| `openclaw.plugin.json` | ClawHub registry metadata |
| `scripts/setup.sh` | API key validation script |

## License

MIT
