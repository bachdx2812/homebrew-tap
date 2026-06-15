# Homebrew Cask for SpeakMate.
#
# Lives in the single tap repo (bachdx2812/homebrew-tap → Casks/speakmate.rb).
# Users install with:
#
#     brew install --cask bachdx2812/tap/speakmate
#
# `scripts/release.sh` in the app repo builds the .dmg, computes the sha256,
# and prints the values to paste below (version + sha256). Owner: bachdx2812.

cask "speakmate" do
  version "0.2.0"
  sha256 "9886ba03cb5fa8db5df5b425bf13f41a09fe8c7f3403cf81be405cadb4968d4f"

  url "https://github.com/bachdx2812/speakmate/releases/download/v#{version}/SpeakMate_#{version}_aarch64.dmg"
  name "SpeakMate"
  desc "English/Japanese speaking practice — Azure pronunciation + Claude grammar scoring"
  homepage "https://github.com/bachdx2812/speakmate"

  depends_on macos: :big_sur

  app "SpeakMate.app"

  # The app is distributed outside the App Store. If it is not notarized,
  # macOS Gatekeeper quarantines it on first launch. This strips the
  # quarantine flag so it opens cleanly. (Harmless if the app is notarized.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SpeakMate.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.macos.speakmate",
    "~/Library/Caches/com.macos.speakmate",
    "~/Library/Preferences/com.macos.speakmate.plist",
    "~/Library/Saved Application State/com.macos.speakmate.savedState",
  ]
end
