package WebService::Questhub::UA;

use Moo;
extends 'WebService::Questhub::Base';

use HTTP::Tiny::UA;
use JSON::MaybeXS;

my $endpoint = 'http://questhub.io';

sub query {
    my ($self, %args) = @_;

    my $ua = HTTP::Tiny::UA->new;

    my $url    = $endpoint . delete($args{path});
    my $method = delete($args{method});
    my $raw;
    if ( $method eq 'GET' ) {
        my $param = $ua->www_form_urlencode(\%args);
        $raw      = $ua->get( $url . "?$param" )->content;

    }
    elsif ( $method eq 'POST' ) {
        my $conf  = $self->config;
        my $param = $ua->www_form_urlencode({
            api_login => $conf->{auth}{login},
            api_token => $conf->{api}{token},
        });
        $raw   = $ua->post_form( $url . "?$param", \%args )->content;
    }

    my $decoder = JSON::MaybeXS->new;
    my $result  = $decoder->decode($raw);

    return $result;
}

1;
