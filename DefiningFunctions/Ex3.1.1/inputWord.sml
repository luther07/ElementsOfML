fun inputWord(wordFile: TextIO.instream, word: string) =
  (* recursively calls itself *)
  let
    val nextChar = valOf(TextIO.lookahead(wordFile))
  in
    if (nextChar = #"\n" orelse nextChar = #"\t" orelse nextChar = #"\n")
      then (TextIO.input1(wordFile);word)
    else
      if TextIO.endOfStream(wordFile)
        then word
      else
        inputWord(wordFile,(word ^ str(valOf(TextIO.input1(wordFile)))))
  end;

let
  val textfile = TextIO.openIn("file.txt")
  val word = inputWord(textfile,"")
in
  (TextIO.print(word);TextIO.print("\n"))
end;