package WebService::Questhub::Realm;

use Moo;
extends 'WebService::Questhub::Base';

has 'id' => (
    is => 'ro',
);

has 'name' => (
    is => 'ro',
);

has 'description' => (
    is => 'ro',
);

sub get {
    my ($self, %args) = @_;

    my $res = $self->ua->query(
        method => 'GET',
        path   => '/api/realm/' . delete($args{id}),
    );

    $res = $self->_create_instance($res, 'Realm');

    return $res;
}

1;
