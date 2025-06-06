#!/bin/bash

# TMDash Local CI Script
# This script mirrors the GitHub Actions CI workflow for local development

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display section header
section() {
  echo -e "\n${YELLOW}==> $1${NC}"
}

# Function to run a command with error handling
run_command() {
  echo -e "${GREEN}Running: $@${NC}"
  if ! "$@"; then
    echo -e "${RED}Error: Command failed: $@${NC}"
    exit 1
  fi
}

# Main script execution
section "Starting local CI workflow"

# Change to project directory
PROJECT_DIR="tmdash"
section "Using project directory: $PROJECT_DIR"
cd "$PROJECT_DIR"

# Install dependencies
section "Installing dependencies"
run_command moon install

# Clean previous builds
section "Cleaning previous builds"
run_command ./build.sh clean

# Build the project
section "Building project"
run_command moon build

# Run tests
section "Running tests"
run_command moon test

# Create artifacts directory
section "Collecting artifacts"
run_command mkdir -p dist

# Copy build artifacts
run_command cp -r target dist/
run_command cp moon.mod.json dist/
run_command cp -r src dist/

# Create a simple summary file
run_command echo "Local CI Build $(date)" > dist/build_info.txt
run_command echo "MoonBit version: $(moon --version)" >> dist/build_info.txt

# List the contents of the dist directory for verification
section "Build artifacts"
run_command ls -la dist/

section "${GREEN}✅ Local CI completed successfully!${NC}"
echo "Artifacts are available in the 'dist' directory"
