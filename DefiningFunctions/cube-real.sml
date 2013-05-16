(* Function to cube a real number x. *)
open Real;

fun cube_real(x:real)=
  x*x*x;

val x=3.0;

print ("The cube of " ^ toString(x) ^ " is " ^ (toString(cube_real(3.0)) ^ ".\n"));
