class Cli2png < Formula
  desc "Convert ANSI terminal output to styled PNG screenshots with macOS window chrome"
  homepage "https://github.com/ansilithic/cli2png"
  url "https://github.com/ansilithic/cli2png/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "96534c5036c999b8babb9b4b26c4fd159a467e55cf1b2080970f4ea324442d03"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/cli2png"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/cli2png --help 2>&1", 0)
  end
end
