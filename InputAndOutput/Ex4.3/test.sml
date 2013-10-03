let
  val outfile = TextIO.openOut("outfile")
in
  (print "convert i to base b\n";TextIO.output(outfile, getIInBaseB("infile","outfile"));print "\n")
end;
