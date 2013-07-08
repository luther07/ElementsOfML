(* given an integer i and a list L, cycle L i times *)

fun cycleNTimes(n:int,[]) = []
   |cycleNTimes(0,L) = L
   |cycleNTimes(n,L) = cycleNTimes(n-1,cycleOneTime(L))

and cycleOneTime(nil) = []
   |cycleOneTime(h::t) = t @ [h];