(* A function that generates a printable calendar *)

fun generateCalendar(dateKey: string) =
  let
    val (month,day,numberOfDays) = parseKey(dateKey)
    val daysHeader = "Sun\tMon\tTue\tWed\tThu\tFri\tSat\n"
  in
    generateHeader(month) ^ daysHeader ^ generateAllDays(day,numberOfDays)
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
    val asciiCodeForZero = 48
    val numberOfDays = (10 * (ord(String.sub(dateKey,8))-asciiCodeForZero)) +
                       (ord(String.sub(dateKey,9))-asciiCodeForZero)
  in
    (month,day,numberOfDays)
  end

and generateHeader(month: string) =
  generateMonthHeader(month: string)

and generateMonthHeader(month: string) =
  "\t\t\t" ^
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
  else if month = "Dec" then "December"
  else "-1000000ERROR") ^ "\n"

and generateAllDays(day: string, numberOfDays: int) =
  allDaysHelper(day,numberOfDays,1)

and allDaysHelper(day: string, numberOfDays: int, currentNumber: int) =
  if numberOfDays >= currentNumber then
    if day = "Sun" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("Mon",numberOfDays,currentNumber+1)))
    else if day = "Mon" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("Tue",numberOfDays,currentNumber+1)))
    else if day = "Tue" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("Wed",numberOfDays,currentNumber+1)))
    else if day = "Wed" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("Thu",numberOfDays,currentNumber+1)))
    else if day = "Thu" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("Fri",numberOfDays,currentNumber+1)))
    else if day = "Fri" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("Sat",numberOfDays,currentNumber+1)))
    else if day = "Sat" then (formatNumber(currentNumber) ^ "\n" ^ (allDaysHelper("Sun",numberOfDays,currentNumber+1)))
    else "-1000000ERROR"
  else if (day <> "Sun") then "\n" else ""

and formatNumber(number: int) =
  if number > 9 then Int.toString(number)
  else " " ^ Int.toString(number);