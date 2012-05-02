#!/usr/bin/perl
use strict;
use warnings;

while (<>) {
    print "%$_";
    last if $_ =~ /^\s*\\begin{document}/;
}
while (<>) {
    if ($_ =~ /^\s*\\end{document}/) {
        print "%$_"; last;
    }
    else {
        print;
    }
}
while (<>) {
    print "%$_";
}

