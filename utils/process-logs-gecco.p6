#!/usr/bin/env perl6

use v6;

use JSON::Fast;

say "Threads, Generation-Gap, Evaluations, Time";
for @*ARGS -> $file {
    say $file;
    my $content =  $file.IO.slurp;
    $content ~~ s:g/\} . \{/\},\n\{/;
    my @data = from-json('[' ~ $content ~ ']')<>;
    next if @data[0]<msg>:!exists;
    my %start = @data[0]<msg>;
    my (@ends) = @data.grep( *.<msg><finishing-at> );
    next if ! @ends;
    my %end = @ends[0]<msg>;
    say %start<threads>, ", ", %start<generations>, ", ", (@data.elems - 2)*%start<population-size>*%start<generations>, ", ", DateTime.new(%end<finishing-at>) - DateTime.new(%start<start-at>);
}
