#!/usr/bin/env perl6

use v6;

use JSON::Fast;

say "Population size, Found, Rate ";
for @*ARGS -> $file {
    my $total;
    my $content =  $file.IO.slurp;
    $content ~~ s:g/\} . \{/\},\n\{/;
    my @data = from-json('[' ~ $content ~ ']')<>;
    my $population-size = @data[0]<msg><population-size>;
    my @final = @data.grep(  *<msg><finishing-at>  );
    my $found = @final.grep( ? *<msg><found> ).elems;
    say "$population-size, $found, ", $found/@final.elems;
    
}
