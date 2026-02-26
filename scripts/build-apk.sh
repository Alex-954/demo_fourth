#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ANDROID_DIR="$ROOT_DIR/android"
APK_PATH="$ANDROID_DIR/app/build/outputs/apk/debug/app-debug.apk"

cd "$ROOT_DIR"

if ! command -v npm >/dev/null 2>&1; then
  echo "Error: npm is required but was not found in PATH." >&2
  exit 1
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx is required but was not found in PATH." >&2
  exit 1
fi

echo "==> Installing npm dependencies"
npm install

if [[ ! -d "$ANDROID_DIR" ]]; then
  echo "==> Android project is missing; creating it now"
  npm run android:add
fi

echo "==> Building and syncing web assets into Android"
npm run android:sync


echo "==> Building debug APK"
(
  cd "$ANDROID_DIR"
  ./gradlew assembleDebug
)

if [[ -f "$APK_PATH" ]]; then
  echo
  echo "✅ APK created: $APK_PATH"
  echo "Install with: adb install -r '$APK_PATH'"
else
  echo "Error: APK build completed but file not found at $APK_PATH" >&2
  exit 1
fi
