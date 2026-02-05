class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "afeca441d1dc75a8c3bacb9ec6cd3c715d6c7c710031e9b83a30df09ffa945e3"
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
