# Contributing to TMDash

Thank you for your interest in contributing to TMDash! We appreciate your time and effort in making this project better.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Code Style](#code-style)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork locally
   ```bash
   git clone https://github.com/your-username/TMDash.git
   cd TMDash/tmdash
   ```
3. Install dependencies (if any)
   ```bash
   moon install
   ```
4. Create a feature branch
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

1. Make your changes
2. Run tests
   ```bash
   moon test
   ```
3. Build the project
   ```bash
   moon build
   ```
4. Run the linter (if available)
5. Commit your changes with a descriptive message
   ```bash
   git commit -m "feat: add new feature"
   ```
6. Push to your fork and submit a pull request

## Code Style

- Follow the existing code style in the project
- Use meaningful variable and function names
- Add comments to explain complex logic
- Keep functions small and focused on a single responsibility
- Write tests for new functionality

## Testing

Please ensure all tests pass before submitting a pull request. To run tests:

```bash
moon test
```

## Pull Request Process

1. Update the README.md with details of changes if needed
2. Ensure all tests pass
3. Ensure your code is properly documented
4. Open a pull request with a clear title and description
5. Reference any related issues in your PR description

## Reporting Issues

When reporting issues, please include:

- A clear, descriptive title
- Steps to reproduce the issue
- Expected vs actual behavior
- Any relevant error messages
- MoonBit version and platform information

## License

By contributing to TMDash, you agree that your contributions will be licensed under the project's [LICENSE](LICENSE) file.
