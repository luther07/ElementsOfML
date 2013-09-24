val test_file = convertFileToWords("file.txt");

val first_word = hd test_file;

fun printWords(nil) = ()
   |printWords(word::nil) = print(word ^ "\n")
   |printWords(word::words) = (print(word ^ "\n");printWords(words));

printWords(convertFileToWords("file.txt"));
