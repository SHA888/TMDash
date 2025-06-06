// Minimal User model for TMDash
// A simplified version that works with current MoonBit capabilities

// Role type for role-based access control
pub enum Role {
  Admin
  User
}

// Core User model with minimal fields
pub struct User {
  id: String
  email: String
  name: String
  role: Role
}

// Create a new user
pub fn create_user(id: String, email: String, name: String, is_admin: Bool) -> User {
  {
    id: id,
    email: email,
    name: name,
    role: if is_admin { Role::Admin } else { Role::User }
  }
}

// Check if user is admin
pub fn is_admin(user: User) -> Bool {
  match user.role {
    Role::Admin => true
    _ => false
  }
}

// Get user info as string
pub fn get_user_info(user: User) -> String {
  let role_str = match user.role {
    Role::Admin => "Admin"
    Role::User => "User"
  }
  "User: " + user.name + " (" + user.email + ") - " + role_str
}
