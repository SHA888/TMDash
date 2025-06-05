#!/bin/bash

# TMDash Build Script
# This script provides common build and development tasks

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to display help
show_help() {
  echo -e "${YELLOW}TMDash Build Script${NC}"
  echo "Usage: ./build.sh [command]"
  echo ""
  echo "Available commands:"
  echo "  build       - Build the project in release mode"
  echo "  build:debug - Build the project in debug mode"
  echo "  test        - Run tests"
  echo "  clean       - Clean build artifacts"
  echo "  run         - Run the application"
  echo "  help        - Show this help message"
}

# Function to build the project
build() {
  local profile=$1
  echo -e "${GREEN}Building TMDash in ${profile} mode...${NC}"
  
  # Create output directory if it doesn't exist
  mkdir -p dist
  
  # Build the project
  moon build --profile=${profile}
  
  # Copy any additional assets
  cp -r public/* dist/ 2>/dev/null || true
  
  echo -e "${GREEN}Build completed!${NC}"
}

# Function to run tests
test() {
  echo -e "${GREEN}Running tests...${NC}"
  moon test
}

# Function to clean build artifacts
clean() {
  echo -e "${YELLOW}Cleaning build artifacts...${NC}"
  rm -rf dist/*
  echo -e "${GREEN}Clean complete!${NC}"
}

# Function to run the application
run() {
  echo -e "${GREEN}Starting TMDash...${NC}"
  moon run src/main/main.mbt
}

# Main script execution
case "$1" in
  build)
    build "release"
    ;;
  build:debug)
    build "debug"
    ;;
  test)
    test
    ;;
  clean)
    clean
    ;;
  run)
    run
    ;;
  help|*)
    show_help
    ;;
esac
