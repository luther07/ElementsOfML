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
      val month = implode(map (fn ch => Char.toLower(ch)) (explode(String.substring(dateKey, 0, 3))))
      val day = implode(map (fn ch => Char.toLower(ch)) (explode(String.substring(dateKey, 4, 3))))
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
      else if month = "mar" then "March"
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
      if day = "sun" then (allDaysHelper("sun",numberOfDays,1))
      else if day = "mon" then "\t" ^ (allDaysHelper("mon",numberOfDays,1))
      else if day = "tue" then "\t\t" ^ (allDaysHelper("tue",numberOfDays,1))
      else if day = "wed" then "\t\t\t" ^ (allDaysHelper("wed",numberOfDays,1))
      else if day = "thu" then "\t\t\t\t" ^ (allDaysHelper("thu",numberOfDays,1))
      else if day = "fri" then "\t\t\t\t\t" ^ (allDaysHelper("fri",numberOfDays,1))
      else if day = "sat" then "\t\t\t\t\t\t" ^ (allDaysHelper("sat",numberOfDays,1))
      else raise InvalidDay(day)

  and allDaysHelper(day: string, numberOfDays: int, currentNumber: int) =
    if numberOfDays >= currentNumber then
      if day = "sun" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("mon",numberOfDays,currentNumber+1)))
      else if day = "mon" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("tue",numberOfDays,currentNumber+1)))
      else if day = "tue" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("wed",numberOfDays,currentNumber+1)))
      else if day = "wed" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("thu",numberOfDays,currentNumber+1)))
      else if day = "thu" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("fri",numberOfDays,currentNumber+1)))
      else if day = "fri" then (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper("sat",numberOfDays,currentNumber+1)))
      else if day = "sat" then (formatNumber(currentNumber) ^ "\n" ^ (allDaysHelper("sun",numberOfDays,currentNumber+1)))
      else "-1000000ERROR"
    else if (day <> "sun") then "\n" else ""
  
  and formatNumber(number: int) =
    if number > 9 then Int.toString(number)
    else " " ^ Int.toString(number);
end
