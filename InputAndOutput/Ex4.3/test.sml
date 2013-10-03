let
  val infile = TextIO.openIn("infile")
  val outfile = TextIO.openOut("outfile")
in
  TextIO.output(outfile, (getIInBaseB("infile","outfile")))
end;

if (convertToBaseB(2,2) = [1,0])
  then print "test1 pass\n"
else
  print "test1 fail\n";

if (convertToBaseB(16,2) = [1,0,0,0,0])
  then print "test2 pass\n"
else
  print "test2 fail\n";

if (convertToBaseB(570,12) = [3,11,6])
  then print "test3 pass\n"
else
  print "test3 fail\n";
