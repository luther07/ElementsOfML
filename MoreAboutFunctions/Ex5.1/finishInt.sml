(* Exercise 5.1.1 Rewrite the functions finishInt and finishInt1 from Fig
 * 4.10 to use a single function with a case statement. *)
open TextIO;

val END = ~1;

fun finishInt(i,file) = 
  if i = END then END
  else case input1(file) of
    NONE => i
   |SOME c => if Char.isDigit(c) 
                then finishInt(10*i+ord(c)-ord(#"0"),file)
              else i;
  
