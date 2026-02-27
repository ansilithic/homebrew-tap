class Dns < Formula
  desc "DNS and network configuration inspector for macOS"
  homepage "https://github.com/ansilithic/dns"
  url "https://github.com/ansilithic/dns/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cab32100d16be9734e18f863969ba4d4faa3e877e68241a4298045a8e6a808cd"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/dns"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/dns --help 2>&1", 0)
  end
end
