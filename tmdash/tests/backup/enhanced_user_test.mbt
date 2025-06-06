// Enhanced User Model Test for TMDash

// Define Role enum with all possible roles
enum Role {
  Admin
  Provider
  Patient
  Staff
}

// Define Account Status
enum AccountStatus {
  Pending
  Active
  Suspended
  Deactivated
}

// Define User struct with essential fields
struct User {
  email: String
  first_name: String
  last_name: String
  role: Role
  status: AccountStatus
}

// Function to create a user with validation
fn create_user(
  email: String,
  first_name: String,
  last_name: String,
  role: Role,
  status: AccountStatus
) -> Result[User, String] {
  // Basic email validation
  if !email.contains("@") || !email.contains(".") {
    return Err("Invalid email format")
  }
  
  // Basic name validation
  if first_name == "" || last_name == "" {
    return Err("First and last name are required")
  }
  
  // Create and return user
  Ok({
    email: email,
    first_name: first_name,
    last_name: last_name,
    role: role,
    status: status
  })
}

// Function to get full name
fn get_full_name(user: User) -> String {
  user.first_name + " " + user.last_name
}

// Function to check if user is admin
fn is_admin(user: User) -> Bool {
  match user.role {
    Role::Admin => true
    _ => false
  }
}

// Function to check if user is active
fn is_active(user: User) -> Bool {
  match user.status {
    AccountStatus::Active => true
    _ => false
  }
}

// Function to simulate authentication
fn authenticate(email: String, password: String, user: User) -> Result[User, String] {
  // In a real app, we'd verify the password hash
  if email == user.email && password == "password123" {
    if is_active(user) {
      Ok(user)
    } else {
      Err("Account is not active")
    }
  } else {
    Err("Invalid email or password")
  }
}

// Main function
fn main {
  println("=== Starting Enhanced User Model Test ===\n")
  
  // Test 1: Create a valid user
  println("Test 1: Creating a valid user...")
  let user_result = create_user("john.doe@example.com", "John", "Doe", Role::Patient, AccountStatus::Active)
  
  match user_result {
    Ok(user) => {
      println("  ✓ User created successfully")
      println("    Email: " + user.email)
      println("    Name: " + get_full_name(user))
      println("    Role: " + (match user.role {
        Role::Admin => "Admin"
        Role::Provider => "Healthcare Provider"
        Role::Patient => "Patient"
        Role::Staff => "Staff"
      }))
      println("    Status: " + (match user.status {
        AccountStatus::Pending => "Pending"
        AccountStatus::Active => "Active"
        AccountStatus::Suspended => "Suspended"
        AccountStatus::Deactivated => "Deactivated"
      }))
      
      // Test 2: Authentication
      println("\nTest 2: Testing authentication...")
      let auth_result = authenticate("john.doe@example.com", "password123", user)
      match auth_result {
        Ok(authenticated_user) => {
          println("  ✓ Authentication successful")
          println("    Welcome, " + get_full_name(authenticated_user) + "!")
        }
        Err(err) => println("  ✗ Authentication failed: " + err)
      }
    }
    Err(err) => println("  ✗ Failed to create user: " + err)
  }
  
  // Test 3: Create an admin user
  println("\nTest 3: Creating an admin user...")
  let admin_result = create_user("admin@example.com", "Admin", "User", Role::Admin, AccountStatus::Active)
  
  match admin_result {
    Ok(admin) => {
      println("  ✓ Admin user created successfully")
      println("    Is admin: " + (if is_admin(admin) { "Yes" } else { "No" }))
    }
    Err(err) => println("  ✗ Failed to create admin user: " + err)
  }
  
  // Test 4: Create user with invalid email
  println("\nTest 4: Creating user with invalid email...")
  let invalid_email_result = create_user("not-an-email", "Test", "User", Role::Patient, AccountStatus::Active)
  match invalid_email_result {
    Ok(_) => println("  ✗ Should not have created user with invalid email")
    Err(err) => println("  ✓ Correctly rejected invalid email: " + err)
  }
  
  println("\n=== Test Completed Successfully ===")
}
