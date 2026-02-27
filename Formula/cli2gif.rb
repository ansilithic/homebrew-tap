class Cli2gif < Formula
  desc "Record terminal commands as animated GIFs with typing animation and ANSI color"
  homepage "https://github.com/ansilithic/cli2gif"
  url "https://github.com/ansilithic/cli2gif/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7a4a4dd47a0382405d6ba4eab90298521a5a5c58a364be0330323e2ce1542232"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/cli2gif"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/cli2gif --help 2>&1", 0)
  end
end
