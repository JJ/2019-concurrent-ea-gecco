#!/usr/bin/env perl6

use v6;

use JSON::Fast;

say "Threads, Generation-Gap, Generations, Time";
for @*ARGS -> $file {
    my $content =  $file.IO.slurp;
    $content ~~ s:g/\} . \{/\},\n\{/;
    my @data = from-json('[' ~ $content ~ ']')<>;
    my %start = @data[0]<msg>;
    my (@ends) = @data.grep( *.<msg><finishing-at> );
    next if ! @ends;
    my %end = @ends[0]<msg>;
    say %start<threads>, ", ", %start<generations>, ", ", (@data.elems - 2)*%start<population-size>*%start<generations>, ", ", DateTime.new(%end<finishing-at>) - DateTime.new(%start<start-at>);
}
