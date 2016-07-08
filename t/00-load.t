#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'EMC::Isilon::OneFS' ) || print "Bail out!\n";
}

diag( "Testing EMC::Isilon::OneFS $EMC::Isilon::OneFS::VERSION, Perl $], $^X" );
