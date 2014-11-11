(* Given an integer i and a list L, cycle L i times *)
fun cyclei(l,i) =
  if i = 0
    then l
  else
    cyclei(tl(l)@[hd(l)],i-1);
