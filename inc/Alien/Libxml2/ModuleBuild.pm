package Alien::Libxml2::ModuleBuild;

use strict;
use warnings;
use FindBin ();
use base qw( Alien::Base::ModuleBuild );

sub alien_interpolate
{
  my($self, $string) = @_;
  $string =~ s/(?<!\%)\%d/$FindBin::Bin/eg;
  $self->SUPER::alien_interpolate($string);
}

1;
