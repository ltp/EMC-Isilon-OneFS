package EMC::Isilon::OneFS::Protocols::NFS::Export;

use strict;
use warnings;

my @ATTRS = qw(
all_dirs
block_size
can_set_time
case_insensitive
case_preserving
chown_restricted
clients
commit_asynchronous
conflicting_paths
description
directory_transfer_size
encoding
id
link_max
map_retry
max_file_size
map_full
name_max_size
no_truncate
paths
readdirplus
readdirplus_prefetch
read_only
read_only_clients
read_transfer_max_size
read_transfer_multiple
read_transfer_size
read_write_clients
return_32bit_file_ids
root_clients
security_flavors
setattr_asynchronous
snapshot
symlinks
time_delta
unresolved_clients
write_datasync_action
write_datasync_reply
write_filesync_action
write_filesync_reply
write_transfer_max_size
write_transfer_multiple
write_transfer_size
write_unstable_action
write_unstable_reply
zone
);

our @M_ATTRS = qw(
map_lookup_uid
map_non_root
map_root
map_failure
);

{
	no strict 'refs';

	for my $attr ( @ATTRS ) {
		*{ __PACKAGE__ . "::$attr" } = sub {
			my $self = shift;
			return $self->{ $attr }
		}
	}
}

sub new {
	my ( $class, $e ) = @_;

	my $self = bless {}, $class;

	foreach my $attr ( @ATTRS ) {
		$self->{ $attr } = $e->{ $attr }
	}

	return $self
}

1;
