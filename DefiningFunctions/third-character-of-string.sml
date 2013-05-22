(* Exercise 3.1.1e
   Function to return the third character of a string *)

fun thirdchar(l)=
  hd(tl(tl(l)));