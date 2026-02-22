class Rm < Formula
  desc "Safe rm for macOS — moves files to Trash instead of permanent deletion"
  homepage "https://github.com/ansilithic/rm"
  url "https://github.com/ansilithic/rm/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "104397bc864714d8cdaaed9dd5928b314f2847b3423ed2f1e92b9315a79a0bb2"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/rm"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/rm --help 2>&1", 0)
  end
end
