// Simple test for TMDash validation functions
fn main {
  // Test email validation
  let email1 = "test@example.com"
  let email2 = "invalid-email"
  
  // Test password validation
  let pass1 = "Secure123"
  let pass2 = "short"
  
  // Test date validation
  let date1 = "2023-12-31"
  let date2 = "31-12-2023"
  
  // Simple email validation (contains @ and .)
  fn is_valid_email(email: String) -> Bool {
    email.contains("@") && email.contains(".")
  }
  
  // Simple password validation (length >= 8)
  fn is_strong_password(password: String) -> Bool {
    password.length() >= 8
  }
  
  // Simple date format validation (YYYY-MM-DD)
  fn is_valid_date(date: String) -> Bool {
    if date.length() != 10 {
      return false
    }
    if date.char_at(4) != '-' || date.char_at(7) != '-' {
      return false
    }
    true
  }
  
  // Print test results
  println("EMAIL VALIDATION TESTS:")
  println("Valid email (test@example.com): " + is_valid_email(email1).to_string())
  println("Invalid email (invalid-email): " + is_valid_email(email2).to_string())
  
  println("\nPASSWORD VALIDATION TESTS:")
  println("Strong password (Secure123): " + is_strong_password(pass1).to_string())
  println("Weak password (short): " + is_strong_password(pass2).to_string())
  
  println("\nDATE VALIDATION TESTS:")
  println("Valid date (2023-12-31): " + is_valid_date(date1).to_string())
  println("Invalid date (31-12-2023): " + is_valid_date(date2).to_string())
}
