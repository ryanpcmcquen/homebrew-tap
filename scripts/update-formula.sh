#!/usr/bin/env bash
set -euo pipefail

formula="Formula/flint-ai.rb"

latest="$(gh release view --repo ryanpcmcquen/flint --json tagName --jq .tagName)"
if [[ -z "$latest" ]]; then
    echo "could not determine latest Flint release"
    exit 1
fi

current="$(sed -n 's|.*/tags/\([^/]*\)\.tar\.gz.*|\1|p' "$formula" | head -n 1)"
if [[ "$latest" == "$current" ]]; then
    echo "flint-ai is already at $latest"
    exit 0
fi

url="https://github.com/ryanpcmcquen/flint/archive/refs/tags/${latest}.tar.gz"
sha="$(curl -fsSL "$url" | sha256sum | awk '{print $1}')"

perl -0pi -e "s{url \"[^\"]+\"}{url \"$url\"}; s{sha256 \"[a-f0-9]+\"}{sha256 \"$sha\"}" "$formula"

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add "$formula"
git commit -m "Update flint-ai to ${latest}"
git push
