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
