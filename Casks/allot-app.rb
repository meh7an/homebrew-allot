cask "allot-app" do
  version "0.6.0"
  sha256 "d1305e9dbf599ee020b78b2e4c2328f1080e4e5d37f163a18331386d8771b50c"

  url "https://github.com/meh7an/allot/releases/download/v#{version}/allot-#{version}-macos-app.zip"
  name "Allot"
  desc "Menu bar app for Allot, which coordinates heavy jobs between Claude Code sessions"
  homepage "https://github.com/meh7an/allot"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on formula: "meh7an/allot/allot"

  app "Allot.app"

  uninstall quit: "tech.mehran.allot"

  zap trash: "~/Library/Preferences/tech.mehran.allot.plist"

  caveats <<~EOS
    Allot is signed ad hoc, not with an Apple Developer ID. macOS stops it once per version:
    open it, then choose Open Anyway in System Settings > Privacy & Security.

    The app talks to allotd, so run this too if you have not:
      allot install
  EOS
end
