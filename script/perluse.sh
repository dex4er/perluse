#!/bin/sh

: << POD

Yes! This is POSIX shell script.

=head1 NAME

perluse - Use the specified perl in shell command

=head1 SYNOPSIS

B<perluse> I<version>
S<perl-I<version> | I<version> | I<name>>
[command]

Examples:

  $ perluse 5.18.1 perl -E 'say $^V'

  $ perluse blead perldoc perldelta

  $ perluse perl-5.18.1

  $ perluse

=head1 DESCRIPTION

This command wraps L<perlbrew> command and uses the given version perl in
current shell.

=cut

our $VERSION='0.0100';

POD


perlbrew=perlbrew

PERLBREW_ROOT=${PERLBREW_ROOT:-$HOME/perl5/perlbrew}

if [ ! -f "$PERLBREW_ROOT/etc/bashrc" ]; then
    $perlbrew init
fi

. "$PERLBREW_ROOT/etc/bashrc"

if [ $# -lt 1 ]; then
    echo "Usage:"
    echo "  perluse version [shell command]"
    echo ""
    echo "Installed versions:"
    $perlbrew list
    exit 1
fi

version="$1"
shift

env=`$perlbrew env "$version"` || exit 2
eval $env
export PATH="$PERLBREW_PATH:${PATH:-/usr/bin:/bin}"
export debian_chroot="$PERLBREW_PERL"
export PERL5LIB=$(perl -le 'print join ":", grep { /site_perl/ } @INC')

if [ $# -gt 0 ]; then
    "$@"
    exit $?
else
    "${SHELL:-/bin/sh}" -i
    exit $?
fi


: << POD

=head1 INSTALLATION

=head2 User account only

  $ PERL_MB_OPT='--prefix ~' cpanm App::perluse

=head1 SEE ALSO

L<perlbrew>.

=head1 AUTHOR

Piotr Roszatycki <dexter@cpan.org>

=head1 LICENSE

Copyright (c) 2011-2013 Piotr Roszatycki <dexter@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

See L<http://dev.perl.org/licenses/artistic.html>

=cut

POD
