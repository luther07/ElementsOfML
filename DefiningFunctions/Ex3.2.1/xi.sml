(* Compute x ^ i, where x is a real and i is a nonnegative integer *)
fun xi(x:real,i) =
  if i = 0
    then 1.0
  else
    x * xi(x,i - 1);
