#!/usr/bin/env perl
use strict;

use Test::More;

my @programs = grep { -e } grep { /\Agit-[a-z]+\z/ } glob('git-*');

foreach my $program ( @programs ) {
	my $output = `$^X -c $program 2>&1`;
	like( $output, qr/syntax OK/, "$program compiles" );
	}

done_testing();
