print "test_cube_real: ";
print "test cube_real(8) ... ";
let
  val test_cube_real = cube_real(8.0)
in
  if (abs(512.0-test_cube_real) < 0.01)
    then print "test passed\n"
  else
    print "test failed\n"
end;