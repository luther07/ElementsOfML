structure GenerateCalendar : GENERATECALENDAR = 
  struct

  exception InvalidMonthSize of int
  exception InvalidMonth of string
  exception InvalidDay of string

  fun generateCalendar(dateKey: string) =
    let
      val (month,day,numberOfDays) = parseKey(dateKey)
      val daysHeader = "Sun\tMon\tTue\tWed\tThu\tFri\tSat\n"
    in
      if (numberOfDays < 28 orelse numberOfDays > 31)
        then raise InvalidMonthSize(numberOfDays)
      else
        generateHeader(month) ^ daysHeader ^ generateAllDays(day,numberOfDays)
    end
  
  and parseKey(dateKey: string) = 
    let
      val month = implode(Char.toLower(String.sub(dateKey,0)) ::
                          Char.toLower(String.sub(dateKey,1)) ::
                          Char.toLower(String.sub(dateKey,2)) ::
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
      (if month = "jan" then "January"
      else if month = "feb" then "February"
      else if month = "bar" then "March"
      else if month = "apr" then "April"
      else if month = "may" then "May"
      else if month = "jun" then "June"
      else if month = "jul" then "July"
      else if month = "aug" then "August"
      else if month = "sep" then "September"
      else if month = "oct" then "October"
      else if month = "nov" then "November"
      else if month = "dec" then "December"
      else raise InvalidMonth(month)) ^ "\n"
  
  and generateAllDays(day: string, numberOfDays: int) =
      if day = "Sun" then (allDaysHelper("Sun",numberOfDays,1))
      else if day = "Mon" then "\t" ^ (allDaysHelper("Mon",numberOfDays,1))
      else if day = "Tue" then "\t\t" ^ (allDaysHelper("Tue",numberOfDays,1))
      else if day = "Wed" then "\t\t\t" ^ (allDaysHelper("Wed",numberOfDays,1))
      else if day = "Thu" then "\t\t\t\t" ^ (allDaysHelper("Thu",numberOfDays,1))
      else if day = "Fri" then "\t\t\t\t\t" ^ (allDaysHelper("Fri",numberOfDays,1))
      else if day = "Sat" then "\t\t\t\t\t\t" ^ (allDaysHelper("Sat",numberOfDays,1))
      else raise InvalidDay(day)

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
end
