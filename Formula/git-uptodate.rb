class GitUptodate < Formula
  desc "Print branch, stash, and working tree status for one or more repositories"
  homepage "https://github.com/baraverkstad/tools"
  url "https://github.com/baraverkstad/tools/archive/refs/tags/v1.3.tar.gz"
  sha256 "d1ee899e1a8b7b2cb4a67d06507673e861b83aaefe7dc3d3b1edf327333e67ee"
  license "MIT"

  def install
    bin.install "bin/git-uptodate"
    man1.install "man/git-uptodate.1"
  end

  test do
    assert_match "--help", shell_output("#{bin}/git-uptodate --help 2>&1", 1)
  end
end
