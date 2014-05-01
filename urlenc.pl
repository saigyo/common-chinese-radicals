#!/usr/bin/perl -w
# -*- coding: utf-8; mode: cperl; -*-
#  URL encoding: convert chars over U+0080 to format %hex.
#  Usage: urlenc [ -l ] < stdin (url text)
use strict;
use utf8;
use Getopt::Std;    # command line processing
use File::Basename; # get file basename
  
# command line
my %opts = ('l' => 0);
Getopt::Std::getopts('l', \%opts) ||
    die "Usage: " . basename($0) .
    " [ -l ] \< (stdin)\n  -l: insert \\ before % for LaTeX\n";
my $sfx = "%"; $sfx = "\\" . $sfx if ($opts{'l'});
  
# hex format
while (<STDIN>) {
    utf8::decode($_);
    my $enc = "";
    foreach my $chr (split(//, $_)) {
        if ($chr ge "\x{0080}") {
            utf8::encode($chr);
            foreach my $bchr (split(//, $chr)) {
                $enc .= $sfx . sprintf("%x", ord($bchr));
            }
        } else {
            $enc .= $chr;
        }
    }
    print $enc;
}
