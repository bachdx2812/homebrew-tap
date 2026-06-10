# Homebrew cask for QuickMemo.
#
# Used by the tap repo (bachdx2812/homebrew-tap → Casks/quickmemo.rb).
# `sha256` is filled from the released universal .dmg.
# For a purely local install (no release), run packaging/install-local.sh.
cask "quickmemo" do
  version "1.1.1"
  sha256 "a7dd4de587b06984393aab4e5d6a43823236a1926392b64397877f01554b4345"

  url "https://github.com/bachdx2812/quick-note/releases/download/v#{version}/QuickMemo_#{version}_universal.dmg"
  name "QuickMemo"
  desc "Fast menu-bar note capture for macOS"
  homepage "https://github.com/bachdx2812/quick-note"

  depends_on macos: ">= :big_sur"

  app "QuickMemo.app"

  zap trash: [
    "~/Library/Application Support/com.self.quickmemo",
    "~/Library/Preferences/com.self.quickmemo.plist",
    "~/Library/Saved Application State/com.self.quickmemo.savedState",
  ]
end
