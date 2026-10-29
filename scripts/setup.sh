#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PATH="$HOME/.local/bin:$PATH"

if ! command -v git >/dev/null; then echo "git is required" >&2; exit 1; fi
if ! command -v node >/dev/null; then echo "Node.js 18+ is required" >&2; exit 1; fi
if ! command -v uv >/dev/null; then
  echo "Installing uv from Astral's official installer..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

if [[ ! -f "$ROOT_DIR/mirofish-app/package.json" ]]; then
  echo "Cloning the original 666ghj/MiroFish..."
  git clone --depth 1 --branch main https://github.com/666ghj/MiroFish.git "$ROOT_DIR/mirofish-app"
fi

cd "$ROOT_DIR/mirofish-app"
echo "Installing official MiroFish dependencies..."
npm run setup:all
echo "Installation complete. Add private GEMINI_API_KEY and ZEP_API_KEY secrets, then run bash scripts/start.sh"
