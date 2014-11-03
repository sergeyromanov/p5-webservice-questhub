package WebService::Questhub::Quest;

use Moo;
extends 'WebService::Questhub::Base';

sub request {
    my ($self, %args) = @_;

    my $res;
    if ( $args{action} eq 'new' ) {
        $res = $self->ua->query(
            method => 'POST',
            path   => '/api/quest',
            realm  => $args{id},
            name   => $args{title},
        );
    }

    return $res;
}

1;
