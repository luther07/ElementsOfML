fun printWords(nil) = ()
   |printWords(word::words) = (print(word ^ "\n");printWords(words));

let 
  val files = CommandLine.arguments()
in
  (map (fn words => printWords(words)) (map (fn file => convertFileToWords(file)) files);
  OS.Process.exit OS.Process.success : unit)
end;
