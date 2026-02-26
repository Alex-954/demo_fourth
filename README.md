# Numerology App

A lightweight front-end numerology app that calculates from name + date of birth:

- Life Path Number
- Lucky Number, Talent No., Birth No., Name No. (DOB-based)
- Personal Year, Current Year No., Kua No., B.E.F., Special Frequency
- Compatible/Incompatible Numbers, Lucky Colors, Lucky Days, Lucky Direction
- Destiny No., Heart No., Habit No., Personality No., First Alphabet, First Vowel (name-based)
- Pinnacles 1-4, Challenges 1-4, Planes 1-4
- Ultimate No. (DOB + Name)

## Run locally in a browser

Open `index.html` directly in your browser, or run a tiny static server:

```bash
python3 -m http.server 8000
```

Then browse to <http://localhost:8000>.

## Build as an Android app (Capacitor)

This project now includes Capacitor configuration so the same web app can run inside an Android WebView.

### Requirements

- Node.js 18+
- Android Studio (latest stable)
- Android SDK + emulator/device configured

### 1) Install dependencies

```bash
npm install
```

### 2) Build/copy web assets into `www/`

```bash
npm run build
```

### 3) Create Android project (first time only)

```bash
npm run android:add
```

### 4) Sync web assets into Android

```bash
npm run android:sync
```

### 5) Open in Android Studio and run

```bash
npm run android:open
```

From Android Studio, choose an emulator/device and click **Run**.

## Notes

- `www/` is generated from the root web files (`index.html`, `styles.css`, `script.js`).
- When you update the web UI, run `npm run android:sync` before rebuilding in Android Studio.

## Install on an Android phone (quick guide)

After you complete the setup once, use this flow to actually install the app:

1. Install dependencies and prepare Android project:

```bash
npm install
npm run android:add
npm run android:sync
npm run android:open
```

2. In Android Studio:
   - wait for Gradle sync to finish,
   - connect a physical Android phone (with **Developer options** + **USB debugging** enabled) or start an emulator,
   - click **Run ▶** and pick your device.

Android Studio will build and install a debug build automatically.

### Build an APK and install manually

If you want an APK file to share/install:

1. Open the Android project in Android Studio (`npm run android:open`).
2. Go to **Build → Build Bundle(s) / APK(s) → Build APK(s)**.
3. After build completes, click **locate** and copy the APK to your phone.
4. On phone, allow install from unknown sources (for your file manager) and install the APK.

Or install via ADB:

```bash
adb install -r android/app/build/outputs/apk/debug/app-debug.apk
```

## Update cycle after web changes

Whenever you modify `index.html`, `styles.css`, or `script.js`, run:

```bash
npm run android:sync
```

Then rebuild/re-run from Android Studio so the Android app includes your latest web changes.

## Generate an APK (single command)

After dependencies are available, you can build an installable debug APK with:

```bash
./scripts/make-apk.sh
```

Or with npm scripts:

```bash
npm run apk:debug
npm run apk:path
```

Expected output file:

- `android/app/build/outputs/apk/debug/app-debug.apk`

> Note: In this environment, package registry access is blocked (HTTP 403), so I could not fetch Capacitor packages or produce the APK artifact here. On your machine with normal npm access, the commands above will generate the APK.

