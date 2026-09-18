class Lspgraph < Formula
  desc "Explore a codebase's call graph through any LSP server"
  homepage "https://github.com/kpanuragh/lspgraph"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.1/lspgraph-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "168f65e28b3035bf5990c76e876b5d4ccc882b0270cc8b434c72b79389e7c375"
    end
    on_intel do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.1/lspgraph-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "3a4e351d3f4894b9674a268205baa4a553755fc45ae0d17271b73742306a9c6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.1/lspgraph-v0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87e27feab7118b0f424a0dad8a5bb34e9fa2aeddca62d6c04c67878cfe3e7c54"
    end
    on_intel do
      url "https://github.com/kpanuragh/lspgraph/releases/download/v0.1.1/lspgraph-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "11aee53455c249bc6db3d681b5020e963dda14899fcc9d65aea0516937c4e1aa"
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
