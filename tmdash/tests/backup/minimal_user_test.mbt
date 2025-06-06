// Simple User Model Test

// Define a simple user type
struct User {
  id: String
  name: String
  is_admin: Bool
}

// Create a user
fn create_user(id: String, name: String, is_admin: Bool) -> User {
  { id: id, name: name, is_admin: is_admin }
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
  println("  ID: " + patient.id)
  println("  Name: " + patient.name)
  println("  Is Admin: " + patient.is_admin.to_string())
  
  println("\nDoctor:")
  println("  ID: " + doctor.id)
  println("  Name: " + doctor.name)
  println("  Is Admin: " + doctor.is_admin.to_string())
  
  println("\nAdmin:")
  println("  ID: " + admin.id)
  println("  Name: " + admin.name)
  println("  Is Admin: " + admin.is_admin.to_string())
  
  println("\n=== Test Complete ===")
}
