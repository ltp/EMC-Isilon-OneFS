package EMC::Isilon::OneFS;

use strict;
use warnings;

use LWP;
use JSON;
use IO::Socket::SSL;
use Data::Dumper;

our $VERSION = 0.1;

our $ATTR = { 
        username                =>      { required => 1                                 },
        password                =>      { required => 1                                 },
        hostname                =>      { required => 1                                 },
        port                    =>      { required => 0, default => 8080                },
        proto                   =>      { required => 0, default => 'https'             },
        basic_auth		=>      { required => 0, default => 0			},
        refresh_interval        =>      { required => 0, default => 3600                },
};

sub new {
        my ( $class, %args )  = @_; 
        my $self        = bless {}, $class;

        for ( keys %{ $ATTR } ) { 
                $ATTR->{ $_ }->{ required } 
			and ( defined $args{ $_ } 
			or die "Mandatory parameter '$_' not supplied in constructor\n" );

                $self->{ $_ } = ( $args{$_} or $ATTR->{ $_ }->{ default } )
        }

        $self->{ __ua } = LWP::UserAgent->new(
				ssl_opts => { 
					verify_hostname => 0,
					SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE 
				} 
	);
	$self->{ __jp } = JSON->new();

        return $self
}

sub session {
	my ( $self, $services ) = @_;
	
	return if $self->{ basic_auth };	# Noop for basic auth

	$services =~ /^(platform|namespace)$/ 
		or die "Argument to services() method must be one of 'platform' or 'namespace'";

	$self->__have_session( $services ) or return $self->__create_session( $services );

	return $self
}

sub __have_session {
	my ( $self, $services ) = @_;

	return ( $self->{ __session }->{ $services } ? 1 : 0 )
}

sub __create_session {
	my ( $self, $services ) = @_;

	my $json = {
		username => $self->{ username  },
		password => $self->{ password  },
		services => [ $services ]
	};

	my $enc = $self->{ __jp }->encode( $json );
	print "JSON: $enc\n\n";

	my $res = $self->{ __ua }->post( 
		"$self->{ proto }://$self->{ hostname }:$self->{ port }/session/1/session",
		content_type => 'application/json',
		Content => $enc
	);

	if ( $res->is_success ) {
		print "Request was successful\n";
		print $res->content();
		#$self->{ __session }->{ $services } = 
	}
	else {
		print $res->content();
		print "Request was NOT successful\n";
		return 0
	}

	print $res->content . "\n\n";

	return $self
}

1;

__END__

=head2 NAME

EMC::Isilon::OneFS - Perl bindings for the EMC Isilon OneFS API

=head2 SYNOPSIS

    use EMC::Isilon::OneFS;

    my $foo = EMC::Isilon::OneFS->new();
    ...

=head2 METHODS

=head2 AUTHOR

Luke Poskitt, C<< <ltp at cpan.org> >>

=head2 BUGS

Please report any bugs or feature requests to C<bug-emc-isilon-onefs at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=EMC-Isilon-OneFS>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head2 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc EMC::Isilon::OneFS


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=EMC-Isilon-OneFS>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/EMC-Isilon-OneFS>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/EMC-Isilon-OneFS>

=item * Search CPAN

L<http://search.cpan.org/dist/EMC-Isilon-OneFS/>

=back

=head2 LICENSE AND COPYRIGHT

Copyright 2016 Luke Poskitt.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut
