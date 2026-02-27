class Saddle < Formula
  desc "Repo wrangler for macOS — track, organize, and sync git repositories from a manifest"
  homepage "https://github.com/ansilithic/saddle"
  url "https://github.com/ansilithic/saddle/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "7aa72a9fed3d060319c8cbda993172462d4e0b75d5692389d387c09ebe8d4b77"
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
