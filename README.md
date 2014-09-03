lswhois.pl - Featurs Branch
==========

Whois Accepts List Input - Additional Features Branch

Usage:

Currently the usage is to have an input file that you must manually create and name it input.txt.

Copy paste your list of domain names that you wish to test into the input.txt file separated by new lines for each domain.

Then run the program:

perl lswhois.pl

When the program finishes you will be able to view the output.txt file

cat output.txt

Also, if there is an output.txt file in the current working directory of the script at runtime it will be overwritten
by the script.

Also, this script only works on *nix at the moment as it does system calls to the whois utility as well as touch.

