structure DefiningFunctions2 : DEFININGFUNCTIONS2 =
  struct

  fun deletetwo(nil)=nil
     |deletetwo(x::xs)=
    x::tl(xs);

fun roundNearestTenth(a:real)=
    let val
      intermed:real=real(round(a*10.0))
    in
      intermed/10.0
    end;

  (* Given three integers, produce a pair consisting
     fo the smallest and largest integers *)
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

  fun roundNearestTenth(a:real)=
    let val
      intermed:real=real(round(a*10.0))
    in
      intermed/10.0
    end;
end
