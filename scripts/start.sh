#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT_DIR/mirofish-app"
export PATH="$HOME/.local/bin:$PATH"

if [[ ! -f "$APP_DIR/package.json" ]]; then
  echo "MiroFish is not installed. Run bash scripts/setup.sh first." >&2
  exit 1
fi

API_KEY="${LLM_API_KEY:-${GEMINI_API_KEY:-}}"
if [[ -z "$API_KEY" || -z "${ZEP_API_KEY:-}" ]]; then
  echo "Missing GEMINI_API_KEY (or LLM_API_KEY) or ZEP_API_KEY. Add these as GitHub Codespaces secrets." >&2
  echo "Never commit your keys or post them in chat." >&2
  exit 1
fi

umask 077
cat > "$APP_DIR/.env" <<CONFIG
LLM_API_KEY=$API_KEY
LLM_BASE_URL=${LLM_BASE_URL:-https://generativelanguage.googleapis.com/v1beta/openai/}
LLM_MODEL_NAME=${LLM_MODEL_NAME:-gemini-2.5-flash-lite}
ZEP_API_KEY=$ZEP_API_KEY
CONFIG

# Use the official Vite same-origin /api proxy for phone browsers.
export VITE_API_BASE_URL="/"
echo "Starting official MiroFish. Open forwarded PRIVATE port 3000."
cd "$APP_DIR"
exec npm run dev
