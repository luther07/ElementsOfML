signature BASECONVERTER =
  sig
    val getIInBaseB : TextIO.instream -> string
    val convertToBaseB : LargeInt.int*LargeInt.int -> LargeInt.int list
  end;
