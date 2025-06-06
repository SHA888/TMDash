// User model for TMDash
// Defines the core User type and related authentication functionality

// Role type for role-based access control
pub enum Role {
  Admin
  User
}

// Account status type
pub enum AccountStatus {
  Pending  // Waiting for email verification
  Active   // Account is active
  Inactive // Account is deactivated
}

// Core User model
pub struct User {
  // Authentication fields
  id: String
  email: String
  password_hash: String
  
  // Profile information
  first_name: String
  last_name: String
  
  // Account management
  role: Role
  status: AccountStatus
  
  // Audit fields
  created_at: Int
}

// Simplified validation
pub fn validate_email(email: String) -> Bool {
  // Very basic validation
  email.contains("@") && email.contains(".")
}

// Simplified user creation
pub fn create_user(
  email: String,
  password: String,
  first_name: String,
  last_name: String,
  is_admin: Bool
) -> Result[User, String] {
  // Validate inputs
  if !validate_email(email) {
    return Err("Invalid email format")
  }
  
  if password.length() < 8 {
    return Err("Password must be at least 8 characters long")
  }
  
  // Create user with minimal fields
  let user = {
    id: "user_" + (email.hash() % 1000).to_string(),
    email: email,
    password_hash: "hashed_" + password, // In real app, use proper hashing
    first_name: first_name,
    last_name: last_name,
    role: if is_admin { Role::Admin } else { Role::User },
    status: AccountStatus::Active,
    created_at: 0 // In real app, use current timestamp
  }
  
  Ok(user)
}

// Check if user is admin
pub fn is_admin(user: User) -> Bool {
  match user.role {
    Role::Admin => true
    _ => false
  }
}

// Authentication functions
pub fn authenticate(email: String, password: String) -> Result[User, String] {
  // TODO: Implement actual authentication against database
  // For now, return a mock user
  if email == "admin@example.com" && password == "password123" {
    let now = 0  // TODO: Replace with actual timestamp
    return Ok({
      id: "1",
      email: "admin@example.com",
      password_hash: "hashed_password_here",
      two_factor_secret: None,
      first_name: "Admin",
      last_name: "User",
      phone: None,
      role: Role::Admin,
      status: AccountStatus::Active,
      last_login: Some(now),
      created_at: now,
      updated_at: now,
      deleted_at: None
    })
  }
  
  Err("Invalid email or password")
}

// Helper functions
pub fn get_full_name(user: User) -> String {
  user.first_name + " " + user.last_name
}

pub fn is_admin(user: User) -> Bool {
  match user.role {
    Role::Admin => true
    _ => false
  }
}

pub fn is_active(user: User) -> Bool {
  match user.status {
    AccountStatus::Active => true
    _ => false
  }
}
