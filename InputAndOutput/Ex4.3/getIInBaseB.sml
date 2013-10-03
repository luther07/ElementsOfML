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
      if (whole = 0)
        then part::numbers
      else
        convertToBaseBHelper(whole,base,(part::numbers))
    end

  and getInputs(infile: TextIO.instream) =
    let
      val firstInput = listToInt(getNextInput(infile,nil))
      val secondInput = listToInt(getNextInput(infile,nil))
    in
      (firstInput,secondInput)
    end

  and getNextInput(infile: TextIO.instream, numberList: int list) =
    1
    (* let
      val look_char = TextIO.lookahead(infile)
    in
      if (isSome(look_char) *)

  and convertToString(baseList: int list) =
    "1"
end
