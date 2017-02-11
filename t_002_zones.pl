#!/usr/bin/perl
use strict;
use lib 'lib/perl5';
use NSONE;
use JSON;
use Data::Dumper;

$Data::Dumper::Indent = 1;

my $ns1 = new NSONE;

my $result = $ns1->zones;

foreach my $e (@$result) {
    printf "%s\n", $e->name;
    
    my $zone = $ns1->zone($e->name);

    foreach my $record (@{ $zone->records }) {
        printf "\t%s IN %s\n", 
            $record->domain,
            $record->type;

        foreach my $a (@{ $record->short_answers }) {
            printf "\t\t%s\n", $a;
        }
    }
}

