let
  val outfile = TextIO.openOut("outfile")
in
  TextIO.output(outfile, getIInBaseB("infile","outfile"))
end;
