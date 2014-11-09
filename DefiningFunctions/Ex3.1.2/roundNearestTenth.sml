fun roundNearestTenth(a:real)=
  let
    val intermediate = a * 10.0 + 0.5
  in
    (real(floor intermediate))/10.0
  end;
