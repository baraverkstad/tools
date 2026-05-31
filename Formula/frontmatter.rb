class Frontmatter < Formula
  desc "Print YAML front-matter from files"
  homepage "https://github.com/baraverkstad/tools"
  url "https://github.com/baraverkstad/tools/archive/refs/tags/v1.2.tar.gz"
  sha256 "9acd0c0558ecaf1521de551dc0eda90e6632d75949c7ba2337b226b41f5e6000"
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
      # Heading
      content
    EOF
    assert_equal "title: Test", shell_output("#{bin}/frontmatter test.md").strip
    assert_match "Test", shell_output("#{bin}/frontmatter --titles test.md")
  end
end
