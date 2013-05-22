(* Exercise 3.1.1c
   Compute the  third element of a list *)
fun third(some_list)=
  hd(tl(tl(some_list)));
