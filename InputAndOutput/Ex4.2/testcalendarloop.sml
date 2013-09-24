fun loop() = (
  print "Please provide month details: MMM DDD XX\n";

  let
    val my_input = TextIO.stdIn
    (* val date_key = "Jun Sun 30" *)
    val date_key = TextIO.inputLine(TextIO.stdIn)
  in
    if isSome(date_key)
      then (print (generateCalendar(valOf(date_key)));loop())
    else
      ()
  end
);

loop();