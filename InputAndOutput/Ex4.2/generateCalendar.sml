fun generateCalendar(dateKey: string) =
  let
    val (month,day,numberOfDays) = parseKey(dateKey)    
  in
    (month,day,numberOfDays)
  end

and parseKey(dateKey: string) = 
  let
    val month = implode(String.sub(dateKey,0) ::
                        String.sub(dateKey,1) ::
                        String.sub(dateKey,2) ::
                        nil)
    val day = implode(String.sub(dateKey,4) ::
                      String.sub(dateKey,5) ::
                      String.sub(dateKey,6) ::
                      nil)
    val numberOfDays = implode(String.sub(dateKey,8) ::
                         String.sub(dateKey,9) ::
                         nil)
  in
    (month,day,numberOfDays)
  end;

(*and generateHeader(month: string) =
  generateMonthHeader(month: string) ^ "\n" ^ generateDayHeader;

and generateMonthHeader(month: string) = "\t\t\t" ^
  (if month = "Jan" then "January"
  else if month = "Feb" then "February"
  else if month = "Mar" then "March"
  else if month = "Apr" then "April"
  else if month = "May" then "May"
  else if month = "Jun" then "June"
  else if month = "Jul" then "July"
  else if month = "Aug" then "August"
  else if month = "Sep" then "September"
  else if month = "Oct" then "October"
  else if month = "Nov" then "November"
  else if month = "Dec" then "December");*)

generateCalendar("Sep Sun 30");