let
  val infile = TextIO.openIn("infile")
  val outfile = TextIO.openOut("outfile")
in
  TextIO.output(TextIO.stdOut, (getIInBaseB("infile","outfile")))
end;

if (convertToBaseB(2,2) = [1,0])
  then print "test1 pass"
else
  print "test1 fail";
