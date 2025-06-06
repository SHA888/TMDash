// Simple test for the User model

// Import the User model (using relative path)
import "../src/models/user/user.mbt"

// Helper function to print test results
fn print_test_result(name: String, passed: Bool) {
  let status = if passed { "PASSED" } else { "FAILED" }
  println("Test " + name + ": " + status)
}

// Test user creation
fn test_create_user() -> Bool {
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
  
  // Check if user was created successfully
  match result {
    Ok(u) => {
      println("User created successfully")
      println("Name: " + u.first_name + " " + u.last_name)
      println("Email: " + u.email)
      println("Role: " + (match u.role {
        user.Role::Admin => "Admin"
        user.Role::Provider => "Provider"
        user.Role::Patient => "Patient"
        user.Role::Staff => "Staff"
      }))
      true
    }
    Err(e) => {
      println("Failed to create user: " + e)
      false
    }
  }
}

// Test authentication
fn test_authentication() -> Bool {
  println("\nTesting authentication...")
  
  // Test with correct credentials
  let result1 = user.authenticate("admin@example.com", "password123")
  let test1 = result1.is_ok()
  println("Authentication with correct credentials: " + (if test1 { "PASSED" } else { "FAILED" }))
  
  // Test with incorrect credentials
  let result2 = user.authenticate("admin@example.com", "wrongpassword")
  let test2 = result2.is_err()
  println("Authentication with wrong password: " + (if test2 { "PASSED" } else { "FAILED" }))
  
  test1 && test2
}

// Test admin check
fn test_admin_check() -> Bool {
  println("\nTesting admin check...")
  
  // Create an admin user
  let admin = {
    id: "1",
    email: "admin@example.com",
    password_hash: "",
    two_factor_secret: None,
    first_name: "Admin",
    last_name: "User",
    phone: None,
    role: user.Role::Admin,
    status: user.AccountStatus::Active,
    last_login: None,
    created_at: 0,
    updated_at: 0,
    deleted_at: None
  }
  
  // Create a regular user
  let regular = {
    id: "2",
    email: "user@example.com",
    password_hash: "",
    two_factor_secret: None,
    first_name: "Regular",
    last_name: "User",
    phone: None,
    role: user.Role::Patient,
    status: user.AccountStatus::Active,
    last_login: None,
    created_at: 0,
    updated_at: 0,
    deleted_at: None
  }
  
  // Test admin check
  let admin_check = user.is_admin(admin)
  let regular_check = !user.is_admin(regular)
  
  println("Admin check for admin user: " + (if admin_check { "PASSED" } else { "FAILED" }))
  println("Admin check for regular user: " + (if regular_check { "PASSED" } else { "FAILED" }))
  
  admin_check && regular_check
}

// Main function
pub fn main {
  println("=== Starting User Model Tests ===\n")
  
  let mut all_passed = true
  
  // Run tests
  all_passed = test_create_user() && all_passed
  all_passed = test_authentication() && all_passed
  all_passed = test_admin_check() && all_passed
  
  println("\n=== " + (if all_passed { "ALL TESTS PASSED" } else { "SOME TESTS FAILED" }) + " ===")
}
