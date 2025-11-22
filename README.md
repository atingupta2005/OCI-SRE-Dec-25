# SRE MkDocs Project (Improved)

This MkDocs site was generated from your uploaded SRE materials and improved with:
- Clean navigation (Day 1..Day 4)
- Material theme (blue)
- GitHub Actions workflow for automatic deployment to GitHub Pages

## Local preview

```bash
pip install mkdocs-material
mkdocs serve
# open http://127.0.0.1:8000
```

## Deploy to GitHub Pages (automatic)

1. Create a new GitHub repository (e.g., `sre-training`).
2. Push this project to the repository `main` branch.
3. GitHub Actions (included) will build and deploy the site to GitHub Pages automatically on push to `main`.

If you prefer, you can use `mkdocs gh-deploy` manually:

```bash
mkdocs gh-deploy --force
```

## Deploy to Netlify or Vercel

- Netlify: connect your GitHub repo and set build command: `mkdocs build` and publish directory `site`.
- Vercel: use a GitHub import and set the build command similarly.