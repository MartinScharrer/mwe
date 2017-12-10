#!/usr/bin/perl
use strict;
use warnings;

my $name = pop @ARGV;


print "%    \\begin{macrocode}\n";
print "%</$name>\n";
print "%<*$name\&standalone>\n";

while (<>) {
    print "$_";
    last if $_ =~ /^\s*\\begin{document}/;
}

print "%</$name\&standalone>\n";
print "%<*$name>\n";

while (<>) {
    if ($_ =~ /^\s*\\end{document}/) {
        print "%</$name>\n";
        print "%<*$name\&standalone>\n";
        print "$_"; last;
    }
    else {
        print;
    }
}

while (<>) {
    print "%$_";
}

print "%</$name\&standalone>\n";
print "%<*$name>\n";
print "%    \\end{macrocode}\n";


