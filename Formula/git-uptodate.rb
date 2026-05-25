class GitUptodate < Formula
  desc "Print branch, stash, and working tree status for one or more repositories"
  homepage "https://github.com/baraverkstad/tools"
  url "https://github.com/baraverkstad/tools/archive/refs/tags/v1.1.tar.gz"
  sha256 "53143c0b1f0bbcfe167ff67922bc9706e55ac1d422b27d4db4b258e10f4703b2"
  license "MIT"

  def install
    bin.install "bin/git-uptodate"
    man1.install "man/git-uptodate.1"
  end

  test do
    assert_match "--help", shell_output("#{bin}/git-uptodate --help 2>&1", 1)
  end
end
