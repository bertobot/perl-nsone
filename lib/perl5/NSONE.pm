package NSONE;

use strict;
use JSON;
use LWP::UserAgent;
use NSONE::Zone;
use HTTP::Request;
use Class::MethodMaker [
    scalar  => [ qw( key ua baseurl ) ],
    new     => [ qw( -init new ) ],
];

sub init {
    my ($self, $args) = @_;
    
    $self->baseurl('https://api.nsone.net/v1');

    $self->key($args->{key});

    $self->ua(new LWP::UserAgent);
}

sub _prep {
    my ($self, $args) = @_;

    my $req = new HTTP::Request($args->{method}, $args->{url});

    $req->header('X-NSONE-Key' => $self->key);

    $req->content($args->{content}) if defined $args->{content};

    return $self->ua->request($req);
}

sub zones {
    my ($self, $args) = @_;

    my $result = [];

    my $r = $self->_prep({
        method  => 'GET',
        url     => sprintf("%s/zones", $self->baseurl),
    });

    return $result if ! $r->is_success;

    my $zones = decode_json($r->decoded_content);
    foreach my $z (@$zones) {
        push @$result, new NSONE::Zone($z);
    }

    return $result;
}

sub zone {
    my ($self, $zone) = @_;

    my $r = $self->_prep({
        method  => 'GET',
        url     => sprintf("%s/zones/%s", $self->baseurl, $zone),
    });

    return new NSONE::Zone(decode_json($r->decoded_content)) if $r->is_success;
}

sub test {
    my ($self, $args) = @_;

    my $req = new HTTP::Request($args->{method}, $args->{url});

    $req->header('X-NSONE-Key' => $self->key);

    $req->content($args->{content}) if defined $args->{content};

    return $self->ua->request($req);
}

1;
