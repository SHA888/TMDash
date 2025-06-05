// Core data models for TMDash

// Represents a user in the system
struct User {
  id: String
  username: String
  email: String
  role: String
}

// Represents a patient's basic information
struct Patient {
  id: String
  name: String
  date_of_birth: String
  gender: String
  blood_type: Option[String]
}

// Represents a medical appointment
struct Appointment {
  id: String
  patient_id: String
  doctor_id: String
  date_time: String
  status: String  // scheduled, completed, cancelled
}

// Helper functions for models
pub fn create_user(id: String, username: String, email: String, role: String) -> User {
  { id, username, email, role }
}

pub fn create_patient(id: String, name: String, date_of_birth: String, gender: String) -> Patient {
  { id, name, date_of_birth, gender, blood_type: None }
}

pub fn create_appointment(id: String, patient_id: String, doctor_id: String, date_time: String) -> Appointment {
  { id, patient_id, doctor_id, date_time, status: "scheduled" }
}
