structure ConvertFile : FILECONVERTER =
  struct

  fun makeCharacterList(infile, NONE) = nil
      |makeCharacterList(infile, SOME char) = char :: (makeCharacterList(infile, TextIO.input1(infile)))

  and convertFileToWords(filePath: string) : string list =
    (* calls getFile, makeCharacterList and getWords *)
    let
      val infile = getFile(filePath)
      val characters = map str (makeCharacterList(infile, TextIO.input1(infile)))
    in
      getWords(characters)
    end

  and getFile(filePath: string) : TextIO.instream =
    TextIO.openIn(filePath)

(* help *)
  and getWords(characters) = getWordsHelper(characters, "", [])

  (* and getWordsHelper(a, b, c) = ["and"]; *)

  and getWordsHelper(nil, word, words) = words
     |getWordsHelper(letter::letters, word, words) = if letter = " " then 
                                                       getWordsHelper(letters, "", words@[word])
                                                     else
                                                       getWordsHelper(letters, word ^ letter, words)
  end
