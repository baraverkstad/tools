class GitUptodate < Formula
  desc "Print branch, stash, and working tree status for one or more repositories"
  homepage "https://github.com/baraverkstad/tools"
  url "https://github.com/baraverkstad/tools/archive/refs/tags/v1.2.tar.gz"
  sha256 "9acd0c0558ecaf1521de551dc0eda90e6632d75949c7ba2337b226b41f5e6000"
  license "MIT"

  def install
    bin.install "bin/git-uptodate"
    man1.install "man/git-uptodate.1"
  end

  test do
    assert_match "--help", shell_output("#{bin}/git-uptodate --help 2>&1", 1)
  end
end
