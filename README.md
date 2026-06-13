# Stage Charts — installable worship chord app (PWA)

A single-folder web app: transpose any song to any key, switch to the Nashville
number system, two-column one-page print, set-list ready. Works fully offline once
installed to your home screen. Your song library saves on the device.

## Files
- `index.html` — the whole app
- `manifest.webmanifest` — makes it installable
- `sw.js` — offline service worker
- `icons/` — home-screen icons
- `deploy.sh` — one-shot publish script

---

## Publish it (one time)

### Option A — let Claude Code do it (recommended)
Open Claude Code in this folder and paste:

> I have a folder `stage-charts` containing a static PWA (index.html,
> manifest.webmanifest, sw.js, icons/). Publish it to GitHub Pages end to end:
> check I'm authenticated with the gh CLI (if not, tell me to run `gh auth login`);
> from inside the folder, git init + commit everything; create a public GitHub repo
> named `stage-charts` and push; enable GitHub Pages on the main branch, root folder;
> wait until it's live and give me the final URL. Then tell me the exact steps to add
> it to my iPhone home screen.

### Option B — run the script yourself
```bash
cd stage-charts
brew install gh        # if you don't have it
gh auth login          # one time
bash deploy.sh
```

### Option C — fully manual (GitHub web UI)
1. Create a new **public** repo named `stage-charts`.
2. Upload all files (keep the `icons/` folder).
3. Settings → Pages → Branch: `main`, Folder: `/ (root)` → Save.
4. Wait ~1 min. URL is `https://YOURNAME.github.io/stage-charts/`.

---

## Install on iPhone / iPad
1. Open the live URL in **Safari** (must be Safari, not Chrome).
2. Tap the **Share** button → **Add to Home Screen** → **Add**.
3. Launch it from the new icon. It runs fullscreen and works offline.

## Back up your songs
Use the **⬇ Backup** button to save your library as a JSON file (e.g. to Dropbox),
and **⬆ Restore** to load it on another device. That file is your safety net.
