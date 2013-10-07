## Exercise 4.3.2:
Write a function to read integers i and b separated by a single nondigit
and print the representation of i in base b. If b > 10, then represent digits
ten and above by their decimal representation surrounded by parentheses. For
example, 570 in base 12 is 3(11)6; that is 570 = 144 X 3 + 12 X 11 + 6. You
should read from an instream infile and write to an outstream outfile.

## Properties of my solution
Can handle big integers as inputs. No integer overflow errors.
The code itself can use any input or output stream.
For my test loop, the program reads from STDIN and writes to STDOUT.