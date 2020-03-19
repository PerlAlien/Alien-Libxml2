# Alien::Libxml2 [![Build Status](https://secure.travis-ci.org/Perl5-Alien/Alien-Libxml2.png)](http://travis-ci.org/Perl5-Alien/Alien-Libxml2) ![macos-share](https://github.com/Perl5-Alien/Alien-Libxml2/workflows/macos-share/badge.svg) ![macos-system](https://github.com/Perl5-Alien/Alien-Libxml2/workflows/macos-system/badge.svg) ![windows-share](https://github.com/Perl5-Alien/Alien-Libxml2/workflows/windows-share/badge.svg) ![windows-system](https://github.com/Perl5-Alien/Alien-Libxml2/workflows/windows-system/badge.svg)

Install the C libxml2 library on your system

# SYNOPSIS

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Alien::Base::Wrapper ();

WriteMakefile(
  Alien::Base::Wrapper->new('Alien::Libxml2')->mm_args2(
    # MakeMaker args
    NAME => 'Kafka::Librd',
    ...
  ),
);
```

In your Build.PL:

```perl
use Module::Build;
use Alien::Base::Wrapper qw( Alien::Libxml2 !export );

my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::Libxml2' => '0',
    ...
  },
  Alien::Base::Wrapper->mb_args,
  ...
);

$build->create_build_script;
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

This module provides `libxml2` for other modules to use.

# CAVEATS

There was an older existing [Alien::LibXML](https://metacpan.org/pod/Alien::LibXML), but it uses the older
[Alien::Build::ModuleBuild](https://metacpan.org/pod/Alien::Build::ModuleBuild) and the author prefers this version which
is based on the more robust [alienfile](https://metacpan.org/pod/alienfile) system.

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

    Older Alien for the same library.

- [XML::LibXML](https://metacpan.org/pod/XML::LibXML)

    Perl interface to `libxml2`, which uses this [Alien](https://metacpan.org/pod/Alien)

# AUTHOR

Author: Graham Ollis <plicease@cpan.org>

Contributors:

Shlomi Fish (shlomif)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
