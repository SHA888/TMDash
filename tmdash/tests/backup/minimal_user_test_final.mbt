// Minimal User Model Test for TMDash

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
fn create_user(email: String, name: String, role: Role) -> User {
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

// Main function
fn main {
  println("=== Starting Minimal User Model Test ===")
  
  // Create a regular user
  let regular_user = create_user("user@example.com", "John Doe", Role::User)
  println("Regular user:")
  println("  Email: " + regular_user.email)
  println("  Name: " + regular_user.name)
  println("  Is admin: " + (if is_admin(regular_user) { "Yes" } else { "No" }))
  
  // Create an admin user
  let admin_user = create_user("admin@example.com", "Admin User", Role::Admin)
  println("\nAdmin user:")
  println("  Email: " + admin_user.email)
  println("  Name: " + admin_user.name)
  println("  Is admin: " + (if is_admin(admin_user) { "Yes" } else { "No" }))
  
  println("\n=== Test Completed Successfully ===")
}
