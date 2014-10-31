package WebService::Questhub::Base;

use Moo;

use WebService::Questhub::UA;

has 'ua' => (
    builder => sub { WebService::Questhub::UA->new },
    is      => 'ro',
    lazy    => 1,
);

1;
