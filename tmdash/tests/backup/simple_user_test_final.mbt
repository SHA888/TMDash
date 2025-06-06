// Simple User Model Test for TMDash

// Define Role enum
enum Role {
  Admin
  User
}

// Define User struct
struct User {
  email: String
  name: String
  role: Role
  active: Bool
}

// Function to create a user
fn create_user(email: String, name: String, is_admin: Bool) -> User {
  let role = if is_admin { Role::Admin } else { Role::User }
  {
    email: email,
    name: name,
    role: role,
    active: true
  }
}

// Function to check if user is admin
fn is_admin(user: User) -> Bool {
  match user.role {
    Role::Admin => true
    _ => false
  }
}

// Test creating a regular user
fn test_create_regular_user() -> Unit {
  let user = create_user("user@example.com", "John Doe", false)
  if user.email != "user@example.com" {
    println("❌ Email should match")
  } else {
    println("✅ Email matches")
  }
  
  if user.name != "John Doe" {
    println("❌ Name should match")
  } else {
    println("✅ Name matches")
  }
  
  if is_admin(user) {
    println("❌ Should not be admin")
  } else {
    println("✅ Correctly not an admin")
  }
}

// Test creating an admin user
fn test_create_admin_user() -> Unit {
  let admin = create_user("admin@example.com", "Admin User", true)
  
  if admin.email != "admin@example.com" {
    println("❌ Admin email should match")
  } else {
    println("✅ Admin email matches")
  }
  
  if admin.name != "Admin User" {
    println("❌ Admin name should match")
  } else {
    println("✅ Admin name matches")
  }
  
  let is_admin_user = is_admin(admin)
  if !is_admin_user {
    println("❌ Should be admin")
  } else {
    println("✅ Correctly identified as admin")
  }
}

// Test user activation status
fn test_user_activation() -> Unit {
  let user = create_user("test@example.com", "Test User", false)
  if !user.active {
    println("❌ User should be active by default")
  } else {
    println("✅ User is active by default")
  }
}

// Main function to run all tests
fn main {
  println("=== Starting User Model Tests ===\n")
  
  println("Test 1: Create Regular User")
  test_create_regular_user()
  
  println("\nTest 2: Create Admin User")
  test_create_admin_user()
  
  println("\nTest 3: User Activation")
  test_user_activation()
  
  println("\n=== All Tests Completed ===")
}
