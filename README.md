# libreble.github.io

The index site for [libreble](https://github.com/libreble) — served at
**https://libreble.github.io/**. It states the mission and links every liberated device.

Each device app is its own repo and deploys to its own GitHub Pages folder
(`https://libreble.github.io/<repo>/`), so they naturally hang under this page.

| app | device | repo |
|---|---|---|
| [Bikefit](https://libreble.github.io/bikefit/) | ICG IC-6 indoor bike | [libreble/bikefit](https://github.com/libreble/bikefit) |
| [Brushlog](https://libreble.github.io/brushlog/) | Oral-B toothbrush | [libreble/brushlog](https://github.com/libreble/brushlog) |
| [COLLET](https://libreble.github.io/collet/) | Dremel 8260 rotary tool | [libreble/collet](https://github.com/libreble/collet) |
| [Multimeter](https://libreble.github.io/multimeter/) | Bluetooth multimeters (UNI-T, OWON, Aneng, BSIDE/ZOYI, Voltcraft, AICARE) | [libreble/multimeter](https://github.com/libreble/multimeter) |

## Editing

Plain static HTML, no build step. GitHub Pages serves `main` from the repo root.

- `index.html` — the whole site. Inline CSS, theme-aware: follows `prefers-color-scheme`, and
  `<html data-theme="dark|light">` overrides it (`?theme=dark` / `?theme=light` in the URL sets
  that attribute, for testing).
- `favicon.svg`, `apple-touch-icon.png` — the mark: an LED inside two rings that open toward
  the top right (the "open beacon"). Source for the touch icon is `og/icon.html`.
- `og/card.html` + `og/render.sh` — the 1200×630 social-card template and the script that
  renders `og/*.png` with headless Chrome. Re-run `og/render.sh` after adding a device.
- `.nojekyll` — tells Pages not to run Jekyll.

Type: [Archivo](https://fonts.google.com/specimen/Archivo) (variable width/weight) for
everything, [IBM Plex Mono](https://fonts.google.com/specimen/IBM+Plex+Mono) for the on-air
layer (device lines, badges, identifiers, code). One accent, the LED orange.

### Adding a device

Copy one `<article class="card">` block in the *Liberated devices* section (there is a comment
above the first one). Set the device line, a status badge, the app name, one or two sentences on
what it does, the on-air line (transport / GATT service / manufacturer id, straight from the
protocol doc), and the three links (app page as the primary button, `PROTOCOL.md`, repo). Then
add a `render` line to `og/render.sh`, run it, and add the ItemList entry in the JSON-LD block
in `<head>`.

Badges:

| class | meaning |
|---|---|
| `live` | deployed and usable |
| `soon` | works on hardware, publishing in progress |
| `wip`  | in development |
| `plan` | planned |

## Local preview

```bash
python3 -m http.server 8000   # http://localhost:8000
```
