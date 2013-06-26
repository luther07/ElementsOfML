fun deletetwo(nil)=nil
   |deletetwo(x::xs)=
  x::tl(xs);

fun print_answers(nil)=()
   |print_answers(x::nil)=
      (print(Int.toString(x));print("\n"))
   |print_answers(x::xs)=
      (print(Int.toString(x));print(",");print_answers(xs));

print_answers(deletetwo([1,2,3,4,5,6,7,8]));