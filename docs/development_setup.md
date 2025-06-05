# TMDash Development Setup Guide

## 🚀 Quick Start

1. **Install MoonBit**:
   ```bash
   curl -fsSL https://cli.moonbitlang.com/install/unix.sh | bash
   echo 'export PATH="$HOME/.moon/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc
   ```

2. **Verify Installation**:
   ```bash
   moon version
   # Should output: moon 0.1.20250529 (or later)
   ```

3. **Clone and Setup**:
   ```bash
   git clone <repository-url>
   cd TMDash
   moon build --target wasm
   moon run src/main/main.mbt
   ```

## 📋 Prerequisites

- Linux/macOS (Windows support is experimental)
- curl
- bash
- Git

## 🔧 Detailed Setup

### 1. Install Dependencies

#### Rust (for some features)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

#### LLVM (for advanced features)
```bash
# Ubuntu/Debian
sudo apt-get install llvm

# macOS
brew install llvm
```

### 2. Project Structure

```
TMDash/
├── src/
│   ├── main/           # Main application
│   └── lib/            # Shared libraries
├── target/             # Build outputs
├── docs/               # Documentation
└── moon.mod.json       # Project configuration
```

### 3. Common Commands

| Command | Description |
|---------|-------------|
| `moon build` | Build the project |
| `moon build --target wasm` | Build for WebAssembly |
| `moon run src/main/main.mbt` | Run the main application |
| `moon test` | Run tests |
| `moon fmt` | Format code |
| `moon clean` | Clean build artifacts |

## 🛠️ VS Code Setup

1. Install VS Code
2. Install the MoonBit extension
3. Open the project folder

## 🔍 Troubleshooting

### Build Issues
```bash
# Clean and rebuild
moon clean
moon build
```

### PATH Issues
If `moon` command is not found:
```bash
export PATH="$HOME/.moon/bin:$PATH"
```

### WebAssembly Issues
```bash
# Ensure wasm target is built
moon build --target wasm
```

## 📚 Additional Resources

- [MoonBit Documentation](https://docs.moonbitlang.com)
- [MoonBit GitHub](https://github.com/moonbitlang)
- [MoonBit Community](https://discord.gg/moonbit)
