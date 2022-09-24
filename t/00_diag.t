use Test2::V0 -no_srand => 1;
use Config;

eval { require 'Test/More.pm' };

# This .t file is generated.
# make changes instead to dist.ini

my %modules;
my $post_diag;

$modules{$_} = $_ for qw(
  Alien::Base
  Alien::Build
  Alien::Build::MM
  Alien::Build::Plugin::Build::SearchDep
  Alien::Build::Plugin::Download::GitLab
  Alien::Build::Plugin::Prefer::BadVersion
  Alien::Build::Plugin::Probe::Vcpkg
  ExtUtils::CBuilder
  ExtUtils::MakeMaker
  Test2::V0
  Test::Alien
);

$post_diag = sub {
  require Alien::Libxml2;
  diag "version        = ", Alien::Libxml2->config('version');
  diag "cflags         = ", Alien::Libxml2->cflags;
  diag "cflags_static  = ", Alien::Libxml2->cflags_static;
  diag "libs           = ", Alien::Libxml2->libs;
  diag "libs_static    = ", Alien::Libxml2->libs_static;
  diag "bin_dir        = ", $_ for Alien::Libxml2->bin_dir;
};

my @modules = sort keys %modules;

sub spacer ()
{
  diag '';
  diag '';
  diag '';
}

pass 'okay';

my $max = 1;
$max = $_ > $max ? $_ : $max for map { length $_ } @modules;
our $format = "%-${max}s %s";

spacer;

my @keys = sort grep /(MOJO|PERL|\A(LC|HARNESS)_|\A(SHELL|LANG)\Z)/i, keys %ENV;

if(@keys > 0)
{
  diag "$_=$ENV{$_}" for @keys;

  if($ENV{PERL5LIB})
  {
    spacer;
    diag "PERL5LIB path";
    diag $_ for split $Config{path_sep}, $ENV{PERL5LIB};

  }
  elsif($ENV{PERLLIB})
  {
    spacer;
    diag "PERLLIB path";
    diag $_ for split $Config{path_sep}, $ENV{PERLLIB};
  }

  spacer;
}

diag sprintf $format, 'perl', "$] $^O $Config{archname}";

foreach my $module (sort @modules)
{
  my $pm = "$module.pm";
  $pm =~ s{::}{/}g;
  if(eval { require $pm; 1 })
  {
    my $ver = eval { $module->VERSION };
    $ver = 'undef' unless defined $ver;
    diag sprintf $format, $module, $ver;
  }
  else
  {
    diag sprintf $format, $module, '-';
  }
}

if($post_diag)
{
  spacer;
  $post_diag->();
}

spacer;

done_testing;

