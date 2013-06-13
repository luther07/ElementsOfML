fun roundNearestTenth(a:real)=
  let val
    intermed:real=real(round(a*10.0))
  in
    intermed/10.0
  end;

print(Real.toString(roundNearestTenth(4.2666)) ^ "\n");