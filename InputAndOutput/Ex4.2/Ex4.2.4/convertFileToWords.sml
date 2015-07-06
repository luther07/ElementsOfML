structure ConvertFile : FILECONVERTER =
  struct

  fun makeCharacterList(infile, NONE) = nil
      |makeCharacterList(infile, SOME char) = char :: (makeCharacterList(infile, TextIO.input1(infile)))

  and convertFileToWords(filePath: string):string list =
    (* calls getFile, makeCharacterList and getWords *)
    let
      val infile: TextIO.instream = TextIO.openIn(filePath)
      val characters: string list = map str (makeCharacterList(infile, TextIO.input1(infile)))
    in
      getWords(characters)
    end

(* help *)
  and getWords(characters):string list = getWordsHelper(characters, "", [])

  (* and getWordsHelper(a, b, c) = ["and"]; *)

  and getWordsHelper(nil, word, words):string list = words@[word]
     |getWordsHelper(letter::letters, word, words) = if letter = " " then 
                                                       getWordsHelper(letters, "", words@[word])
                                                     else
                                                       getWordsHelper(letters, word ^ letter, words)
  end
