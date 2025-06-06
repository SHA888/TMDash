// Basic User model test

// Define a simple User type
struct User {
  id: String
  email: String
  first_name: String
  last_name: String
  role: String
  status: String
}

// Function to create a user
fn create_user(email: String, first_name: String, last_name: String, role: String) -> User {
  {
    id: "1",
    email: email,
    first_name: first_name,
    last_name: last_name,
    role: role,
    status: "active"
  }
}

// Function to get full name
fn get_full_name(user: User) -> String {
  user.first_name + " " + user.last_name
}

// Function to check if user is admin
fn is_admin(user: User) -> Bool {
  user.role == "admin"
}

// Main function
fn main {
  println("=== Starting Basic User Tests ===")
  
  // Create a test user
  let test_user = create_user("test@example.com", "Test", "User", "user")
  println("Created user: " + test_user.email)
  
  // Test full name
  let full_name = get_full_name(test_user)
  println("Full name: " + full_name)
  
  // Test admin check
  println("Is admin: " + (if is_admin(test_user) { "yes" } else { "no" }))
  
  // Create an admin user
  let admin_user = create_user("admin@example.com", "Admin", "User", "admin")
  println("\nAdmin user: " + admin_user.email)
  println("Is admin: " + (if is_admin(admin_user) { "yes" } else { "no" }))
  
  println("\n=== Tests Completed ===")
}
