#!/bin/sh
[ $# -ge 1 ] || { printf 'Usage: %s "search keyword"\n' "$0" >&2; exit 1; }
pipe=$(printf '\037')
r=$(yt-dlp --flat-playlist --extractor-args 'youtube:lang=ja' \
    --print "%(id)s${pipe}%(title)s${pipe}%(thumbnails.-1.url)s" "ytsearch20:$*") || exit 1
while :; do
  sel=$(printf '%s\n' "$r" | fzf --delimiter="$pipe" --with-nth=2 --layout=reverse \
      --preview='curl -s {3} | chafa --size=${FZF_PREVIEW_COLUMNS:-40}x$((FZF_PREVIEW_LINES-1))') || exit 0
  mpv -- "ytdl://$(printf '%s' "$sel" | cut -d"$pipe" -f1)"
done
