class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "3bf43726443d2dcea3837c8f8e00c57257f57ac301f8f90e8501cbca13056765"
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
