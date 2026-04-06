# Deploying Eye Candy WebAR

The `web/` folder is a fully static site — no build step required. Any static host works.

---

## Option A — Vercel (recommended, ~2 minutes)

1. Go to [vercel.com](https://vercel.com) and sign in with GitHub.
2. Click **Add New → Project**.
3. Import your `eyecandy` GitHub repo.
4. Set **Root Directory** to `web`.
5. Click **Deploy**.

Vercel auto-detects static sites. The `vercel.json` in this folder already configures headers for WebXR.

---

## Option B — GitHub Pages (~5 minutes)

1. Push this repo to GitHub (if not already).
2. Go to **Settings → Pages**.
3. Under **Source**, select **Deploy from a branch**.
4. Choose branch `main` and folder `/web` (or `/docs` if you rename the folder).
5. Save. Your site will be live at `https://<username>.github.io/<repo>/`.

> The `.nojekyll` file in this folder tells GitHub Pages not to process files with underscores.

---

## Option C — Netlify drag-and-drop (~1 minute)

1. Go to [app.netlify.com](https://app.netlify.com).
2. Drag and drop the entire `web/` folder onto the Netlify dashboard.
3. Done — you get an instant HTTPS URL.

---

## After deploying

1. Copy your live URL (e.g. `https://eyecandy.vercel.app`).
2. Open `https://your-url/qr/` in a browser.
3. The QR code is auto-generated. Download it and share it.

---

## Adding real 3D models

Replace the demo GLBs with real product models:

```
web/models/red-sweater.glb
web/models/leather-jacket.glb
web/models/denim-jacket.glb
...
```

File names must match the product `id` fields. See `models/README.md` for details.

---

## Testing AR locally

WebXR requires HTTPS. To test locally with AR:

```powershell
# Install serve globally (one-time)
npm install -g serve

# Start local HTTPS server from the web/ folder
cd web
serve -s . --ssl-cert cert.pem --ssl-key key.pem
```

Or use [ngrok](https://ngrok.com) to tunnel your local server over HTTPS:

```powershell
npx serve web -p 3000
# in another terminal:
ngrok http 3000
# use the https:// URL ngrok gives you on your phone
```
