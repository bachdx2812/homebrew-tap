cask "translation-on-air" do
  version "0.1.0"
  sha256 "dd407cbbbe5aa07edfe4207db2a0f555b97851c347f00eb0334464c8b6ac1830"

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
