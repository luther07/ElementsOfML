(* Function to compute the smallest from int*int*int *)

fun smallest(a:int,b:int,c:int)=
  if (a<b)
    then if (a<c)
      then a
      else if (c<b)
        then c
        else b
    else if (b<c)
      then b
      else if (c<b)
          then c
          else b;
