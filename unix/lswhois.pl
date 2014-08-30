#!/usr/bin/perl -w
use warnings;
use strict;
use diagnostics;
use FileHandle;

my $inputfile  = FileHandle->new;
my $outputfile = FileHandle->new;
my @hosts;

open($inputfile, "<", "input.txt")
        or die "cannot open < input.txt: $!";
        @hosts = <$inputfile>;
close ($inputfile) || warn "close failed: $!";

qx(touch output.txt);

open($outputfile, ">>", "output.txt")
        or die "cannot open > output.txt: $!";

foreach my $hosts (@hosts) {
	print $outputfile $hosts."\n";
        $hosts = qx(whois $hosts);
        print $outputfile $hosts."\n";
}

close ($outputfile) || warn "close failed: $!";

#The Following Section Searches Within the output file for a regular expression
#in this case a string "Name Server:" and then prints to the screen
#my @lines;
#open($outputfile, "<", "output.txt")
#        or die "cannot open < output.txt: $!";
#
#my $regex = "Name Server: ";
#
#@lines = grep { /\Q$regex/ } <$outputfile>;
#
#close ($outputfile) || warn "close failed: $!";
#
#for my $lines (@lines) {
#        print $lines."\n";
#}
