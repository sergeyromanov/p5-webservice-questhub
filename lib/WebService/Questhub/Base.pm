package WebService::Questhub::Base;

use Moo;

use Config::Tiny;
use WebService::Questhub::UA;

has 'ua' => (
    builder => sub { WebService::Questhub::UA->new },
    is      => 'ro',
    lazy    => 1,
);

has 'config' => (
    builder => sub { Config::Tiny->read($ENV{HOME} . "/.questhub") },
    is      => 'ro',
    lazy    => 1,
);

1;
