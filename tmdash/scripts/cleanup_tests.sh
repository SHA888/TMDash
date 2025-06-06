#!/bin/bash

# Clean up redundant test files
echo "Cleaning up redundant test files..."

# List of files to keep
KEEP=(
  "tests/unit/user_model_test.mbt"
  "tests/integration/user_integration_test.mbt"
  "tests/validation/validation_test.mbt"
  "tests/build_test.mbt"
)

# Create necessary directories
mkdir -p tests/unit tests/integration tests/validation

# Move all test files to backup directory
echo "Creating backup of existing tests..."
mkdir -p tests/backup
cp tests/*.mbt tests/backup/ 2>/dev/null || true

# Remove all test files except the ones we want to keep
find tests -maxdepth 1 -name "*.mbt" -type f -exec rm -f {} \;

# Restore the files we want to keep
for file in "${KEEP[@]}"; do
  if [ -f "tests/backup/$(basename "$file")" ]; then
    cp "tests/backup/$(basename "$file")" "$file"
  fi
done

echo "Test directory cleaned up!"
echo "Kept files:"
for file in "${KEEP[@]}"; do
  if [ -f "$file" ]; then
    echo "- $file"
  fi
done

echo "\nOriginal test files have been backed up to: tests/backup/"
