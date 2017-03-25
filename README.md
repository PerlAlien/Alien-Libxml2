# Alien::Libxml2 [![Build Status](https://secure.travis-ci.org/plicease/Alien-Libxml2.png)](http://travis-ci.org/plicease/Alien-Libxml2)

Install the C libxml2 library on your system

# SYNOPSIS

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
    use Config;
    
    my $alien = Alien::Libxml2->new;
    WriteMakefile(
      ...
      CFLAGS => $Config{ccflags} . ' ' . Alien::Libxml2->cflags,
      LIBS   => Alien::Libxml2->libs,
    );

# DESCRIPTION

This module provides libxml2 for other modules to use.  There was an 
already existing [Alien::LibXML](https://metacpan.org/pod/Alien::LibXML), but it uses the older 
[Alien::Build::ModuleBuild](https://metacpan.org/pod/Alien::Build::ModuleBuild) and has not bee actively maintained for a 
while.

# SEE ALSO

- [Alien::LibXML](https://metacpan.org/pod/Alien::LibXML)

    Unmaintained Alien for the same library.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
