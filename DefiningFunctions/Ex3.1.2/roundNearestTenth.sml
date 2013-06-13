fun roundNearestTenth(a:real)=
  let val
    intermed:real=real(round(a*10.0))
  in
    intermed/10.0
  end;