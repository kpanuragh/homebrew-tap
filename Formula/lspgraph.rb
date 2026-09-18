class Lspgraph < Formula
  desc "Explore a codebase's call graph through any LSP server"
  homepage "https://github.com/kpanuragh/lspgraph"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.2/lspgraph-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "346731b3e7dfeb3e52a6801d3c20347fb9ed6b673d9638eec14ab946e63c32b4"
    end
    on_intel do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.2/lspgraph-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "00af11d4564d2484d99606c37404a0d153fd3ca1f1fbe13f2896b407b021cb83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.2/lspgraph-v0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "09d13054c801e6db5a23e788beee52fd6bbe2e44342f9105a4941b177e432f73"
    end
    on_intel do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.2/lspgraph-v0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "180266ec510e016a74742ead9958acf9a2e1718b0a754c2a42123b368dcb5886"
    end
  end

  def install
    bin.install "lspgraph"
  end

  def caveats
    <<~EOS
      lspgraph drives a language server; it does not bundle one. Install the
      server for the language you want and describe it in servers.toml:

        https://github.com/kpanuragh/lspgraph#configuration

      Validated against rust-analyzer, vtsls, basedpyright, gopls and clangd.
    EOS
  end

  test do
    # With no arguments the binary prints its usage line and exits non-zero.
    assert_match "usage: lspgraph", shell_output("#{bin}/lspgraph 2>&1", 1)
  end
end
