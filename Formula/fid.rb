class Fid < Formula
  desc "Terminal UI for viewing git diffs with style"
  homepage "https://github.com/3000-2/fid"
  url "https://github.com/3000-2/fid/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4ffb925eddf8a9911355727983303a6a9baac270afc9358da147125b5d43676c"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
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
