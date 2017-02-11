#!/usr/bin/perl
use strict;
use lib 'lib/perl5';
use NSONE;
use JSON;
use Data::Dumper;

$Data::Dumper::Indent = 1;

my $ns1 = new NSONE;

my $r = $ns1->test({
    method  => 'GET',
    url     => 'https://api.nsone.net/v1/networks',
});

if ($r->is_success) {
    my $result = decode_json($r->decoded_content);

    foreach my $e (@$result) {
        print "$e->{name}\n";
    }
}

