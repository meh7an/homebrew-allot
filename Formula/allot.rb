class Allot < Formula
  desc "Coordinates heavy jobs between the Claude Code sessions on one machine"
  homepage "https://github.com/meh7an/allot"
  url "https://github.com/meh7an/allot/releases/download/v0.3.0/allot-0.3.0-aarch64-apple-darwin.tar.gz"
  sha256 "b1624888276a521ff010081bd1b0f0f29ba40009f16d03621df456afe9f4c4a4"
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
