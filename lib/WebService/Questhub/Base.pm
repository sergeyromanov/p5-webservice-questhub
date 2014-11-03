package WebService::Questhub::Base;

use Moo;

use Config::Tiny;
use Module::Loader;
use WebService::Questhub::UA;

has 'ua' => (
    builder => sub { WebService::Questhub::UA->new },
    is      => 'ro',
    lazy    => 1,
);

has 'loader' => (
    builder => sub { Module::Loader->new },
    is      => 'ro',
    lazy    => 1,
);

has 'config' => (
    builder => sub { Config::Tiny->read($ENV{HOME} . "/.questhub") },
    is      => 'ro',
    lazy    => 1,
);

sub _create_instance {
    my ($self, $data, $name) = @_; 

    my $class = 'WebService::Questhub::' . $name;
    $self->loader->load($class);

    return $class->new($data);
}

1;
