# kpanuragh/homebrew-tap

Homebrew formulae for [lspgraph](https://github.com/kpanuragh/lspgraph).

```sh
brew tap kpanuragh/tap
brew install lspgraph
```

`lspgraph` drives a Language Server Protocol server to explore a codebase's call
graph in the terminal. It does not bundle a language server — install the one
for your language and point `servers.toml` at it.

Formulae here install prebuilt binaries from the
[lspgraph releases](https://github.com/kpanuragh/lspgraph/releases/latest), for
macOS (Intel and Apple Silicon) and Linux (x86_64 and aarch64, statically
linked).
