# Alien::Libxml2 [![Build Status](https://secure.travis-ci.org/Perl5-Alien/Alien-Libxml2.png)](http://travis-ci.org/Perl5-Alien/Alien-Libxml2)

Install the C libxml2 library on your system

# SYNOPSIS

In your Build.PL:

```perl
use Module::Build;
use Alien::Libxml2;
my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::Libxml2' => '0',
    ...
  },
  extra_compiler_flags => Alien::Libxml2->cflags,
  extra_linker_flags   => Alien::Libxml2->libs,
  ...
);

$build->create_build_script;
```

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Config;
use Alien::Libxml2;

WriteMakefile(
  ...
  CONFIGURE_REQUIRES => {
    'Alien::Libxml2' => '0',
  },
  CCFLAGS => Alien::Libxml2->cflags . " $Config{ccflags}",
  LIBS    => [ Alien::Libxml2->libs ],
  ...
);
```

In your [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus) script or module:

```perl
use FFI::Platypus;
use Alien::Libxml2;

my $ffi = FFI::Platypus->new(
  lib => [ Alien::Libxml2->dynamic_libs ],
);
```

# DESCRIPTION

This module provides libxml2 for other modules to use.  There was an
already existing [Alien::LibXML](https://metacpan.org/pod/Alien::LibXML), but it uses the older
[Alien::Build::ModuleBuild](https://metacpan.org/pod/Alien::Build::ModuleBuild) and has not been actively maintained for a
while.

# CAVEATS

`libxml2` has some optional prereqs, including `zlib` and `iconv`.
For a `share` install you will want to make sure that these are installed
prior to installing [Alien::Libxml2](https://metacpan.org/pod/Alien::Libxml2) if you want to make use of features
relying on them.

For a system install, you want to make sure the development packages for
`libxml2`, `zlib` and `iconv` are installed if `libxml2` has been
configured to use them, otherwise [XML::LibXML](https://metacpan.org/pod/XML::LibXML) will not install as
expected.  If the tests for this module fail with a missing `iconv.h`
or `zlib.h`, then this is likely the reason.

# SEE ALSO

- [Alien::LibXML](https://metacpan.org/pod/Alien::LibXML)

    Unmaintained Alien for the same library.

# AUTHOR

Author: Graham Ollis <plicease@cpan.org>

Contributors:

Shlomi Fish (shlomif)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
