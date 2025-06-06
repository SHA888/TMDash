// Simple User Model Test for TMDash

// Define a simple User type
struct User {
  id: String
  name: String
  is_admin: Bool
}

// Create a user
fn create_user(id: String, name: String, is_admin: Bool) -> User {
  { id: id, name: name, is_admin: is_admin }
}

// Get user info as string
fn get_user_info(user: User) -> String {
  user.name + " (ID: " + user.id + ") - " + (if user.is_admin { "Admin" } else { "User" })
}

// Main function
fn main {
  // Create test users
  let patient = create_user("1", "John Doe", false)
  let doctor = create_user("2", "Dr. Smith", false)
  let admin = create_user("3", "Admin User", true)
  
  // Print user info
  println("=== User Information ===")
  
  println("Patient:")
  println("  " + get_user_info(patient))
  
  println("\nDoctor:")
  println("  " + get_user_info(doctor))
  
  println("\nAdmin:")
  println("  " + get_user_info(admin))
  
  println("\n=== Test Complete ===")
}
