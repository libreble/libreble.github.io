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

## Editing

Plain static HTML, no build step. GitHub Pages serves `main` from the repo root.

- `index.html` — the whole site. Inline CSS, theme-aware (light/dark via `prefers-color-scheme`).
- `favicon.svg` — the mark.
- `.nojekyll` — tells Pages not to run Jekyll.

### Adding a device

Copy one `<article class="card">` block in the *Liberated devices* section. Set the device
line, the app name, a status badge, one sentence on what it does, and the three links (app
page as the primary button, `PROTOCOL.md`, repo).

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
