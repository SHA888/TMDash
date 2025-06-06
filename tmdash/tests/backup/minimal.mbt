// Minimal MoonBit test file

// Simple function to test
fn add(a: Int, b: Int) -> Int {
  a + b
}

// Main function with minimal syntax
fn main {
  // Test the add function
  let result = add(2, 3)
  println("2 + 3 = " + result.to_string())
  
  // Simple if-else example
  if result == 5 {
    println("Test passed!")
  } else {
    println("Test failed!")
  }
}
