val x = convertFileToWords("file.txt");

val y = hd x;

print y;

fun printWords(nil) = ()
   |printWords(word::nil) = print(word ^ "\n")
   |printWords(word::words) = (print(word ^ "\n");printWords(words));

printWords(convertFileToWords("new.file"));
