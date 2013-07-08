(* Assume n >= 0, because you can't print a negative quantity of xs *)
fun print_xs_logn(0)=(print("x");print("\n"))
   |print_xs_logn(n)=
     let 
       val xs=compute_xs(n div 2,n mod 2,"x")
     in
       (print(xs);print("\n"))
     end

and compute_xs(0,1,xs:string)=xs ^ xs
   |compute_xs(1,0,xs)=xs ^ xs ^ xs ^ xs
   |compute_xs(1,1,xs)=
      let
        val intermed = xs ^ xs ^ xs ^ xs
      in
        intermed ^ intermed
      end
   |compute_xs(cube,0,xs)=compute_xs(cube div 2,cube mod 2, xs ^ xs ^ xs ^ xs)
   |compute_xs(cube,square,xs)=
      let 
        val intermed = xs ^ xs ^ xs ^ xs
      in
        compute_xs(cube div 2,cube mod 2,intermed ^ intermed)
      end;

print_xs_logn(0);
print_xs_logn(1);
print_xs_logn(2);
print_xs_logn(3);
print_xs_logn(4);
print_xs_logn(5);