let
  val infile = TextIO.stdIn
  val outfile = TextIO.stdOut
in
  (
    print "Enter number and the base, separated by a space, and hit enter:\n";
    TextIO.output(outfile, ("The answer is:\n" ^ (getIInBaseB(infile)) ^ "\n"))
    
  )
end;
