# TMDash Test Suite

This directory contains the test suite for the TMDash application.

## Test Structure

- `unit/` - Unit tests for individual components
  - `user_model_test.mbt` - Tests for the User model

- `integration/` - Integration tests
  - `user_integration_test.mbt` - Integration tests for user-related functionality

- `validation/` - Data validation tests
  - `validation_test.mbt` - Tests for input validation logic

- `build_test.mbt` - Build verification test

## Running Tests

Run all tests:
```bash
moon test
```

Run specific test file:
```bash
moon run tests/unit/user_model_test.mbt
```

## Test Guidelines

1. Keep tests focused and test one thing per test case
2. Use descriptive test names
3. Include assertions to verify expected behavior
4. Keep test data separate from test logic
5. Clean up any test data after tests complete

## Test Coverage

We aim to maintain high test coverage for all critical paths in the application. Currently, we have tests for:

- User model
- Basic validation
- Build verification

## Adding New Tests

When adding new features, please include corresponding tests in the appropriate directory. Follow the existing test patterns and structure.
