class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "eed5fa296b1424c015193c8a40108312607b6b788530e66ac36e2472b5f9fe46"
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
