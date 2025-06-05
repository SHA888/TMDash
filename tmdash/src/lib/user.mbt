// User management module for TMDash

// User type
struct User {
  id: String
  username: String
  role: String
}

// Create a new user
pub fn create_user(id: String, username: String, role: String) -> User {
  { id, username, role }
}

// Get user info as a formatted string
pub fn get_user_info(user: User) -> String {
  "User: " + user.username + " (Role: " + user.role + ")"
}

// Check if user is admin
pub fn is_admin(user: User) -> Bool {
  user.role == "admin"
}
