signature BASECONVERTER =
  sig
    val getIInBaseB : TextIO.instream -> string
    val convertToBaseB : int*int -> int list
  end;
