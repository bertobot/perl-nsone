package NSONE::Zone;

use strict;

use NSONE::Record;

use Class::MethodMaker [
    scalar  => [ qw( data records name serial ttl refresh retry dns_servers hostmaster id pool link meta network_pools networks nx_ttl primary ) ],
    new     => [ qw( -init new ) ],
];

sub init {
    my ($self, $args) = @_;

    my $records = [];

    $self->data($args);

    $self->name($args->{zone});

    $self->serial($args->{serial});
    $self->ttl($args->{ttl});
    $self->refresh($args->{refresh});
    $self->retry($args->{retry});
    $self->dns_servers($args->{dns_servers});
    $self->hostmaster($args->{hostmaster});
    $self->id($args->{id});
    $self->pool($args->{pool});
    $self->link($args->{link});
    $self->meta($args->{meta});
    $self->network_pools($args->{network_pools});
    $self->networks($args->{networks});
    $self->nx_ttl($args->{nx_ttl});
    $self->primary($args->{primary});

    foreach my $r (@{ $args->{records} }) {
        push @$records, new NSONE::Record($r);
    }

    $self->records($records);
}

1;
