# Alien::Libxml2

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

# DESCRIPTION

This module provides libxml2 for other modules to use.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
