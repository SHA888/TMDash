// User Management Tests
// This file contains tests for user management functionality

// Import the core library
@lib

// Test data
let test_username = "testuser"
let test_email = "test@example.com"
let test_role = "patient"

// Test user creation
fn test_create_user() {
  let user = create_user(test_username, test_email, test_role)
  
  // Assertions
  assert(user.username == test_username, "Username should match")
  assert(user.email == test_email, "Email should match")
  assert(user.role == test_role, "Role should match")
  assert(user.id.starts_with("user_"), "User ID should start with 'user_'")
  
  println("✅ test_create_user passed")
}

// Run all tests
fn main {
  println("Running User Management Tests...\n")
  test_create_user()
  println("\nAll tests completed!")
}
