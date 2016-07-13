package EMC::Isilon::OneFS::Protocols::NFS;

use strict;
use warnings;

use Scalar::Util qw(weaken);
use EMC::Isilon::OneFS::Protocols::NFS::Export;

sub new {
	my ( $class, $p ) = @_;
	
	my $self = bless {}, $class;
	weaken( $self->{ __p } = $p );

	return $self
}

sub exports {
	my $self = shift;

	#return $self->{ __p }->__get( '/platform/2/protocols/nfs/exports' );
	my $j = $self->{ __p }->__get( '/platform/2/protocols/nfs/exports' );

	$self->{ __p }->error if $j == 0;

	$self->{ export_total } = $j->{ total };

	map { 
		push @{ $self->{ exports } }, 
			EMC::Isilon::OneFS::Protocols::NFS::Export->new( $_ )
	} @{ $j->{ exports } };

	return $self->{ exports }
}

1;
