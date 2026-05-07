class GitUptodate < Formula
  desc "Print branch, stash, and working tree status for one or more repositories"
  homepage "https://github.com/baraverkstad/tools"
  url "https://github.com/baraverkstad/tools/archive/refs/tags/v1.0.tar.gz"
  sha256 "0954a8041356e0879228f7ef682fb6fd3fd19eb04871d10937a115a6afeaab52"
  license "MIT"

  def install
    bin.install "bin/git-uptodate"
    man1.install "man/git-uptodate.1"
  end

  test do
    assert_match "--help", shell_output("#{bin}/git-uptodate --help 2>&1", 1)
  end
end
