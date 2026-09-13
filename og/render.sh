#!/usr/bin/env bash
# Regenerate the 1200x630 social cards from og/card.html with headless Chrome.
# Needs network access for the webfonts (Archivo, IBM Plex Mono via Google Fonts) and ImageMagick.
set -euo pipefail
cd "$(dirname "$0")"
HERE="$(pwd)"
CHROME="${CHROME:-google-chrome}"

render() { # name, kicker, title, subtitle, path
  local name="$1" q
  q="$(python3 - "$2" "$3" "$4" "$5" <<'EOF'
import sys, urllib.parse
k, t, s, p = sys.argv[1:5]
print(urllib.parse.urlencode({"kicker": k, "title": t, "subtitle": s, "path": p}))
EOF
)"
  # headless=new subtracts ~87px of window chrome from --window-size, so ask for a taller window
  # (giving a 1200x630 viewport) and crop the capture to the card.
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --no-sandbox --virtual-time-budget=6000 \
    --window-size=1200,717 --screenshot="$HERE/.$name.raw.png" "file://$HERE/card.html?$q" >/dev/null 2>&1
  convert "$HERE/.$name.raw.png" -crop 1200x630+0+0 +repage -strip "$HERE/$name.png"
  rm -f "$HERE/.$name.raw.png"
  echo "rendered $name.png ($(identify -format '%wx%h' "$HERE/$name.png"))"
}

render libreble   "Web Bluetooth, no vendor in between" "Your devices, without their vendors." \
  "Web apps that talk to Bluetooth gadgets directly, in Chrome. No account, no cloud, every protocol documented." ""
render bikefit    "ICG IC-6 indoor bike" "Bikefit" \
  "Live power, cadence, heart rate and zones, session history on your device, TCX export." bikefit
render brushlog   "Oral-B iO toothbrush" "Brushlog" \
  "Syncs the brushing history the brush already stores. No pairing, no P&G account." brushlog
render collet     "Dremel 8260 rotary tool" "COLLET" \
  "Live battery, speed and health, speed control, and a bit-and-material speed guide." collet
render multimeter "UNI-T · OWON · Aneng · BSIDE/ZOYI · Voltcraft · AICARE" "Multimeter" \
  "Live readout, charts, statistics, recording and CSV export for six vendors' Bluetooth meters." multimeter
