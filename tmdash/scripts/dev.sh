#!/bin/bash
set -e

# TMDash Development Script
# This script provides common development tasks for the TMDash project

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default command if none provided
DEFAULT_COMMAND="help"

# Function to display help
show_help() {
    echo -e "${BLUE}TMDash Development Script${NC}"
    echo "Usage: ./scripts/dev.sh [command]"
    echo ""
    echo "Available commands:"
    echo "  build       - Build the project"
    echo "  run         - Run the main application"
    echo "  test        - Run all tests"
    echo "  clean       - Clean build artifacts"
    echo "  deps:list   - List project dependencies"
    echo "  deps:update - Update project dependencies"
    echo "  format      - Format source code"
    echo "  check       - Run type checking"
    echo "  help        - Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./scripts/dev.sh build"
    echo "  ./scripts/dev.sh test"
    echo "  ./scripts/dev.sh run"
}

# Function to build the project
build() {
    echo -e "${GREEN}🚀 Building TMDash...${NC}"
    moon build
}

# Function to run the main application
run() {
    echo -e "${GREEN}🚀 Starting TMDash...${NC}"
    moon run src/main
}

# Function to run tests
test() {
    echo -e "${GREEN}🧪 Running tests...${NC}"
    moon test
}

# Function to clean build artifacts
clean() {
    echo -e "${GREEN}🧹 Cleaning build artifacts...${NC}"
    moon clean
}

# Function to list dependencies
list_deps() {
    echo -e "${GREEN}📦 Project Dependencies:${NC}"
    moon list-deps
}

# Function to update dependencies
update_deps() {
    echo -e "${GREEN}🔄 Updating dependencies...${NC}"
    moon update
}

# Function to format code
format() {
    echo -e "${GREEN}✨ Formatting code...${NC}"
    moon fmt
}

# Function to check types
check() {
    echo -e "${GREEN}🔍 Type checking...${NC}"
    moon check
}

# Main command dispatcher
case "${1:-$DEFAULT_COMMAND}" in
    build)
        build
        ;;
    run)
        run
        ;;
    test)
        test
        ;;
    clean)
        clean
        ;;
    deps:list)
        list_deps
        ;;
    deps:update)
        update_deps
        ;;
    format)
        format
        ;;
    check)
        check
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}❌ Unknown command: $1${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac

exit 0
