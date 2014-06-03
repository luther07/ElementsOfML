fun printWords(nil) = ()
   |printWords(word::nil) = print(word ^ "\n")
   |printWords(word::words) = (print(word ^ "\n");printWords(words));

let 
  val files = CommandLine.arguments()
in
  map (fn word => printWords(word)) (map (fn file => convertFileToWords(file)) files);
  OS.Process.exit OS.Process.success : unit
end;
