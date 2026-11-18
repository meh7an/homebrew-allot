class Allot < Formula
  desc "Coordinates heavy jobs between the Claude Code sessions on one machine"
  homepage "https://github.com/meh7an/allot"
  url "https://github.com/meh7an/allot/releases/download/v0.5.0/allot-0.5.0-aarch64-apple-darwin.tar.gz"
  sha256 "1bd7c0cc243a5a32177b02ce62613e663153ffd4ac7afeb085fc7fef4bb8cacd"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "allot", "allotd", "allot-mcp"
  end

  # No service block: `allot install` sets up the LaunchAgent tech.mehran.allotd, which runs the
  # copy in ~/.allot/bin that sessions and the menu bar app use. A second autostart would only
  # fight it for allotd's lock.
  def caveats
    <<~EOS
      Finish the install, and again after every `brew upgrade allot`:
        allot install

      It copies the binaries to ~/.allot/bin, starts allotd at login, and sets up Claude Code.
      Before `brew uninstall allot`, run:
        allot uninstall

      The menu bar app is a separate cask:
        brew install --cask allot-app
    EOS
  end

  test do
    assert_equal "allot #{version}", shell_output("#{bin}/allot --version").strip
  end
end
