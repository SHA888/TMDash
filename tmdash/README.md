# TMDash - Telemedicine Dashboard

A modern telemedicine dashboard built with MoonBit, designed to provide healthcare professionals with a powerful and intuitive interface for managing patient care.

## 🚀 Features

- **Patient Management**: Track and manage patient records
- **Appointment Scheduling**: Schedule and manage medical appointments
- **Medical Records**: Securely store and access patient medical history
- **User Authentication**: Role-based access control for different user types

## 🛠️ Prerequisites

- [MoonBit](https://www.moonbitlang.com/) (v0.1.0 or later)
- [MoonBit VSCode Extension](https://marketplace.visualstudio.com/items?itemName=moonbitlang.moonbit) (Recommended)

## 🏗️ Build System

The project uses MoonBit's built-in build system with custom configurations for different environments.

### Build Targets

- `main`: Builds the main application (output: `dist/tmdash.wasm`)
- `test`: Builds and runs tests (output: `dist/tests`)

### Build Profiles

- `debug`: Development build with debug symbols and source maps
- `release`: Optimized production build

### Available Scripts

- `./build.sh build`: Build the project in release mode
- `./build.sh build:debug`: Build the project in debug mode
- `./build.sh test`: Run tests
- `./build.sh clean`: Clean build artifacts
- `./build.sh run`: Run the application
- `./build.sh help`: Show help message

## 🚀 Getting Started

### Prerequisites

- [MoonBit](https://www.moonbitlang.com/) (v0.1.0 or later)
- [MoonBit VSCode Extension](https://marketplace.visualstudio.com/items?itemName=moonbitlang.moonbit) (Recommended)

### Building the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/SHA888/TMDash.git
   cd TMDash
   ```

2. Build the project:
   ```bash
   # For development (debug build)
   ./build.sh build:debug
   
   # For production (optimized build)
   ./build.sh build
   ```

3. Run the application:
   ```bash
   ./build.sh run
   ```

### Running Tests

```bash
./build.sh test
```

### Cleaning Build Artifacts

```bash
./build.sh clean
```
- [MoonBit VSCode Extension](https://marketplace.visualstudio.com/items?itemName=moonbitlang.moonbit) (Recommended)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/SHA888/TMDash.git
   cd TMDash/tmdash
   ```

2. Make the development scripts executable:
   ```bash
   chmod +x scripts/*.sh
   ```

3. Check your development environment:
   ```bash
   ./scripts/check_env.sh
   ```

### Development Workflow

Use the development script for common tasks:

```bash
# Build the project
./scripts/dev.sh build

# Run the application
./scripts/dev.sh run

# Run tests
./scripts/dev.sh test

# Format code
./scripts/dev.sh format

# Check types
./scripts/dev.sh check

# List dependencies
./scripts/dev.sh deps:list

# Update dependencies
./scripts/dev.sh deps:update

# Clean build artifacts
./scripts/dev.sh clean
```

### Build Configuration

The project uses the following build configuration:

- **Development Build**: Optimized for development with debug information
  ```bash
  # Build the project
  ./scripts/dev.sh build
  
  # Run the application
  ./scripts/dev.sh run
  
  # Run tests
  ./scripts/dev.sh test
  ```

- **WebAssembly Build**: Build for web browsers
  ```bash
  # Build WebAssembly output
  ./scripts/build_wasm.sh
  
  # The output will be in the dist/wasm directory
  # You can test it with a local web server:
  cd dist/wasm && python3 -m http.server 8000
  # Then open http://localhost:8000 in your browser
  ```

### Development Scripts

The project includes several scripts in the `scripts/` directory:

- `dev.sh` - Main development script with common tasks
- `build_wasm.sh` - Build the project for WebAssembly
- `check_env.sh` - Check if the development environment is set up correctly

Run any script with `--help` to see available options.

### Dependency Management

Dependencies are managed through MoonBit's built-in package manager. The `moon.mod.json` file contains the project's dependencies.

To add a new dependency:
1. Update `moon.mod.json` with the new dependency
2. Run `./scripts/dev.sh deps:update`

### Testing

Run tests using the development script:
```bash
./scripts/dev.sh test
```

Test files should be named with `_test.mbt` suffix and placed alongside the code they test.

## 📁 Project Structure

```
tmdash/
├── src/
│   ├── lib/          # Core library code
│   │   ├── hello.mbt
│   │   ├── hello_test.mbt
│   │   ├── lib.mbt
│   │   └── moon.pkg.json
│   └── main/         # Main application code
│       ├── main.mbt
│       └── moon.pkg.json
├── .gitignore
├── LICENSE
├── README.md
└── moon.mod.json     # Project configuration
```

## 📚 Documentation

- [MoonBit Documentation](https://www.moonbitlang.com/docs/)
- [API Reference](docs/api.md) (Coming Soon)
- [Architecture Decision Records](docs/adr/) (Coming Soon)

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting pull requests.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📧 Contact

For any questions or feedback, please open an issue or contact the maintainers.