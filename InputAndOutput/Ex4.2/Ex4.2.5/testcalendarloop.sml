fun loop() = (
  print "Please provide month details: MMM DDD XX\n";
  print "For example \"Feb Mon 28\", to print a February which begins on Monday and has 28 days\n";

  let
    val date_key = TextIO.inputLine(TextIO.stdIn)
  in
    if isSome(date_key)
      then (print (generateCalendar(valOf(date_key)));loop())
    else
      ()
  end
  handle Invalid => (print "Error, try again!\n"; loop())
);

loop();
