(* Compute the largest element of a list of reals.
   Does not handle empty lists. *)
fun largest(l: real list) =
  if null(tl(l))
    then hd(l)
  else
    if hd(l) >= hd(tl(l)) andalso hd(tl(l)) <= hd(l)
      then largest(hd(l)::tl(tl(l)))
    else
      largest(tl(l));

