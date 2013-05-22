(* Example function to split a list into two lists,
   each list taking alternating items from the
   original list *)

fun split(nil)=
    (nil,nil)
  |split(a::nil)=
    ([a],nil)
  |split(a::b::cs)=
    let 
      val (m,n)=split(cs)
    in
      (a::m,b::n)
    end;