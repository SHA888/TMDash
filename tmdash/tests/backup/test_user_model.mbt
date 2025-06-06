// Simple User model test

// Import the user model
import "../src/models/user/user.mbt"

// Test creating a user
fn test_create_user() {
  println("Testing user creation...")
  
  // Create a test user
  let result = user.create_user(
    "test@example.com",
    "password123",
    "Test",
    "User",
    user.Role::Patient,
    None
  )
  
  // Check the result
  match result {
    Ok(u) => println("User created successfully: " + u.email)
    Err(e) => println("Error creating user: " + e)
  }
}

// Main test function
fn main {
  println("=== Starting User Model Tests ===")
  
  // Run tests
  test_create_user()
  
  println("=== Tests Completed ===")
}
