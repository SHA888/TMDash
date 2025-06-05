// TMDash - Main Application Entry Point

// User type
struct User {
  id: String
  username: String
  role: String
}

// Create a new user
fn create_user(id: String, username: String, role: String) -> User {
  { id, username, role }
}

// Get user info as a formatted string
fn get_user_info(user: User) -> String {
  "User: " + user.username + " (Role: " + user.role + ")"
}

// Check if user is admin
fn is_admin(user: User) -> Bool {
  user.role == "admin"
}

// Main function
fn main {
  // Create a sample user
  let sample_user = create_user("1", "doctor1", "doctor")
  
  // Display welcome message
  println("\n=== TMDash - Telemedicine Dashboard ===\n")
  println("Welcome to TMDash!")
  println("A telemedicine dashboard application.\n")
  
  // Display user information
  println("User Information:")
  println(get_user_info(sample_user))
  
  // Check admin status
  let status = if is_admin(sample_user) { "Admin" } else { "Not Admin" }
  println("\nAdmin status: " + status)
  
  println("\nThank you for using TMDash!")
}
