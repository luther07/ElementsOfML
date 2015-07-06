README
## How to use interactively with sml-nj:
# Start sml-nj REPL
>sml
# Load the signatures
-use "convertfile-sigs.sml";
# Load the definitions for the GenerateCalendar structure
-use "convertFileToWords.sml";
# Open the GenerateCalendar structure for easy access
-open ConvertFile;
# Now enter function calls, example useage
-print(convertFileToWords "path/to/file");
