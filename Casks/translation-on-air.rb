cask "translation-on-air" do
  version "0.3.0"
  sha256 "dd81ce4537d98205b6916b14632d5c56b474210adb68734b32dee152a51beece"

  # Tauri replaces spaces in the productName with dots for the bundle filename.
  url "https://github.com/bachdx2812/translation-on-air/releases/download/v#{version}/Translate.On.Air_#{version}_universal.dmg"
  name "Translate On Air"
  desc "Menubar translation app with a global hotkey and Japanese furigana"
  homepage "https://github.com/bachdx2812/translation-on-air"

  depends_on macos: :monterey

  app "Translate On Air.app"

  caveats <<~EOS
    Translate On Air needs Accessibility permission to read the selected text:
      System Settings → Privacy & Security → Accessibility → enable "Translate On Air".

    Builds are not notarized yet. If macOS blocks the app on first launch:
      right-click the app → Open, or run
      xattr -dr com.apple.quarantine "/Applications/Translate On Air.app"
  EOS
end
