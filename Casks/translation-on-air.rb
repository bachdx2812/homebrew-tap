cask "translation-on-air" do
  version "0.1.1"
  sha256 "29c4cf8483427c6ca9bd5c7fe858ab9628d0ef25f9a5cd8fad42a7786c075d3d"

  # Tauri replaces spaces in the productName with dots for the bundle filename.
  url "https://github.com/bachdx2812/translation-on-air/releases/download/v#{version}/Translate.On.Air_#{version}_universal.dmg"
  name "Translate On Air"
  desc "Menubar translation app with a global hotkey and Japanese furigana"
  homepage "https://github.com/bachdx2812/translation-on-air"

  app "Translate On Air.app"

  caveats <<~EOS
    Translate On Air needs Accessibility permission to read the selected text:
      System Settings → Privacy & Security → Accessibility → enable "Translate On Air".

    Builds are not notarized yet. If macOS blocks the app on first launch:
      right-click the app → Open, or run
      xattr -dr com.apple.quarantine "/Applications/Translate On Air.app"
  EOS
end
