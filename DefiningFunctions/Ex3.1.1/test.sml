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

print "test_inputWord: ";
print "test inputWord with empty file ...";
let
  val emptyOutputFile = TextIO.openOut("empty.txt")
  val closeFile = TextIO.closeOut(emptyOutputFile)
  val emptyInputFile = TextIO.openIn("empty.txt")
  val nextWord = inputWord(emptyInputFile,"")
in
  print "test passed\n"
end;

print "test_inputWord: ";
print "test inputWord with hello world file ...";
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
    (print nextWord;print "test failed\n")
end;