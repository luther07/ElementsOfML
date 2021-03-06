structure DefiningFunctions : DEFININGFUNCTIONS =
  struct

  fun cube_real(x:real)=
    x*x*x;

  fun inputWord(wordFile: TextIO.instream, word: string) =
    let
      val nextChar = TextIO.lookahead(wordFile)
    in
      if isSome(nextChar)
        then
          if (valOf(nextChar) = #"\n" orelse valOf(nextChar) = #"\t" orelse valOf(nextChar) = #" ")
            then (TextIO.input1(wordFile);word)
          else
            if TextIO.endOfStream(wordFile)
              then word
            else
              inputWord(wordFile,(word ^ str(valOf(TextIO.input1(wordFile)))))
      else
        word 
    end;
  
  fun cycle(nil)=nil
     |cycle(x::xs)=xs @ [x];
  
  fun smallest(a:int,b:int,c:int)=
    if (a<b)
      then if (a<c)
        then a
        else c
      else if (b<c)
        then b
        else c;
  
  fun reverse_tuple(a,b,c)=
    (c,b,a);

  (* function which returns the 3rd character in a string *)
  fun thirdchar(a_string)=
    hd(tl(tl(explode(a_string))));

  (* function which returns the 3rd element of a list *)
  fun third(some_list)=
    hd(tl(tl(some_list)));
  
end
  
