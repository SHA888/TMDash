// Validation utilities for TMDash

// Validate email format (basic check for @ and .)
pub fn is_valid_email(email: String) -> Bool {
  let parts = email.split('@')
  if parts.length() != 2 {
    return false
  }
  let domain_parts = parts[1].split('.')
  domain_parts.length() >= 2
}

// Validate password strength
pub fn is_strong_password(password: String) -> Bool {
  let mut has_upper = false
  let mut has_lower = false
  let mut has_digit = false
  let special_chars = "!@#$%^&*(),.?\":{}|<>"
  
  if password.length() < 8 {
    return false
  }
  
  for i in 0..password.length() {
    let c = password[i]
    if c.is_uppercase() {
      has_upper = true
    } else if c.is_lowercase() {
      has_lower = true
    } else if c.is_digit() {
      has_digit = true
    } else if !special_chars.contains(c) {
      return false // Invalid character
    }
  }
  
  has_upper && has_lower && has_digit
}

// Validate date format (YYYY-MM-DD)
pub fn is_valid_date(date: String) -> Bool {
  if date.length() != 10 {
    return false
  }
  
  // Check dashes at positions 4 and 7
  if date[4] != '-' || date[7] != '-' {
    return false
  }
  
  // Check all other characters are digits
  for i in [0,1,2,3,5,6,8,9] {
    if !date[i].is_digit() {
      return false
    }
  }
  
  true
}
