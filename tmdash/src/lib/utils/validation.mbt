// Validation utilities for TMDash

// Validate email format (basic check for @ and .)
pub fn is_valid_email(email: String) -> Bool {
  // Simple check for @ and . in the string
  email.contains("@") && email.contains(".")
}

// Validate password strength (basic check for length)
pub fn is_strong_password(password: String) -> Bool {
  // Just check length for now
  password.length() >= 8
}

// Validate date format (YYYY-MM-DD)
pub fn is_valid_date(date: String) -> Bool {
  // Basic length check
  if date.length() != 10 {
    return false
  }
  
  // Check for dashes in correct positions
  if date.char_at(4) != '-' || date.char_at(7) != '-' {
    return false
  }
  
  // Check each character that should be a digit
  let digit_positions = [0, 1, 2, 3, 5, 6, 8, 9]
  let mut all_digits = true
  
  for i in digit_positions {
    let c = date.char_at(i)
    if c < '0' || c > '9' {
      all_digits = false
      break
    }
  }
  
  all_digits
}
