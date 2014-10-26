README
How to use interactively with sml-nj:
# Start sml-nj REPL
>sml
# Load the signatures
-use "generatecalendar-sigs.sml";
# Load the definitions for the GenerateCalendar structure
-use "generateCalendar.sml";
# Open the GenerateCalendar structure for easy access
-open GenerateCalendar;
# Example useage
-print(generateCalendar "Feb Mon 28");