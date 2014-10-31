package WebService::Questhub::Realms;

use Moo;
extends 'WebService::Questhub::Base';

use WebService::Questhub::Result;

sub list {
    my ($self) = @_;

    my $res = $self->ua->query(
        method => 'GET',
        path   => '/api/realm',
    );

    return WebService::Questhub::Result->_create_iterator($res);
}

1;
