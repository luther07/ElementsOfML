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
      generateMonthHeader(month) ^ daysHeader ^ generateAllDays(day,numberOfDays)
    end
  
  and parseKey(dateKey: string) = 
    let
      val month = implode(map (fn ch => Char.toLower(ch)) (explode(String.substring(dateKey, 0, 3))))
      val day = implode(map (fn ch => Char.toLower(ch)) (explode(String.substring(dateKey, 4, 3))))
      val asciiCodeForZero = 48
      val firstDayDigit = ord(String.sub(dateKey,8)) - asciiCodeForZero
      val secondDayDigit = ord(String.sub(dateKey,9)) - asciiCodeForZero
      val numberOfDays = 10 * firstDayDigit + secondDayDigit

    in
      if (numberOfDays < 28 orelse numberOfDays > 31 orelse
         (firstDayDigit <> 2 andalso firstDayDigit <> 3) orelse
         (secondDayDigit <> 8 andalso secondDayDigit <> 9 andalso
          secondDayDigit <> 0 andalso secondDayDigit <> 1))
        then raise InvalidMonthSize(numberOfDays)
      else
        (month,day,numberOfDays)
    end

  and generateMonthHeader(month: string) =
          case month of
              "jan" => "January"
             |"feb" => "February"
             |"mar" => "March"
             |"apr" => "April"
             |"may" => "May"
             |"jun" => "June"
             |"jul" => "July"
             |"aug" => "August"
             |"sep" => "September"
             |"oct" => "October"
             |"nov" => "November"
             |"dec" => "December"
             | _    => raise InvalidMonth(month)
  
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
