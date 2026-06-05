#!/usr/bin/env bash
#
# Publish a new version of The Sourdough Framework downloads.
#
# The book is built in CI in the the-sourdough-framework repository. This
# script pulls the latest built PDFs/EPUBs, copies them into
# the-sourdough-framework/, and (after you confirm) commits and pushes them.
# Pushing triggers a redeploy of downloads.the-bread-code.io.
#
# Usage:
#   bin/release.sh                 # fetch the latest successful CI build via `gh`
#   bin/release.sh --local [DIR]   # copy from a local checkout that has already
#                                  # run `make bake` (DIR defaults to
#                                  # ../the-sourdough-framework)
#
set -euo pipefail

REPO="hendricius/the-sourdough-framework"
WORKFLOW="release-book-website.yml"
ARTIFACT="books"
DEST="the-sourdough-framework"

# Files produced by the book build. Only these are overwritten; the
# hardcover/tldr PDFs in $DEST are maintained separately and left untouched.
FILES=(
  "TheBreadCode-The-Sourdough-Framework.pdf"
  "TheBreadCode-The-Sourdough-Framework-sans-serif.pdf"
  "TheBreadCode-The-Sourdough-Framework.epub"
  "TheBreadCode-The-Sourdough-Framework-black-and-white.epub"
)

cd "$(dirname "$0")/.."

mode="ci"
local_dir="../the-sourdough-framework"
if [[ "${1:-}" == "--local" ]]; then
  mode="local"
  [[ -n "${2:-}" ]] && local_dir="$2"
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

if [[ "$mode" == "ci" ]]; then
  command -v gh >/dev/null 2>&1 || {
    echo "error: the GitHub CLI (gh) is required. See https://cli.github.com" >&2
    exit 1
  }
  echo "Finding the latest successful '$WORKFLOW' build on $REPO ..."
  run_id="$(gh run list --repo "$REPO" --workflow "$WORKFLOW" \
    --branch main --status success --limit 1 \
    --json databaseId --jq '.[0].databaseId')"
  [[ -n "$run_id" ]] || { echo "error: no successful build found" >&2; exit 1; }
  echo "Downloading artifact '$ARTIFACT' from run $run_id ..."
  gh run download "$run_id" --repo "$REPO" --name "$ARTIFACT" --dir "$tmp"
  src="$tmp"
  source_desc="$REPO CI run $run_id"
else
  src="$local_dir/book/release"
  [[ -d "$src" ]] || {
    echo "error: $src not found. Run 'make bake' in $local_dir first." >&2
    exit 1
  }
  source_desc="local build at $src"
fi

echo "Copying book files into $DEST/ ..."
missing=0
for f in "${FILES[@]}"; do
  if [[ -f "$src/$f" ]]; then
    cp "$src/$f" "$DEST/$f"
    echo "  updated $f"
  else
    echo "  WARNING: $f missing from source, skipping" >&2
    missing=1
  fi
done
[[ "$missing" -eq 0 ]] || echo "warning: some files were missing from the source build" >&2

if git diff --quiet -- "$DEST"; then
  echo "No changes — the downloads are already up to date."
  exit 0
fi

git add "$DEST"
echo
git status --short -- "$DEST"
echo

read -r -p "Commit and push these updated downloads? [y/N] " ans
if [[ "$ans" =~ ^[Yy]$ ]]; then
  git commit -m "Update The Sourdough Framework downloads

Source: $source_desc"
  git push
  echo "Done. Coolify will redeploy downloads.the-bread-code.io."
else
  echo "Left the staged changes in place for you to review. Nothing was pushed."
fi
