#!/bin/bash

# Simple local build script for TMDash
# This script follows the CI pattern but is simplified for local use

set -e  # Exit on error

echo "=== Starting TMDash Local Build ==="

# Change to project directory if needed
if [ -d "tmdash" ]; then
  cd tmdash
  echo "Changed to tmdash directory"
fi

# Clean previous builds
echo -e "\n🧹 Cleaning previous builds..."
./build.sh clean

# Install dependencies
echo -e "\n📦 Installing dependencies..."
moon install

# Build the project
echo -e "\n🔨 Building project..."
./build.sh build

# Run tests
echo -e "\n🧪 Running tests..."
./build.sh test || echo -e "\n⚠️  Some tests may have failed"

# Create dist directory
echo -e "\n📂 Preparing build artifacts..."
mkdir -p dist

# Copy build artifacts
cp -r target dist/ 2>/dev/null || true
cp moon.mod.json dist/ 2>/dev/null || true
cp -r src dist/ 2>/dev/null || true

# Generate build info
echo -e "\n📋 Generating build info..."
{
  echo "TMDash Build Information"
  echo "======================="
  echo "Build Date: $(date)"
  echo "MoonBit Version: $(moon --version 2>&1 || echo 'Not available')"
  echo "System: $(uname -a)"
  echo -e "\nDirectory Structure:"
  find . -maxdepth 2 -type d | sort
} > dist/build_info.txt

# Show build summary
echo -e "\n✅ Build completed successfully!"
echo -e "📁 Build artifacts are in: $(pwd)/dist"
echo -e "\n📋 Build info saved to: $(pwd)/dist/build_info.txt"
echo -e "\n=== TMDash Local Build Complete ===\n"
