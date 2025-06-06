// Basic User Model Test for TMDash

// Define Role enum
enum Role {
  Admin
  Patient
}

// Define User struct
struct User {
  id: String
  email: String
  first_name: String
  last_name: String
  role: Role
}

// Function to create a user
fn create_user(email: String, first_name: String, last_name: String, role: Role) -> User {
  {
    id: "user_" + email.split("@").at(0).unwrap_or(""),
    email: email,
    first_name: first_name,
    last_name: last_name,
    role: role
  }
}

// Function to get full name
fn get_full_name(user: User) -> String {
  user.first_name + " " + user.last_name
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
  println("=== Starting Basic User Model Test ===\n")
  
  // Create a regular user
  let regular_user = create_user("user@example.com", "John", "Doe", Role::Patient)
  println("Created regular user:")
  println("  Email: " + regular_user.email)
  println("  Full name: " + get_full_name(regular_user))
  println("  Is admin: " + (if is_admin(regular_user) { "Yes" } else { "No" }))
  
  // Create an admin user
  let admin_user = create_user("admin@example.com", "Admin", "User", Role::Admin)
  println("\nCreated admin user:")
  println("  Email: " + admin_user.email)
  println("  Full name: " + get_full_name(admin_user))
  println("  Is admin: " + (if is_admin(admin_user) { "Yes" } else { "No" }))
  
  println("\n=== Test Completed Successfully ===")
}
