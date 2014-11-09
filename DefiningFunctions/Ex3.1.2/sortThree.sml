fun sortThree(a:int,b,c)=
  if a<b
    then if b<c
      then [a,b,c]
      else if a<c
        then [a,c,b]
        else [c,a,b]
    else if c>a
      then [b,a,c]
      else if b<c
        then [b,c,a]
        else [c,b,a];
