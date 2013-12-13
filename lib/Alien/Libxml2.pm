package Alien::Libxml2;

use strict;
use warnings;
use base qw( Alien::Base );
use Text::ParseWords qw( shellwords );

# ABSTRACT: Install the C libxml2 library on your system
# VERSION

=head1 SYNOPSIS

Build.PL

 use Alien::Libxml2;
 use Module::Build;
 
 my $alien = Alien::Libxml2;
 my $build = Module::Build->new(
   ...
   extra_compiler_flags => $alien->cflags,
   extra_linker_flags   => $alien->libs,
   ...
 );
 
 $build->create_build_script

Makefile.PL

 use Alien::Libxml2;
 use ExtUtils::MakeMaker;
 
 my $alien = Alien::Libxml2->new;
 WriteMakefile(
   ...
   CFLAGS => Alien::Libxml2->cflags,
   LIBS   => Alien::Libxml2->libs,
 );

FFI

 use Alien::Libxml2;
 use FFI::Sweet qw( ffi_lib );
 
 ffi_lib(Alien::Libml2->new->libs);

=head1 DESCRIPTION

This module provides libxml2 for other modules to use.

=cut

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
