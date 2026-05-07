class Frontmatter < Formula
  desc "Print YAML front-matter from files"
  homepage "https://github.com/baraverkstad/tools"
  url "https://github.com/baraverkstad/tools/archive/refs/tags/v1.0.tar.gz"
  sha256 "0954a8041356e0879228f7ef682fb6fd3fd19eb04871d10937a115a6afeaab52"
  license "MIT"

  def install
    bin.install "bin/frontmatter"
    man1.install "man/frontmatter.1"
  end

  test do
    (testpath/"test.md").write <<~EOF
      ---
      title: Test
      ---
      content
    EOF
    assert_equal "title: Test", shell_output("#{bin}/frontmatter test.md").strip
  end
end
