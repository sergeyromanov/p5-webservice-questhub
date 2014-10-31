package WebService::Questhub::UA;

use Moo;
extends 'WebService::Questhub::Base';

use HTTP::Tiny::UA;
use JSON::MaybeXS;

my $endpoint = 'http://questhub.io';

sub query {
    my ($self, %args) = @_;

    my $ua = HTTP::Tiny::UA->new;

    my $url = $endpoint . delete($args{path});
    my $result;
    if (delete $args{method} eq 'GET') {
        my $param = $ua->www_form_urlencode(\%args);
        my $raw   = $ua->get( $url . "?$param" )->content;

        my $decoder = JSON::MaybeXS->new;
        $result     = $decoder->decode($raw);
    }

    return $result;
}

1;
