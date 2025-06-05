// Core module for TMDash

// A simple greeting function
pub fn greet(name: String) -> String {
  "Hello, " + name + "! Welcome to TMDash!"
}

// A simple user type
struct User {
  id: String
  name: String
  role: String
}

// Function to create a user
pub fn create_user(id: String, name: String, role: String) -> User {
  { id, name, role }
}

// Function to get user info
pub fn get_user_info(user: User) -> String {
  "User " + user.name + " (ID: " + user.id + ") - Role: " + user.role
}
