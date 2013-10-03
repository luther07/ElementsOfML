structure ConvertBase : BASECONVERTER =
  struct

  fun getIInBaseB(inputFileName: string, outputFileName: string) =
    let
      val infile = TextIO.openIn(inputFileName)
      val outfile = TextIO.openOut(outputFileName)
    in
      convertToString(convertToBaseB(getInputs(infile)))
    end

  and convertToBaseB(input: int, base: int) =
    convertToBaseBHelper(input, base, nil)

  and convertToBaseBHelper(input: int, base: int, numbers: int list) =
    let
      val whole = input div base
      val part = input mod base
    in
      if (whole <> 0)
        then part::numbers
      else
        (print (Int.toString(whole));print(Int.toString(part));convertToBaseBHelper(whole,base,(part::numbers)))
    end

  and getInputs(infile: TextIO.instream) =
    let
      val firstInput = listToInt(getNextInput(infile,nil))
      val secondInput = listToInt(getNextInput(infile,nil))
    in
      (firstInput,secondInput)
    end

  and getNextInput(infile: TextIO.instream, numberList: int list) =
    let
      val look_char = TextIO.lookahead(infile)
    in
      if (isSome(look_char) andalso Char.isDigit(valOf(look_char)))
        then getNextInput(infile, ((ord(valOf(TextIO.input1(infile)))-50::numberList)))
      else
        (TextIO.input1(infile);numberList)
    end 

  and convertToString(nil) = ""
     |convertToString(hd::tl) = 
    if hd <= 9
      then Int.toString(hd) ^ convertToString(tl)
    else
      "(" ^ Int.toString(hd) ^ convertToString(tl) ^ ")"
     
  and listToInt(numbers: int list) =
    listToIntHelper(numbers,1)

  and listToIntHelper(nil,_) =
        0
     |listToIntHelper(hd::tl: int list, start: int) =
        hd * start + (listToIntHelper(tl, (start*10)))
    
end
