# homebrew-tap

The single Homebrew tap for [bachdx](https://github.com/bachdx2812)'s macOS apps.

```sh
brew install --cask bachdx2812/tap/<app>
```

The `bachdx2812/tap/<app>` form auto-taps, so no separate `brew tap` step is needed.

## Casks

| App | Install | Source |
|-----|---------|--------|
| **AppGlance** — app-centric activity monitor | `brew install --cask bachdx2812/tap/appglance` | [app-consuming-monitor](https://github.com/bachdx2812/app-consuming-monitor) |
| **QuickMemo** — menu-bar note capture | `brew install --cask bachdx2812/tap/quickmemo` | [quick-note](https://github.com/bachdx2812/quick-note) |
| **Translate On Air** — hotkey translation + furigana | `brew install --cask bachdx2812/tap/translation-on-air` | [translation-on-air](https://github.com/bachdx2812/translation-on-air) |
| **SpeakMate** — EN/JA speaking practice | `brew install --cask bachdx2812/tap/speakmate` | [speakmate](https://github.com/bachdx2812/speakmate) |

## Notes

These builds are **unsigned / not notarized**. The casks strip the quarantine
attribute on install so the apps open cleanly. If macOS still blocks first
launch: right-click the app → **Open**, or
`xattr -dr com.apple.quarantine "/Applications/<App>.app"`.

## Maintaining

Each cask carries `version` + `sha256` of the release `.dmg`/`.zip`. After an
app publishes a new GitHub release, bump those two fields in the matching
`Casks/<app>.rb`. QuickMemo's release CI updates its cask here automatically.
