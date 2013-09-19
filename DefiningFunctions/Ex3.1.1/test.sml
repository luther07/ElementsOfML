(* test_cube_real  *)
print "test_cube_real: ";
print "cube_real(8) should equal 512--->";
let
  val test_cube_real = cube_real(8.0)
in
  if (abs(512.0-test_cube_real) < 0.01)
    then print "test passed\n"
  else
    print "test failed\n"
end;

(* test_inputWord  *)
print "test_inputWord: ";
print "inputWord called on  empty file should equal empty string--->";
let
  val emptyOutputFile = TextIO.openOut("empty.txt")
  val closeFile = TextIO.closeOut(emptyOutputFile)
  val emptyInputFile = TextIO.openIn("empty.txt")
  val nextWord = inputWord(emptyInputFile,"")
in
  if (nextWord = "")
    then print "test passed\n"
  else
    print "test failed\n"
end;

(* test_inputWord *)
print "test_inputWord: ";
print "inputWord called on hello world file should equal \"hello\"--->";
let
  val helloWorldOutputFile = TextIO.openOut("helloworld.txt")
  val helloworld = TextIO.output(helloWorldOutputFile,"hello world")
  val closeFile = TextIO.closeOut(helloWorldOutputFile)
  val helloWorldInputFile = TextIO.openIn("helloworld.txt")
  val nextWord = inputWord(helloWorldInputFile,"")
in
  if (nextWord = "hello")
    then print "test passed\n"
  else
    print "test failed\n"
end;

(* test cycle *)
print "test_cycle: ";
print "cycle([1,2,3]) should equal [2,3,1]--->";
let
  val test_list = [1,2,3]
  val cycle_test_list = cycle([1,2,3])
  
in
  if (cycle_test_list = [2,3,1])
    then print "test passed\n"
  else
    print "test failes\n"
end;