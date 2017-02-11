# NSONE REST API for Perl

This is a perl wrapper around NSOne's Rest API.  Currently, it only performs GET requests (read-only).

##Synopsis:

	#!/usr/bin/perl
	use strict;
	use NSONE;
	
	my $ns1 = new NSONE({
		key    => 'somekey'
	});

	# $zones is a list reference
	my $zones = $ns1->zones;
	foreach my $z (@$zones) {
		printf "%s\n", $z->name;

		# records is a list
		my $records = $ns1->zone($z->name);
	
		foreach my $r (@$records) {
			printf "domain: %s, type: %s, answers: %s\n", $r->domain, $r->type, join(',', @{ $r->short_answers });
	}
	
	
# TODO
Incorporate the rest of the REST verbs
