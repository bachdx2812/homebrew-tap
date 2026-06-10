# Homebrew cask for QuickMemo.
#
# Used by the tap repo (bachdx2812/homebrew-tap → Casks/quickmemo.rb).
# `sha256` is filled from the released universal .dmg.
# For a purely local install (no release), run packaging/install-local.sh.
cask "quickmemo" do
  version "1.1.0"
  sha256 "9391e5e73d4f48d0d118522db35666db589be019612da917073c7779ef1b3a33"

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
