class Ping < Formula
  desc "Enhanced ping for macOS with timestamps, color-coded output, and packet loss summary"
  homepage "https://github.com/ansilithic/ping"
  url "https://github.com/ansilithic/ping/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3a1e649559a879c1016a16efd4052ef30dfc23c9a3abed591aa1dc9399d1724f"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/ping"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/ping --help 2>&1", 0)
  end
end
