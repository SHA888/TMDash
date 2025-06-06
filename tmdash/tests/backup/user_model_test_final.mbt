// Comprehensive User model test for TMDash

// Define our User model types
enum Role {
  Admin
  Provider
  Patient
  Staff
}

enum AccountStatus {
  Pending
  Active
  Suspended
  Deactivated
}

struct User {
  id: String
  email: String
  password_hash: String
  two_factor_secret: Option[String]
  first_name: String
  last_name: String
  phone: Option[String]
  role: Role
  status: AccountStatus
  last_login: Option[Int]
  created_at: Int
  updated_at: Int
  deleted_at: Option[Int]
}

// Helper functions
fn get_full_name(user: User) -> String {
  user.first_name + " " + user.last_name
}

fn is_admin(user: User) -> Bool {
  match user.role {
    Role::Admin => true
    _ => false
  }
}

fn create_user(
  email: String,
  password: String,
  first_name: String,
  last_name: String,
  role: Role,
  phone: Option[String]
) -> Result[User, String] {
  // Simple validation
  if !email.contains("@") {
    return Err("Invalid email format")
  }
  
  if password.length() < 8 {
    return Err("Password must be at least 8 characters")
  }
  
  // Create user (in a real app, we'd hash the password)
  let user = {
    id: "user_" + (1000 + (Math::random() * 9000).to_int()).to_string(),
    email: email,
    password_hash: "hashed_" + password, // In real app, use proper hashing
    two_factor_secret: None,
    first_name: first_name,
    last_name: last_name,
    phone: phone,
    role: role,
    status: AccountStatus::Active,
    last_login: None,
    created_at: 0, // In real app, use current timestamp
    updated_at: 0,
    deleted_at: None
  }
  
  Ok(user)
}

fn authenticate(email: String, password: String) -> Result[User, String] {
  // In a real app, we'd look up the user by email and verify the password
  if email == "admin@example.com" && password == "password123" {
    // Return a mock admin user
    Ok({
      id: "admin_123",
      email: "admin@example.com",
      password_hash: "hashed_password123",
      two_factor_secret: None,
      first_name: "Admin",
      last_name: "User",
      phone: None,
      role: Role::Admin,
      status: AccountStatus::Active,
      last_login: None,
      created_at: 0,
      updated_at: 0,
      deleted_at: None
    })
  } else {
    Err("Invalid email or password")
  }
}

// Test functions
fn test_user_creation() -> Bool {
  println("\nTesting user creation...")
  
  // Test valid user creation
  let result = create_user(
    "test@example.com",
    "password123",
    "Test",
    "User",
    Role::Patient,
    None
  )
  
  match result {
    Ok(user) => {
      println("✓ User created successfully")
      println("  ID: " + user.id)
      println("  Email: " + user.email)
      println("  Name: " + get_full_name(user))
      println("  Role: " + (match user.role {
        Role::Admin => "Admin"
        Role::Provider => "Provider"
        Role::Patient => "Patient"
        Role::Staff => "Staff"
      }))
      true
    }
    Err(err) => {
      println("✗ Failed to create user: " + err)
      false
    }
  }
}

fn test_authentication() -> Bool {
  println("\nTesting authentication...")
  
  // Test valid credentials
  let result1 = authenticate("admin@example.com", "password123")
  let test1 = match result1 {
    Ok(user) => {
      println("✓ Authentication successful for: " + user.email)
      true
    }
    Err(err) => {
      println("✗ Authentication failed: " + err)
      false
    }
  }
  
  // Test invalid credentials
  let result2 = authenticate("wrong@example.com", "wrong")
  let test2 = match result2 {
    Ok(_) => {
      println("✗ Authentication should have failed")
      false
    }
    Err(_) => {
      println("✓ Correctly rejected invalid credentials")
      true
    }
  }
  
  test1 && test2
}

fn test_admin_check() -> Bool {
  println("\nTesting admin check...")
  
  // Create an admin user
  let admin = {
    id: "admin_123",
    email: "admin@example.com",
    password_hash: "hashed_password",
    two_factor_secret: None,
    first_name: "Admin",
    last_name: "User",
    phone: None,
    role: Role::Admin,
    status: AccountStatus::Active,
    last_login: None,
    created_at: 0,
    updated_at: 0,
    deleted_at: None
  }
  
  // Create a regular user
  let regular = {
    id: "user_123",
    email: "user@example.com",
    password_hash: "hashed_password",
    two_factor_secret: None,
    first_name: "Regular",
    last_name: "User",
    phone: None,
    role: Role::Patient,
    status: AccountStatus::Active,
    last_login: None,
    created_at: 0,
    updated_at: 0,
    deleted_at: None
  }
  
  // Test admin check
  let admin_check = is_admin(admin)
  let regular_check = !is_admin(regular)
  
  println("Admin user is admin: " + (if admin_check { "✓" } else { "✗" }))
  println("Regular user is admin: " + (if regular_check { "✗" } else { "✓" }))
  
  admin_check && regular_check
}

// Main test runner
fn main {
  println("=== Starting User Model Tests ===")
  
  let mut all_passed = true
  
  // Run tests
  all_passed = test_user_creation() && all_passed
  all_passed = test_authentication() && all_passed
  all_passed = test_admin_check() && all_passed
  
  // Print final result
  println("\n=== " + (if all_passed { "ALL TESTS PASSED ✓" } else { "SOME TESTS FAILED ✗" }) + " ===")
}
