package EMC::Isilon::OneFS::Protocols;

use strict;
use warnings;

use Scalar::Util qw(weaken);
use EMC::Isilon::OneFS::Protocols::NFS;

sub new {
	my ( $class, $p ) = @_;

	my $self = bless {}, $class;
	weaken( $self->{ __p } = $p );

	return $self
}

sub nfs {
	my $self = shift;

	$self->{ nfs } = EMC::Isilon::OneFS::Protocols::NFS->new( $self->{ __p } );

	return $self->{ nfs }
}

1;
