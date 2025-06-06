// Comprehensive User model test for TMDash

// Import the User model
import "../src/models/user/user.mbt"

// Helper function to print test results
fn print_test(name: String, passed: Bool) {
  println("Test " + name + ": " + (if passed { "PASSED" } else { "FAILED" }))
}

// Test email validation
fn test_email_validation() -> Bool {
  // Test valid email
  let valid_email = "test@example.com"
  let result1 = user.validate_email(valid_email)
  
  // Test invalid email
  let invalid_email = "not-an-email"
  let result2 = user.validate_email(invalid_email)
  
  // Check results
  let test1 = result1.is_ok()
  let test2 = result2.is_err()
  
  print_test("Email Validation (valid)", test1)
  print_test("Email Validation (invalid)", test2)
  
  test1 && test2
}

// Test user creation
fn test_user_creation() -> Bool {
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
  let passed = result.is_ok()
  print_test("User Creation", passed)
  
  if passed {
    let user = result.unwrap()
    println("  Created user ID: " + user.id)
    println("  Email: " + user.email)
    println("  Name: " + user.first_name + " " + user.last_name)
    println("  Role: " + (match user.role {
      user.Role::Admin => "Admin"
      user.Role::Provider => "Provider"
      user.Role::Patient => "Patient"
      user.Role::Staff => "Staff"
    }))
  }
  
  passed
}

// Test authentication
fn test_authentication() -> Bool {
  // Create a test user first
  let email = "auth_test@example.com"
  let password = "testpass123"
  
  let _ = user.create_user(
    email,
    password,
    "Auth",
    "Test",
    user.Role::Patient,
    None
  )
  
  // Test correct credentials
  let result1 = user.authenticate(email, password)
  let test1 = result1.is_ok()
  
  // Test wrong password
  let result2 = user.authenticate(email, "wrongpassword")
  let test2 = result2.is_err()
  
  // Test non-existent user
  let result3 = user.authenticate("nonexistent@example.com", "password")
  let test3 = result3.is_err()
  
  print_test("Authentication (correct credentials)", test1)
  print_test("Authentication (wrong password)", test2)
  print_test("Authentication (non-existent user)", test3)
  
  test1 && test2 && test3
}

// Test admin check
fn test_admin_check() -> Bool {
  // Create an admin user
  let admin = {
    id: "admin-123",
    email: "admin@test.com",
    password_hash: "hashed_password",
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
    id: "user-123",
    email: "user@test.com",
    password_hash: "hashed_password",
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
  let test1 = user.is_admin(admin)
  let test2 = !user.is_admin(regular)
  
  print_test("Admin Check (admin user)", test1)
  print_test("Admin Check (regular user)", test2)
  
  test1 && test2
}

// Main test function
fn main {
  println("=== Starting User Model Tests ===\n")
  
  let mut all_passed = true
  
  // Run tests
  all_passed = test_email_validation() && all_passed
  all_passed = test_user_creation() && all_passed
  all_passed = test_authentication() && all_passed
  all_passed = test_admin_check() && all_passed
  
  // Print final result
  println("\n=== " + (if all_passed { "ALL TESTS PASSED" } else { "SOME TESTS FAILED" }) + " ===")
}
