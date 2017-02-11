package NSONE::Record;

use strict;

use Class::MethodMaker [
    scalar  => [ qw( data id domain link short_answers tier ttl type ) ],
    new     => [ qw( -init new ) ],
];

sub init {
    my ($self, $args) = @_;

    $self->data($args);

    $self->id($args->{id});
    $self->domain($args->{domain});
    $self->link($args->{link});
    $self->short_answers($args->{short_answers});
    $self->tier($args->{tier});
    $self->ttl($args->{ttl});
    $self->type($args->{type});
}

1;
