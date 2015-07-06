README
## How to use interactively with sml-nj:
# Start sml-nj REPL
>sml
# Load the signatures
-use "generatecalendar-sigs.sml";
# Load the definitions for the GenerateCalendar structure
-use "generateCalendar.sml";
# Open the GenerateCalendar structure for easy access
-open GenerateCalendar;
# Now enter function calls, example useage
-print(generateCalendar "Feb Mon 28");
# Or load test loop, which waits for input
-use "testcalendarloop.sml";
# Examples inside the test loop:
Feb Mon 28
Jan Fri 31
Aug Thu 31

## How to run interactively with mlton:
# Compile the mlton's compilation manager
>mlton generateCalendarTest.mlb
# Execute the binary
>./generateCalendarTest
# Enter inputs when prompted
# Example inputs
Feb Mon 28
Jan Fri 31
Sep Thu 30
