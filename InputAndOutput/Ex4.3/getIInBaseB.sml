structure ConvertBase : BASECONVERTER =
  struct

  fun getIInBaseB(infile: TextIO.instream) =
    convertToBaseB(getInput(infile));

  and convertToBaseB(input: int, base: int) =
    convertToBaseBHelper(input, base, nil);

  and convertToBaseBhelper(input: int, base: int, numbers: int list) =
    nil;

  and getInput(infile: TextIO.instream) =
    nil;
end
