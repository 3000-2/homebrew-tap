class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f9a6e7b57dc76687abc935e85f06848ad151c6de1e11da3a8e085b77f1293e65"
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
