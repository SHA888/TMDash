// User model integration test

// Import the user model
import user "../src/models/user/user.mbt"

// Helper function to print test results
fn print_test(name: String, passed: Bool) {
  let status = if passed { "PASSED" } else { "FAILED" }
  println(name + ": " + status)
}

// Test user creation
fn test_user_creation() {
  println("\nTesting user creation...")
  
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
      println("Status: " + (match u.status {
        user.AccountStatus::Pending => "Pending"
        user.AccountStatus::Active => "Active"
        user.AccountStatus::Suspended => "Suspended"
        user.AccountStatus::Deactivated => "Deactivated"
      }))
    }
    Err(e) => {
      println("Failed to create user: " + e)
    }
  }
}

// Test authentication
fn test_authentication() {
  println("\nTesting authentication...")
  
  // Test with correct credentials
  let result1 = user.authenticate("admin@example.com", "password123")
  match result1 {
    Ok(u) => println("Authentication successful for user: " + u.email)
    Err(e) => println("Authentication failed: " + e)
  }
  
  // Test with incorrect credentials
  let result2 = user.authenticate("admin@example.com", "wrongpassword")
  match result2 {
    Ok(u) => println("Unexpected authentication success for wrong password")
    Err(_) => println("Correctly rejected wrong password")
  }
}

// Test admin check
fn test_admin_check() {
  println("\nTesting admin check...")
  
  // Create an admin user
  let admin_user = {
    id: "admin-123",
    email: "admin@example.com",
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
  let regular_user = {
    id: "user-123",
    email: "user@example.com",
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
  println("Admin user is admin: " + (if user.is_admin(admin_user) { "yes" } else { "no" }))
  println("Regular user is admin: " + (if user.is_admin(regular_user) { "yes" } else { "no" }))
}

// Main test function
fn main {
  println("=== Starting User Model Integration Tests ===")
  
  // Run tests
  test_user_creation()
  test_authentication()
  test_admin_check()
  
  println("\n=== Tests Completed ===")
}
