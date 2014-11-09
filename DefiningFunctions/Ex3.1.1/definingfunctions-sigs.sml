signature DEFININGFUNCTIONS =
  sig
    val cube_real : real -> real
    val inputWord : TextIO.instream*string -> string
    val cycle : 'a list -> 'a list
    val smallest : int*int*int -> int
    val reverse_tuple : 'a * 'a * 'a -> 'a * 'a * 'a
    val thirdchar : string -> char
    val third : 'a list -> 'a
  end;
