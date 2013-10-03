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
    [1]

  and getInputs(infile: TextIO.instream) =
    let
      val firstInput = 1
      val secondInput = 2
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
