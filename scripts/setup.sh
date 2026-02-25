#!/usr/bin/env bash
set -euo pipefail

echo "=== Wafeq API Skill Setup ==="
echo ""

# Check for API key
if [ -z "${WAFEQ_API_KEY:-}" ]; then
  echo "WAFEQ_API_KEY is not set."
  echo ""
  echo "To get your API key:"
  echo "  1. Log in to https://app.wafeq.com"
  echo "  2. Go to Settings → API Keys (https://app.wafeq.com/c/api-keys)"
  echo "  3. Create a new API key"
  echo ""
  echo "Then set it:"
  echo "  export WAFEQ_API_KEY='your-key-here'"
  echo ""
  echo "Or add to ~/.openclaw/openclaw.json:"
  echo '  { "skills": { "entries": { "wafeq-api": { "apiKey": "your-key-here" } } } }'
  echo ""
  exit 1
fi

# Validate the key
echo "Validating API key..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Authorization: Api-Key $WAFEQ_API_KEY" \
  "https://api.wafeq.com/v1/organization/")

if [ "$HTTP_CODE" = "200" ]; then
  echo "✅ API key is valid! Organization endpoint returned 200."
else
  echo "❌ API key validation failed (HTTP $HTTP_CODE)."
  echo "   Please check your key at https://app.wafeq.com/c/api-keys"
  exit 1
fi
