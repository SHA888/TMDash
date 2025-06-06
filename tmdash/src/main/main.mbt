// TMDash - Main Application Entry Point

// Import the User model and related types
import models/user/user { User, Role, AccountStatus, create_user, authenticate, get_full_name, is_admin, is_active }
import models/user/user_test { run_tests }

// Main function
fn main {
  // Run tests
  println("\n=== TMDash - Telemedicine Dashboard ===\n")
  println("Running tests...\n")
  run_tests()
  
  // Example usage of the User model
  println("\n=== Example Usage ===\n")
  
  // Create a new user
  let user_result = create_user(
    "doctor@example.com",
    "SecurePassword123!",
    "John",
    "Doe",
    Role.Provider,
    Some("+1234567890")
  )
  
  // Handle the result
  match user_result {
    Ok(user) => {
      // Display user information
      println("✅ User created successfully!")
      println("User ID: " + user.id)
      println("Name: " + get_full_name(user))
      println("Email: " + user.email)
      println("Role: " + user.role.to_string())
      println("Status: " + user.status.to_string())
      
      // Check admin status
      let status = if is_admin(user) { "Admin" } else { "Not Admin" }
      println("Admin status: " + status)
      
      // Check if account is active
      let active_status = if is_active(user) { "Active" } else { "Inactive" }
      println("Account status: " + active_status)
    },
    Err(err) => println("❌ Error creating user: " + err)
  }
  
  println("\n=== End of Example ===\n")
}
}
