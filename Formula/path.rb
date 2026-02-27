class Path < Formula
  desc "Trace PATH entries to their source config files with shadow detection"
  homepage "https://github.com/ansilithic/path"
  url "https://github.com/ansilithic/path/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "839bdcd0a6e46a769b78162cb36e06b0e97bf470e4be9e9db59536cca7ac77da"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/path"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/path --help 2>&1", 0)
  end
end
