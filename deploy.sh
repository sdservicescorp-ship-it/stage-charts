#!/usr/bin/env bash
# Publish Stage Charts to GitHub Pages. Run from inside the stage-charts/ folder.
set -euo pipefail

command -v gh >/dev/null 2>&1 || { echo "Install the GitHub CLI first:  brew install gh"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Sign in first:  gh auth login"; exit 1; }

OWNER=$(gh api user -q .login)
REPO=stage-charts

git init -q
git add -A
git commit -qm "Stage Charts PWA" || true
git branch -M main

gh repo create "$REPO" --public --source=. --remote=origin --push

# Enable GitHub Pages on main / root
gh api -X POST "repos/$OWNER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || echo "(If Pages didn't auto-enable: open Settings > Pages, set Branch = main, Folder = / root.)"

echo ""
echo "Done. Your app will be live in ~1 minute at:"
echo "  https://$OWNER.github.io/$REPO/"
