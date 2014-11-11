(* A function which duplicates each element of a list *)
fun duplicate(l) =
  if l = nil
    then nil
  else
    hd(l)::hd(l)::duplicate(tl(l));
