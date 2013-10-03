signature BASECONVERTER =
  sig
    val getIInBaseB : string*string -> string
    val convertToBaseB : int*int -> int list
  end;
