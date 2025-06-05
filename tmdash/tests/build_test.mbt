// Build System Test
// This file verifies that the build system is working correctly

@lib

// Simple test to verify the build system is working
fn test_build_system() {
  let x = 1 + 1
  assert(x == 2, "1 + 1 should equal 2")
  println("✅ Build system test passed")
}

fn main {
  println("Running build system tests...")
  test_build_system()
  println("All build system tests passed!")
}
