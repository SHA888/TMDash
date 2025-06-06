// Simple test for the User model

// Import the User model
import "../src/models/user/user.mbt"

// Create a simple user
let test_user = {
  id: "test-123",
  email: "test@example.com",
  password_hash: "hashed_password",
  two_factor_secret: None,
  first_name: "Test",
  last_name: "User",
  phone: None,
  role: user.Role::Patient,
  status: user.AccountStatus::Active,
  last_login: None,
  created_at: 0,
  updated_at: 0,
  deleted_at: None
}

// Test helper functions
fn test_get_full_name() {
  let full_name = user.get_full_name(test_user)
  println("Full name: " + full_name)
}

fn test_is_admin() {
  let is_admin = user.is_admin(test_user)
  println("Is admin: " + (if is_admin { "yes" } else { "no" }))
}

// Main function
pub fn main {
  println("=== Starting Simple User Tests ===")
  
  // Run tests
  test_get_full_name()
  test_is_admin()
  
  println("=== Tests Completed ===")
}
