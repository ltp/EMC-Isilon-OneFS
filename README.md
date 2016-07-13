## NAME

EMC::Isilon::OneFS - Perl bindings for the EMC Isilon OneFS API

## SYNOPSIS

    use EMC::Isilon::OneFS;

    my $foo = EMC::Isilon::OneFS->new();
    ...

## METHODS

### new( %ARGS )

Constructor; creates a new EMC::Isilon::OneFS object.  The constructor accepts
three mandatory parameters and two optional parameters.

- username

    Mandatory - the username with which to connect to the API.

- password

    Mandatory - the password with which to connect to the API.

- hostname

    Mandatory - the hostname of the device to connect to.

- proto

    Optional - the protocol to use when connecting to the API, this should be one 
    of 'http' or 'https'.  If not supplied, this parameter defaults to 'https'.

- port

    Optional - the port to use when connecting to the API.  If not supplied, this 
    parameter defaults to '8080'.

### session ( \[platform|namespace\] )

Establishes a session to the OneFS API.

### get\_resource\_uris ()

Returns an array containing all resource URIs defined on the target platform.

## AUTHOR

Luke Poskitt, `<ltp at cpan.org>`

## BUGS

Please report any bugs or feature requests to `bug-emc-isilon-onefs at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=EMC-Isilon-OneFS](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=EMC-Isilon-OneFS).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

## SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc EMC::Isilon::OneFS



You can also look for information at:

- RT: CPAN's request tracker (report bugs here)

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=EMC-Isilon-OneFS](http://rt.cpan.org/NoAuth/Bugs.html?Dist=EMC-Isilon-OneFS)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/EMC-Isilon-OneFS](http://annocpan.org/dist/EMC-Isilon-OneFS)

- CPAN Ratings

    [http://cpanratings.perl.org/d/EMC-Isilon-OneFS](http://cpanratings.perl.org/d/EMC-Isilon-OneFS)

- Search CPAN

    [http://search.cpan.org/dist/EMC-Isilon-OneFS/](http://search.cpan.org/dist/EMC-Isilon-OneFS/)

## LICENSE AND COPYRIGHT

Copyright 2016 Luke Poskitt.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

[http://www.perlfoundation.org/artistic_license_2_0](http://www.perlfoundation.org/artistic_license_2_0)

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


