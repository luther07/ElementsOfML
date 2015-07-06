README
## How to use interactively with sml-nj:
# Start sml-nj REPL
>sml
# Load the signatures
-use "convertfile-sigs.sml";
# Load the definitions for the ConvertFile structure
-use "convertFileToWords.sml";
# Open the ConvertFile structure for easy access
-open ConvertFile;
# Now enter function calls, example useage
-print(convertFileToWords "path/to/file");

## How to run interactively with mlton:
# Compile with mlton's compilation manager
>mlton convertfiletest.mlb
# Execute the binary passing in one or more filenames/paths
>./convertfiletest <file1> <file2> <file3>