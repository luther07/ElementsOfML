structure ConvertBase : BASECONVERTER =
  struct

  fun getIInBaseB(inputStream: TextIO.instream):string =
    convertToString(convertToBaseB(getInputs(inputStream)))

  and convertToBaseB(input: LargeInt.int, base: LargeInt.int):LargeInt.int list =
    convertToBaseBHelper(input, base, nil)

  and convertToBaseBHelper(input: LargeInt.int, base: LargeInt.int, numbers: LargeInt.int list) =
    let
      val (whole,part) = IntInf.divMod(input,base)
    in
      if (whole = 0) then part::numbers
      else convertToBaseBHelper(whole,base,(part::numbers)) (**)
    end

  and getInputs(infile: TextIO.instream) =
    let
      val firstInput: LargeInt.int = listToInt(getNextInput(infile,nil))
      val secondInput: LargeInt.int = listToInt(getNextInput(infile,nil))
    in
      (firstInput,secondInput)
    end

  and getNextInput(infile: TextIO.instream, numberList: LargeInt.int list) =
    let
      val look_char = TextIO.lookahead(infile)
    in
      if (isSome(look_char) andalso Char.isDigit(valOf(look_char))) 
        then getNextInput(infile, 
        (Int.toLarge(ord(valOf(TextIO.input1(infile)))-48)::numberList))
      else
        (TextIO.input1(infile);numberList)
    end 

  and convertToString(result: LargeInt.int list) =
    convertToStringHelper(result,"")

  and convertToStringHelper(nil,intermediateResult: string) = intermediateResult
     |convertToStringHelper(hd::tl,intermediateResult: string) =
        if hd <= 9 then convertToStringHelper(tl,(intermediateResult ^ (Int.toString(Int.fromLarge(hd)))))
        else convertToStringHelper(tl,(intermediateResult ^ "(" ^ (Int.toString(Int.fromLarge(hd))) ^ ")"))
     
  and listToInt(numbers: LargeInt.int list) =
    listToIntHelper(numbers,1,0)

  and listToIntHelper(nil,_,intermediateResult: LargeInt.int) =
        intermediateResult
     |listToIntHelper(hd::tl: LargeInt.int list, start: LargeInt.int, intermediateResult: LargeInt.int) =
        (listToIntHelper(tl, (start*10),intermediateResult + hd*start))
end
