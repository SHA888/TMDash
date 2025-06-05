#!/bin/bash
# Environment check script for TMDash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🔍 Checking TMDash development environment...${NC}"

# Check MoonBit installation
if ! command -v moon &> /dev/null; then
    echo -e "${RED}❌ MoonBit is not installed or not in PATH${NC}"
    echo "Please install MoonBit from: https://www.moonbitlang.com/"
    exit 1
else
    echo -e "✅ MoonBit is installed"
    moon --version
fi

# Check MoonBit version
MOONBIT_VERSION=$(moon --version 2>&1 | head -n 1 | cut -d' ' -f2)
if [[ "$MOONBIT_VERSION" < "0.1.0" ]]; then
    echo -e "${RED}❌ MoonBit version $MOONBIT_VERSION is too old. Please upgrade to 0.1.0 or later.${NC}
    Visit: https://www.moonbitlang.com/"
    exit 1
else
    echo -e "✅ MoonBit version $MOONBIT_VERSION is compatible"
fi

# Check project structure
REQUIRED_DIRS=("src" "src/main" "src/lib" "tests" "examples" "scripts")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "✅ Directory exists: $dir"
    else
        echo -e "${RED}❌ Missing directory: $dir${NC}"
        exit 1
    fi

done

echo -e "\n${GREEN}🎉 Environment check passed! You're ready to develop TMDash.${NC}"
echo -e "Run './scripts/dev.sh help' to see available development commands."
