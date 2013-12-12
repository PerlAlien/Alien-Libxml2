package Alien::Libxml2;

use strict;
use warnings;
use base qw( Alien::Base );

# ABSTRACT: Install the C libxml2 library on your system
# VERSION

# workaround for Alien::Base gh#30
sub import
{
  my $class = shift;
  if($class->install_type('share'))
  {
    unshift @DynaLoader::dl_library_path,
      grep { s/^-L// }
      shellwords( $class->libs );
  }
  
  $class->SUPER::import(@_);
}

1;
