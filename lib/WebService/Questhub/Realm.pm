package WebService::Questhub::Realm;

use Moo;
extends 'WebService::Questhub::Base';

sub get {
    my ($self, %args) = @_;

    my $res = $self->ua->query(
        method => 'GET',
        path   => '/api/realm/' . delete($args{id}),
    );

    return $res;
}

1;
