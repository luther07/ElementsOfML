fun loop() = (
  print "Enter month details in the following format: \n\
        \Three character month abbreviation, followed by three character day abbreviation, \n\
        \followed by number of days in the month. \n\
        \For example: \n\
        \Feb Mon 28\n";

  let
    val date_key = TextIO.inputLine(TextIO.stdIn)
  in
    if isSome(date_key)
      then (print (generateCalendar(valOf(date_key))); loop())
    else
      ()
  end
  handle Invalid => (print "Error, try again!\n"; loop())
);

loop();
