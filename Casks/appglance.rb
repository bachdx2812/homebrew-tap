# Homebrew cask for AppGlance.
#
# Lives in the single tap repo (bachdx2812/homebrew-tap → Casks/appglance.rb).
# Unsigned, non-notarized build, so the cask strips the quarantine attribute
# on install. Update `version` and `sha256` after each release with the values
# printed by scripts/package-app.sh in the app repo.
cask "appglance" do
  version "0.1.0"
  sha256 "aba107aef51267b9695042019d377be6effee53928cdb99cfe43f701ace62540"

  url "https://github.com/bachdx2812/app-consuming-monitor/releases/download/v#{version}/AppGlance-#{version}-macos.zip"
  name "AppGlance"
  desc "App-centric macOS activity monitor"
  homepage "https://github.com/bachdx2812/app-consuming-monitor"

  depends_on macos: ">= :ventura"

  app "AppGlance.app"

  # Allow first launch despite the build being unsigned.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AppGlance.app"],
                   sudo: false
  end

  uninstall quit: "com.bachdx.appglance"

  zap trash: [
    "~/Library/Saved Application State/com.bachdx.appglance.savedState",
    "~/Library/Preferences/com.bachdx.appglance.plist",
    "~/Library/WebKit/com.bachdx.appglance",
  ]
end
