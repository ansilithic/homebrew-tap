class Nic < Formula
  desc "Network interface inspector for macOS with traffic stats and Wi-Fi details"
  homepage "https://github.com/ansilithic/nic"
  url "https://github.com/ansilithic/nic/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9035f6d169042222a1116fdd307621793141cd252b6a926b3b618a9ab7846d60"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/nic"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/nic --help 2>&1", 0)
  end
end
