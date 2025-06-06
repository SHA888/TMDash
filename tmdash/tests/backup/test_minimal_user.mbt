// Test file for minimal user model
import user "/src/models/user/minimal_user"

// Test creating a regular user
fn test_create_regular_user() -> Unit {
  let user = user::create_user("1", "user@example.com", "John Doe", false)
  println("Test create regular user:")
  println("  " + user::get_user_info(user))
  println("  Is admin? " + user::is_admin(user).to_string())
  println()
}

// Test creating an admin user
fn test_create_admin_user() -> Unit {
  let admin = user::create_user("2", "admin@example.com", "Admin User", true)
  println("Test create admin user:")
  println("  " + user::get_user_info(admin))
  println("  Is admin? " + user::is_admin(admin).to_string())
  println()
}

// Main test function
fn main() -> Unit {
  println("=== Testing Minimal User Model ===\n")
  test_create_regular_user()
  test_create_admin_user()
  println("=== Tests completed ===")
}
