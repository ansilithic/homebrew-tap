class Json2clr < Formula
  desc "Convert JSON color palettes to macOS .clr color lists"
  homepage "https://github.com/ansilithic/json2clr"
  url "https://github.com/ansilithic/json2clr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c6afae01dada02c0ee6577500979bb177d2212bff9b3560b1f5b05f803987d92"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/json2clr"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/json2clr --help 2>&1", 0)
  end
end
