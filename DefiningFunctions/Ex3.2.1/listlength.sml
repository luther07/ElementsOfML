(* compute the length of a list *)
fun listlength(l) =
  if l = nil
    then 0
  else
    1 + listlength(tl(l));
