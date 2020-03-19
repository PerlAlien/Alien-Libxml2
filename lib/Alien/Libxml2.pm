package Alien::Libxml2;

use strict;
use warnings;
use base qw( Alien::Base );

# ABSTRACT: Install the C libxml2 library on your system
# VERSION
# ALIEN SYNOPSIS

=head1 DESCRIPTION

This module provides C<libxml2> for other modules to use.

=head1 CAVEATS

There was an older existing L<Alien::LibXML>, but it uses the older
L<Alien::Build::ModuleBuild> and the author prefers this version which
is based on the more robust L<alienfile> system.

C<libxml2> has some optional prereqs, including C<zlib> and C<iconv>.
For a C<share> install you will want to make sure that these are installed
prior to installing L<Alien::Libxml2> if you want to make use of features
relying on them.

For a system install, you want to make sure the development packages for
C<libxml2>, C<zlib> and C<iconv> are installed if C<libxml2> has been
configured to use them, otherwise L<XML::LibXML> will not install as
expected.  If the tests for this module fail with a missing C<iconv.h>
or C<zlib.h>, then this is likely the reason.

=head1 SEE ALSO

=over 4

=item L<Alien::LibXML>

Older Alien for the same library.

=item L<XML::LibXML>

Perl interface to C<libxml2>, which uses this L<Alien>

=back

=cut

1;
