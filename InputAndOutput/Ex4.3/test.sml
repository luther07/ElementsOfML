let
  val infile = TextIO.openIn("infile")
  val outfile = TextIO.openOut("outfile")
in
  TextIO.output(TextIO.stdOut, (getIInBaseB("infile","outfile")))
end;
