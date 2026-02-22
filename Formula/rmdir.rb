class Rmdir < Formula
  desc "Safe rmdir for macOS — moves directories to Trash instead of permanent deletion"
  homepage "https://github.com/ansilithic/rmdir"
  url "https://github.com/ansilithic/rmdir/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3ea7df98af3a4bcd8469906e9f4fdf1c5140b81e8b97fd1ba2afed03015076ec"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/rmdir"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/rmdir --help 2>&1", 0)
  end
end
