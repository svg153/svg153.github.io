# reclaimit — Developer Disk Space Analyzer

A fast, safe Go CLI that finds reclaimable disk space on developer machines — with a bias toward **what is safe enough to delete**.

Unlike classic disk analyzers that just answer "what is big?", reclaimit answers **"what can I safely clean up?"** by understanding developer-specific leftovers like `node_modules`, `.venv`, build caches, and more.

## Key Features

- **Developer-aware**: 20+ patterns for `node_modules`, `.venv`, `__pycache__`, `.next`, Docker layers, and more
- **Three output modes**: plain text, Markdown (tables + Mermaid diagrams), and interactive TUI
- **Safe by design**: Preview before delete, `--yes` flag required, never deletes repository root
- **Single binary**: ~10MB Go binary, no dependencies required
- **Cross-platform**: Linux, macOS, Windows
- **Docker-ready**: Non-root distroless image on GHCR
- **Repository-aware grouping**: Groups cleanup candidates by project

## Quick Install

```bash
# Homebrew (macOS / Linux)
brew install svg153/reclaimit/reclaimit

# Universal install script
curl -fsSL https://raw.githubusercontent.com/svg153/reclaimit/main/install.sh | bash

# Go install
go install github.com/svg153/reclaimit@latest
```

## Usage

```bash
# Generate a Markdown report
reclaimit analyze --root "$HOME" --format markdown --out cleanup-report.md

# Interactive cleanup with TUI
reclaimit tui --root "$HOME"

# Clean reviewed targets
reclaimit clean --root "$HOME" --include-category python-venv --yes
```

## Comparison

| Feature | reclaimit | `du` / `ncdu` | `gdu` | `dust` |
|---------|-----------|---------------|-------|--------|
| Developer-aware patterns | ✅ 20+ patterns | ❌ Raw sizes | ❌ Raw sizes | ❌ Raw sizes |
| Safe delete preview | ✅ Review before delete | ❌ Immediate | ❌ Immediate | ❌ Immediate |
| Markdown reports | ✅ Tables + Mermaid | ❌ | ❌ | ❌ |
| Repository grouping | ✅ Group by project | ❌ | ❌ | ❌ |
| Docker image | ✅ GHCR distroless | ❌ | ❌ | ❌ |
| Homebrew tap | ✅ | ❌ | ❌ | ❌ |
| Cross-platform | ✅ | ✅ | ✅ | ✅ |

## Commands

| Command | Description |
|---------|-------------|
| `analyze` | Generate plain-text or Markdown report |
| `tui` | Interactive terminal UI with path tree |
| `clean` | Delete reviewed cleanup targets |

## Installation

### Homebrew (macOS / Linux)

```bash
brew install svg153/reclaimit/reclaimit
```

### Universal install script

```bash
curl -fsSL https://raw.githubusercontent.com/svg153/reclaimit/main/install.sh | bash
```

Installs to `$HOME/.local/bin/reclaimit`.

### Go install

```bash
go install github.com/svg153/reclaimit@latest
```

### Docker

```bash
docker run --rm ghcr.io/svg153/reclaimit:latest analyze --root /scan --format markdown
```

### Build from source

```bash
git clone https://github.com/svg153/reclaimit.git
cd reclaimit
task build
./bin/reclaimit --version
```

## FAQ

**Is reclaimit safe to use?**
Yes. The `clean` command requires `--yes` to delete anything. The `analyze` and `tui` commands only read — they never modify files.

**What directories does reclaimit recognize?**
Over 20 developer-specific patterns including `node_modules`, `.venv`, `__pycache__`, `.pytest_cache`, `dist/`, `build/`, `.next`, `.nuxt`, Docker layers, Go build caches, npm/yarn/pnpm caches, and more.

**Can I exclude specific paths?**
Yes. Use `--exclude-path` for exact paths or `--exclude-group` for prefix-based exclusions.

**Does it work on Windows?**
Yes. reclaimit is written in Go and supports Linux, macOS, and Windows.

**How fast is it?**
A single binary with no external dependencies. Scans 100K+ files in seconds.

**Can I export the report?**
Yes. `analyze --format markdown --out report.md` produces a Markdown report with tables, Mermaid diagrams, and PlantUML blocks.

## License

MIT — see [LICENSE](./LICENSE).

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
