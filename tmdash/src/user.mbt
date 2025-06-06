// User module for TMDash

// Role type for role-based access control
pub enum Role {
  Admin
  User
}

// Core User model
pub struct User {
  id: String
  email: String
  first_name: String
  last_name: String
  role: Role
}

// Create a new user
pub fn create_user(
  id: String,
  email: String,
  first_name: String,
  last_name: String,
  is_admin: Bool
) -> User {
  {
    id: id,
    email: email,
    first_name: first_name,
    last_name: last_name,
    role: if is_admin { Role::Admin } else { Role::User }
  }
}

// Get user's full name
pub fn get_full_name(user: User) -> String {
  user.first_name + " " + user.last_name
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
  "User: " + get_full_name(user) + " (" + user.email + ") - " + role_str
}
