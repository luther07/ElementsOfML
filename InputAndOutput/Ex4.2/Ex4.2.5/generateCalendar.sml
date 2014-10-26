structure GenerateCalendar : GENERATECALENDAR = 
  struct

  exception InvalidMonthSize of int
  exception InvalidMonth of string
  exception InvalidDay of string

  fun generateCalendar(dateKey: string) =
    let
      val (month,startingDay,numberOfDays) = parseKey(dateKey)
      val daysHeader = "Sun\tMon\tTue\tWed\tThu\tFri\tSat\n"
    in
      monthHeader(month) ^ daysHeader ^ generateAllDays(startingDay,numberOfDays)
    end
  
  and parseKey(dateKey: string) = 
    let
      val month = implode(map (fn ch => Char.toLower(ch)) (explode(String.substring(dateKey, 0, 3))))
      val startingDay = implode(map (fn ch => Char.toLower(ch)) (explode(String.substring(dateKey, 4, 3))))
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
        (month,startingDay,numberOfDays)
    end

  and monthHeader(month: string) =
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
  
  and generateAllDays(startingDay: string, numberOfDays: int) =
          case startingDay of
              "sun" => (allDaysHelper(startingDay, numberOfDays,1))
             |"mon" => "\t" ^ (allDaysHelper(startingDay, numberOfDays,1))
             |"tue" => "\t\t" ^ (allDaysHelper(startingDay, numberOfDays,1))
             |"wed" => "\t\t\t" ^ (allDaysHelper(startingDay, numberOfDays,1))
             |"thu" => "\t\t\t\t" ^ (allDaysHelper(startingDay, numberOfDays,1))
             |"fri" => "\t\t\t\t\t" ^ (allDaysHelper(startingDay, numberOfDays,1))
             |"sat" => "\t\t\t\t\t\t" ^ (allDaysHelper(startingDay, numberOfDays,1))
             | _    => raise InvalidDay(startingDay)

  and allDaysHelper(day: string, numberOfDays: int, currentNumber: int) =
    if numberOfDays >= currentNumber then case day of
              "sun" => (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             |"mon" => (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             |"tue" => (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             |"wed" => (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             |"thu" => (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             |"fri" => (formatNumber(currentNumber) ^ "\t" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             |"sat" => (formatNumber(currentNumber) ^ "\n" ^ (allDaysHelper(nextDay(day),numberOfDays,currentNumber+1)))
             | _    => raise InvalidDay(day)
    else if (day <> "sun") then "\n" else ""

  and nextDay(day: string) =
          case day of
              "sun" => "mon"
             |"mon" => "tue"
             |"tue" => "wed"
             |"wed" => "thu"
             |"thu" => "fri"
             |"fri" => "sat"
             |"sat" => "sun"
             | _    => raise InvalidDay(day)
  
  and formatNumber(number: int) =
    if number > 9 then Int.toString(number)
    else " " ^ Int.toString(number);
end
