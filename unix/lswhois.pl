use warnings;
use strict;
use diagnostics;
use FileHandle;

my $inputfile  = FileHandle->new;
my $outputfile = FileHandle->new;
my @hosts;
my $inputfilepath = "input.txt";

print "Would you like to create an input file? [Y/n] ";
my $decision = <STDIN>;
chomp($decision);

if ($decision ne 'n' && $decision ne 'N') {
	qx(touch input.txt);
	print "input.txt created \n";
	print "Copy and Paste your list ";
	print "separated by new lines ";
	print "into input.txt \n";
	print "Come back when you have ";
	print "something for me \n";
	print "Exiting...\n";
	exit;
}
else {
	print "What is the path of your input file? \n";
	print "For example, /the/path/to/file.txt ";
	$inputfilepath = <STDIN>;
	chomp($inputfilepath);
}
open($inputfile, "<", "input.txt")
        or die "cannot open < input.txt: $!";
        @hosts = <$inputfile>;
close ($inputfile) || warn "close failed: $!";

qx(touch output.txt);
print "output.txt created\n";

open($outputfile, ">>", "output.txt")
        or die "cannot open > output.txt: $!";

foreach my $hosts (@hosts) {
	print $outputfile $hosts."\n";
        $hosts = qx(whois $hosts);
        print $outputfile $hosts."\n";
	sleep (1); #keep whois servers happy
}

close ($outputfile) || warn "close failed: $!";

print "The whois output has been saved to output.txt\n";
print "Exiting...\n";
