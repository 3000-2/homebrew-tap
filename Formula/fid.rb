class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d0a1fda603c69df2d3644305f7456b2529f2d36c32d56436903413eea5829a06"
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
    system "#{bin}/fid", "--help"
  end
end
