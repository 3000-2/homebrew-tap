class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "669dfd070dffa42cedd18d338463b988c14a11ad47dc86fd81f8d365b047522a"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    libexec.install Dir["*"]
    (bin/"fid").write <<~EOS
      #!/bin/bash
      exec bun run "#{libexec}/src/index.ts" "$@"
    EOS
  end

  test do
    assert_match "Error", shell_output("#{bin}/fid --invalid 2>&1", 1)
  end
end
