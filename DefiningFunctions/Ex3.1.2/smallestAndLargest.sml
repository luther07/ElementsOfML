(* Example function which returns the smallest
   and largest integers from a list *)

fun smallestAndLargest(a:int,b,c)=
  if a<b
    then if b<c
      then (a,c)
      else if a>c
        then (c,b)
        else (a,b)
    else if b>c
      then (c,a)
      else if a>c
        then (c,b)
        else (a,b);