(* given an integer i and a list L, cycle L i times *)

fun cyclen(n:int,[]) = []
   |cyclen(0,L) = L
   |cyclen(n,L) = cyclen(n-1,cycleone(L))

and cycleone(nil) = []
   |cycleone(h::t) = t @ [h];

fun printList(nil)=print("\n")
   |printList(x::xs)=(
      print(Int.toString(x));
      print(",");
      printList(xs)
    );

printList(cyclen(1,[1,2,3,4,5]));
printList(cyclen(2,[1,2,3,4,5]));
printList(cyclen(3,[1,2,3,4,5]));
printList(cyclen(4,[1,2,3,4,5]));
printList(cyclen(5,[1,2,3,4,5]));