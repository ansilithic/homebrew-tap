class Hostname < Formula
  desc "View and manage all three macOS hostname types"
  homepage "https://github.com/ansilithic/hostname"
  url "https://github.com/ansilithic/hostname/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a782e07bef396425910af07939949aa685c750b0d02059c831fa7151e95c733b"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/hostname"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/hostname --help 2>&1", 0)
  end
end
