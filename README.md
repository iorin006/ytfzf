<div align="center">

# ytfzf

**YouTube を CUI で再生するためのスクリプトです。必要最低限の機能で保っています。**

*Keep it short and simple.*

[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](./LICENSE)
![Shell](https://img.shields.io/badge/shell-POSIX%20sh-4EAA25)

</div>

A minimal alternative to [pystardust/ytfzf](https://github.com/pystardust/ytfzf) — under 10 lines of shell.

## 特徴

- **10 行足らずの POSIX sh** — 依存が薄く、全部読んで即理解できる
- **fzf でサムネイルをプレビューしながら選択**(chafa によるターミナル内画像表示)
- **mpv で即再生** — 選択 → 再生 → 選択…のループで連続視聴に最適
- タイトルは日本語優先で取得(`yt-dlp` の `lang=ja`)

## デモ

<!-- asciinema やスクリーンショットを貼る
![demo](https://.../demo.png)
-->

## 依存

| コマンド | 用途 | 備考 |
|---|---|---|
| POSIX sh | 実行 | dash / bash / busybox sh など |
| [yt-dlp](https://github.com/yt-dlp/yt-dlp) | 検索・メタデータ取得 | `--print` が使える比較的新しい版 |
| [fzf](https://github.com/junegunn/fzf) | 候補選択 UI | |
| [curl](https://curl.se/) | サムネイル取得 | |
| [chafa](https://hpjansson.org/chafa/) | サムネイルのターミナル表示 | 24bit カラー端末推奨(非対応でも自動フォールバック) |
| [mpv](https://mpv.io/) | 再生 | `ytdl://` プロトコルを扱えること |

<details>
<summary>mpv が yt-dlp を見つけられない場合</summary>

mpv 0.35 未満では `~/.config/mpv/script-opts/ytdl_hook-ytdl_path` に次の 1 行を追加:

```text
ytdl_path=yt-dlp
```

</details>

## インストール

```sh
git clone https://github.com/iorin006/ytfzf
cd ytfzf
install -m 755 ytfzf.sh ~/.local/bin/ytfzf   # PATH の通った場所へ
```

## 使い方

```sh
ytfzf "検索キーワード"
```

| キー | 動作 |
|---|---|
| <kbd>Enter</kbd> | 選択した動画を mpv で再生(再生終了後は候補一覧に戻る) |
| <kbd>Esc</kbd> / <kbd>Ctrl-C</kbd> | 終了 |

検索件数(既定 20 件)の変更などはスクリプトを直接編集してください。

## 類似プロジェクト

- [pystardust/ytfzf](https://github.com/pystardust/ytfzf) — 検索エンジン変更・チャンネル閲覧・プラグイン等の多機能版。重機能が欲しい人はこちら

## ライセンス

[Unlicense](./LICENSE) — このソフトウェアはパブリックドメインとして提供します。
