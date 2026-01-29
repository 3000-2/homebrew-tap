class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "0abdd8c113e6099c09df199a9cc337ca2e2badde839bb6d9a31c065836effd37"
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
