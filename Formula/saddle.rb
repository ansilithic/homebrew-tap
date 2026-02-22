class Saddle < Formula
  desc "A repo manager for macOS — track, organize, and sync git repositories locally"
  homepage "https://github.com/ansilithic/saddle"
  url "https://github.com/ansilithic/saddle/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/saddle"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/saddle --help 2>&1", 0)
  end
end
