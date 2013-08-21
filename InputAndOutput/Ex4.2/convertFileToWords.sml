fun convertFileToWords(filePath: string) =
  (* calls getWords and getFile *)
  (* string -> string list *)
  getWords((getFile(filePath)),[])

and getFile(filePath: string) =
  (* string -> TextIO.instream *)
  TextIO.openIn(filePath)

and getWords(wordFile: TextIO.instream, words: string list) =
  (* calls getNextWord *)
  (* TextIO.instream*string list -> string list *)
  let
    val isEnd = TextIO.endOfStream(wordFile)
  in
    if isEnd
      then words
    else
      getWords(wordFile, (getNextWord(wordFile)::words))
  end


and getNextWord(wordFile: TextIO.instream) =
  (* calls removeEmptyWord and inputWord *)
  (* TextIO.instream -> string *)
  (* Must add to the if expression, handling not isSome *)
  let
    (* you can't get the valOf, if there's no val *)
    val peek = valOf(TextIO.lookahead(wordFile))
  in
    if (peek = #"\n" orelse peek = #"\t" orelse peek = #"t")
      then removeEmptyWord(wordFile)
    else
      inputWord(wordFile,"")
  end

and inputWord(wordFile: TextIO.instream, word: string) =
  (* recursively calls itself *)
  (* tested tested tested tested tested *)
  (* TextIO.instream*string -> string *)
  (* Must add to the if expression, handling not isSome *)
  let
    (* you can't get the valOf, if there's no val *)
    val peekOption = TextIO.lookahead(wordFile)
  in
    if isSome(peekOption)
      then
        if (valOf(peekOption) = #"\n" orelse valOf(peekOption) = #"\t" orelse valOf(peekOption) = #"\n")
          then (TextIO.input1(wordFile);word)
        else
          if TextIO.endOfStream(wordFile)
            then word
          else
            inputWord(wordFile,(word ^ str(valOf(TextIO.input1(wordFile)))))
    else
      word
  end

and removeEmptyWord(wordFile: TextIO.instream) =
  (* TextIO.instream -> string *)
  let
    (* you can't get the valOf if there's no val *)
  (* Must add to the if expression, handling not isSome *)
    val peekOption = TextIO.lookahead(wordFile)
  in
    if isSome(peekOption)
      then
        if (valOf(peekOption) = #"\n" orelse valOf(peekOption) = #"\t" orelse valOf(peekOption) = #" ")
          then (TextIO.input1(wordFile); removeEmptyWord(wordFile))
        else
          if TextIO.endOfStream(wordFile)
            then ""
          else
            ""
    else
      ""
  end