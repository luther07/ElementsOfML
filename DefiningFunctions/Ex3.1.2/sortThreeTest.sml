fun sortThree(a:int,b,c)=
  if a<b
    then if b<c
      then (a,b,c)
      else if a<c
        then (a,c,b)
        else (c,a,b)
    else if c>a
      then (b,a,c)
      else if b<c
        then (b,c,a)
        else (c,b,a);

fun hiprint(x:int,y:int,z:int)=
  (print("s:" ^ Int.toString(x) ^ "\n");print("m:" ^ Int.toString(y) ^ "\n");print("l:" ^ Int.toString(z) ^ "\n"));

hiprint(sortThree(1000,100,10));