#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required" >&2
  exit 1
fi

if [ ! -d android ]; then
  echo "Android project not found. Creating it now..."
  npm run android:add
fi

echo "Syncing web assets into Android project..."
npm run android:sync

echo "Building debug APK..."
(
  cd android
  ./gradlew assembleDebug
)

APK_PATH="android/app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
  echo "APK generated: $APK_PATH"
  ls -lh "$APK_PATH"
else
  echo "APK build completed but file not found at expected path: $APK_PATH" >&2
  exit 1
fi
