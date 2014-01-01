#!/usr/bin/perl -c

package App::perluse;

=head1 NAME

App::perluse - Use the specified perl in shell command

=head1 SYNOPSIS

  $ cpanm App::perluse

  $ perluse

=head1 DESCRIPTION

See perluse(1) for available command line options.

C<App::perluse> is not real module because perluse(1) command is just a POSIX
shell script.

It allows to install this script with cpan(1) or cpanm(1) command.

=cut


use 5.006;

use strict;
use warnings;

our $VERSION = '0.0100';


1;


=head1 SEE ALSO

L<http://github.com/dex4er/perluse>, perluse(1).

=head1 AUTHOR

Piotr Roszatycki <dexter@cpan.org>

=head1 LICENSE

Copyright (c) 2011-2014 Piotr Roszatycki <dexter@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

See L<http://dev.perl.org/licenses/artistic.html>
