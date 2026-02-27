class Dns < Formula
  desc "DNS and network configuration inspector for macOS"
  homepage "https://github.com/ansilithic/dns"
  url "https://github.com/ansilithic/dns/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a3234bfa9aef7e4597cf869043b43ebfdff2f5d195c38372519a26436887ce59"
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
