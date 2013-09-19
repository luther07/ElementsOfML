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
print "inputWord(empty_file) should equal \"\"--->";
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
print "inputWord(hello_world) should equal \"hello\"--->";
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

(* test smallest *)
print "test_smallest: ";
print "smallest(0,9,8) should equal 0--->";
let
  val tuple = (0,9,8)
  val smallest_item = smallest(tuple)
in
  if (smallest_item = 0)
    then print "test passed\n"
  else
    print "test failed\n"
end;

(* test reverse_tuple *)
print "test_reverse_tuple: ";
print "reverse_tuple(1,2,3) should equal (3,2,1)--->";
let
  val tuple = (1,2,3)
  val reverse_123 = reverse_tuple(tuple)
in
  if (reverse_123 = (3,2,1))
    then print "test passed\n"
  else
    print "test failed\n"
end;

(* test thirdchar *)
print "test_thirdchar";
print "thirdchar([\"#a\",\"#b\",#\"c\"]) should equal \"#c\"--->";
let
  val character_list = [#"a",#"b",#"c"]
  val third_from_list = thirdchar(character_list)
in
  if (third_from_list = #"c")
    then print "test passed\n"
  else
    print "test failed\n"
end;