cask "translation-on-air" do
  version "0.4.0"
  sha256 "9629eb23bcd633c52c741197f05111c13341d4b7d7a16187b23089b5bf9fbcb6"

  # Tauri replaces spaces in the productName with dots for the bundle filename.
  url "https://github.com/bachdx2812/translation-on-air/releases/download/v#{version}/Translate.On.Air_#{version}_universal.dmg"
  name "Translate On Air"
  desc "Menubar translation app with a global hotkey and Japanese furigana"
  homepage "https://github.com/bachdx2812/translation-on-air"

  depends_on macos: :monterey

  app "Translate On Air.app"

  # Builds are ad-hoc signed, not notarized. On macOS 15+ Gatekeeper then refuses
  # to open the app ("Apple could not verify…") and right-click → Open no longer
  # bypasses it, so drop the quarantine flag the download added.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Translate On Air.app"]
  end

  caveats <<~EOS
    Translate On Air needs Accessibility permission to read the selected text:
      System Settings → Privacy & Security → Accessibility → enable "Translate On Air".
    After an upgrade, macOS may keep showing it as enabled while denying access:
    remove it from that list with "−", then enable it again.

    Builds are not notarized yet. If macOS still blocks the app on first launch,
    run the command below, or use System Settings → Privacy & Security → Open Anyway:
      xattr -dr com.apple.quarantine "/Applications/Translate On Air.app"
  EOS
end
