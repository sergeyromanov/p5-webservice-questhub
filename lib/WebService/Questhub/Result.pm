package WebService::Questhub::Result;

use Moo;
extends 'WebService::Questhub::Base';

use Array::Iterator;

sub _create_iterator {
    my ($class, $data) = @_;

    return Array::Iterator->new($data);
}

1;
