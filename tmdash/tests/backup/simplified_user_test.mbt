// Simplified User Model Test for TMDash

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
}

// Function to create a user
fn create_user(email: String, name: String, is_admin: Bool) -> User {
  let role = if is_admin { Role::Admin } else { Role::User }
  {
    email: email,
    name: name,
    role: role
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
test "create regular user" {
  let user = create_user("user@example.com", "John Doe", false)
  
  // Check email
  if user.email == "user@example.com" {
    println("✓ Email matches")
  } else {
    println("✗ Email does not match")
  }
  
  // Check name
  if user.name == "John Doe" {
    println("✓ Name matches")
  } else {
    println("✗ Name does not match")
  }
  
  // Check admin status
  let is_user_admin = is_admin(user)
  if is_user_admin {
    println("✗ User should not be an admin")
  } else {
    println("✓ User is not an admin (correct)")
  }
}

// Test creating an admin user
test "create admin user" {
  let admin = create_user("admin@example.com", "Admin User", true)
  
  // Check email
  if admin.email == "admin@example.com" {
    println("✓ Admin email matches")
  } else {
    println("✗ Admin email does not match")
  }
  
  // Check name
  if admin.name == "Admin User" {
    println("✓ Admin name matches")
  } else {
    println("✗ Admin name does not match")
  }
  
  // Check admin status
  if is_admin(admin) {
    println("✓ User is an admin (correct)")
  } else {
    println("✗ User should be an admin")
  }
}

// Test role assignment
test "verify role assignment" {
  let regular = create_user("regular@example.com", "Regular User", false)
  let admin = create_user("admin@example.com", "Admin User", true)
  
  match regular.role {
    Role::User => println("✓ Regular user has User role")
    _ => println("✗ Regular user should have User role")
  }
  
  match admin.role {
    Role::Admin => println("✓ Admin user has Admin role")
    _ => println("✗ Admin user should have Admin role")
  }
}

// Main function to run all tests
fn main {
  println("=== Running User Model Tests ===\n")
  
  // Run the test functions
  println("\n[Test] create regular user")
  test_create_regular_user()
  
  println("\n[Test] create admin user")
  test_create_admin_user()
  
  println("\n[Test] verify role assignment")
  test_verify_role_assignment()
  
  println("\n=== All tests completed ===")
}

// Rename test functions to be callable from main
fn test_create_regular_user() -> Unit {
  println("Testing regular user creation...")
  let user = create_user("user@example.com", "John Doe", false)
  
  // Check email
  if user.email == "user@example.com" {
    println("✓ Email matches")
  } else {
    println("✗ Email does not match")
  }
  
  // Check name
  if user.name == "John Doe" {
    println("✓ Name matches")
  } else {
    println("✗ Name does not match")
  }
  
  // Check admin status
  let is_user_admin = is_admin(user)
  if is_user_admin {
    println("✗ User should not be an admin")
  } else {
    println("✓ User is not an admin (correct)")
  }
}

fn test_create_admin_user() -> Unit {
  println("Testing admin user creation...")
  let admin = create_user("admin@example.com", "Admin User", true)
  
  // Check email
  if admin.email == "admin@example.com" {
    println("✓ Admin email matches")
  } else {
    println("✗ Admin email does not match")
  }
  
  // Check name
  if admin.name == "Admin User" {
    println("✓ Admin name matches")
  } else {
    println("✗ Admin name does not match")
  }
  
  // Check admin status
  let is_user_admin = is_admin(admin)
  if is_user_admin {
    println("✓ User is an admin (correct)")
  } else {
    println("✗ User should be an admin")
  }
}

fn test_verify_role_assignment() -> Unit {
  println("Verifying role assignments...")
  let regular = create_user("regular@example.com", "Regular User", false)
  let admin = create_user("admin@example.com", "Admin User", true)
  
  match regular.role {
    Role::User => println("✓ Regular user has User role")
    _ => println("✗ Regular user should have User role")
  }
  
  match admin.role {
    Role::Admin => println("✓ Admin user has Admin role")
    _ => println("✗ Admin user should have Admin role")
  }
}
