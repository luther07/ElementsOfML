structure Polynomials : POLYS =
  struct

(* padd(P,Q) produces the polynomial sum P+Q *)

val rec padd = fn
  (P,nil) => P
 |(nil,Q) => Q
 |((p:real)::ps, q::qs) => (p+q)::padd(ps,qs);

(* smult(P,q) multiplies polynomial P by scalar q *)

val rec smult = fn
  (nil,q) => nil
 |((p:real)::ps,q) => (p*q)::smult(ps,q);

(* pmult(P,Q) produces PQ *)

val rec pmult = fn
  (P,nil) => nil
 |(P,q::qs) => padd(smult(P,q), 0.0::pmult(P,qs));

end
