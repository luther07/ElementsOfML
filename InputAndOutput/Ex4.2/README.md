## Exercise 4.2.4:
Read a file of characters, treating it as a sequence of words,
which are sequences of consecutive non-white-space characters.
Each word is followed by either a single white space character
or the end-of-file, so two or more consecutive whate spaces
indicate there is an empty word between them. Return a list of
the words in the file.

## Exercise 4.2.5:
Design the following calendar-printing function. Take as input a month, 
the day of the first of that month, and the number of days in the month.
Months and days are abbreviated by their first three letters. The month,
day, and number of days are each separated by a single white-space
character. For example, a request to print the calendar for a September
in which the first of the month is on a Thursday would be: Sep Thu 30

Print the calendar as:

1.  A row with the month (full name) indented by three tabs.
2.  A blank row.
3.  A row with the names of the days (three-letter abbreviations separated by tabs.
4.  As many rows as necessary, with the days printed in the proper columns.