package inc::ModuleBuild;

use Moose;

with 'Dist::Zilla::Role::InstallTool';

sub setup_installer
{
  my($self) = @_;
  
  my($build_pl) = grep { $_->name eq 'Build.PL' } @{ $self->zilla->files };
  
  # work around for this little extra bit
  # put in the regex which breaks 5.12 and lower
  my $content = $build_pl->content;
  $content =~ s{qr/\(\?\^u:}{qr/\(}gsm;
  $build_pl->content($content);
}

1;
