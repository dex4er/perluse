#!/usr/bin/perl

use 5.006;

use strict;
use warnings;

use lib 'inc';
use Module::Build::My;

my $module = 'App::perluse';

(my $dist = $module) =~ s/::/-/g;

my $build = Module::Build::My->new(
    module_name             => $module,
    dist_version_from       => 'lib/App/perluse.pm',
    license                 => 'perl',
    requires                => {
    },
    build_requires          => {
    },
    script_files            => 'script',
    auto_configure_requires => 0,
    create_makefile_pl      => 'traditional',
    create_license          => 1,
    recursive_test_files    => 0,
    add_to_cleanup          => [
        '*.bak', '*.gz', '*.tgz', '*.ppd', '*.ppmx', '*.deb',
        'pm_to_blib', 'cover_db', 'Debian_CPANTS.txt',
        'compilet*', 'test-*',
        "$dist-*",
    ],
    meta_merge              => {
        resources               => {
            bugtracker => "http://github.com/dex4er/perluse/issues",
            repository => "http://github.com/dex4er/perluse",
        },
    },
);

$build->create_build_script;
