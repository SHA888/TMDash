// TMDash Basic Usage Example
// This file demonstrates basic usage of the TMDash core functionality

// Core functionality is automatically available in MoonBit

// Example: User Management
struct User {
  id: String
  username: String
  email: String
  role: String
}

// Create a new user
fn create_user(username: String, email: String, role: String) -> User {
  // In a real application, you would generate a proper unique ID here
  // For demo purposes, we'll just use a simple string
  {
    id: "user_" + username,  // Using username for demo, not for production
    username: username,
    email: email,
    role: role
  }
}

// Example: Appointment Scheduling
struct Appointment {
  id: String
  patient_id: String
  doctor_id: String
  date_time: String
  status: String
}

// Create a new appointment
fn create_appointment(patient_id: String, doctor_id: String, date_time: String) -> Appointment {
  // In a real application, generate a proper unique ID
  // For demo, we'll combine patient_id and doctor_id with a timestamp
  {
    id: "appt_" + patient_id + "_" + doctor_id,
    patient_id: patient_id,
    doctor_id: doctor_id,
    date_time: date_time,
    status: "scheduled"
  }
}

// Main function to demonstrate usage
fn main() -> Unit {
  println("=== TMDash Basic Usage Example ===\n")
  
  // Create a sample user
  let user = create_user("johndoe", "john@example.com", "patient")
  println("Created user:")
  println("- ID: " + user.id)
  println("- Username: " + user.username)
  println("- Email: " + user.email)
  println("- Role: " + user.role)
  
  // Create a sample appointment
  let appointment = create_appointment(
    user.id,
    "doc_12345",
    "2025-06-15T14:30:00Z"
  )
  
  println("\nCreated appointment:")
  println("- ID: " + appointment.id)
  println("- Patient ID: " + appointment.patient_id)
  println("- Doctor ID: " + appointment.doctor_id)
  println("- Date/Time: " + appointment.date_time)
  println("- Status: " + appointment.status)
  
  println("\nExample completed successfully!")
}
