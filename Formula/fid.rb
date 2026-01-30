class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "325bc995a62092430f5277b9e0d9caeb0e3e1b7f319b90a2e9e46ac604c2cd04"
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
