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

// Main function to demonstrate the user model
fn main {
  println("=== Starting Minimal User Model Test ===")
  
  // Create a regular user
  let regular_user = create_user("user@example.com", "John Doe", false)
  println("Regular user:")
  println("  Email: " + regular_user.email)
  println("  Name: " + regular_user.name)
  println("  Role: " + (match regular_user.role {
    Role::Admin => "Admin"
    _ => "User"
  }))
  
  // Create an admin user
  let admin_user = create_user("admin@example.com", "Admin User", true)
  println("\nAdmin user:")
  println("  Email: " + admin_user.email)
  println("  Name: " + admin_user.name)
  println("  Role: " + (match admin_user.role {
    Role::Admin => "Admin"
    _ => "User"
  }))
  
  println("\n=== Test Completed Successfully ===")
}
