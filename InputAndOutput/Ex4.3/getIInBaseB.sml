structure ConvertBase : BASECONVERTER =
  struct

  fun getIInBaseB(inputStream: TextIO.instream):string =
    convertToString(convertToBaseB(getInputs(inputStream)))

  and convertToBaseB(input: int, base: int):int list =
    convertToBaseBHelper(input, base, nil)

  and convertToBaseBHelper(input: int, base: int, numbers: int list) =
    let
      val whole = input div base
      val part = input mod base
    in
      if (whole = 0) then part::numbers
      else convertToBaseBHelper(whole,base,(part::numbers))
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
        then getNextInput(infile, (
          (ord(valOf(TextIO.input1(infile)))-48::numberList))
        )
      else
        (TextIO.input1(infile);numberList)
    end 

  and convertToString(result: int list) =
    convertToStringHelper(result,"")

  and convertToStringHelper(nil,intermediateResult: string) = intermediateResult
     |convertToStringHelper(hd::tl,intermediateResult: string) =
        if hd <= 9 then convertToStringHelper(tl,(intermediateResult ^ (Int.toString(hd))))
        else convertToStringHelper(tl,(intermediateResult ^ "(" ^ (Int.toString(hd)) ^ ")"))
     
  and listToInt(numbers: int list) =
    listToIntHelper(numbers,1,0)

  and listToIntHelper(nil,_,intermediateResult: int) =
        intermediateResult
     |listToIntHelper(hd::tl: int list, start: int,intermediateResult: int) =
        (listToIntHelper(tl, (start*10),intermediateResult + hd*start))
end
