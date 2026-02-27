class Hostname < Formula
  desc "View and manage all three macOS hostname types"
  homepage "https://github.com/ansilithic/hostname"
  url "https://github.com/ansilithic/hostname/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1b437d1f14ddf759cb3b7b7760217268dea98a0130b872c903eaf26c968d3860"
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
