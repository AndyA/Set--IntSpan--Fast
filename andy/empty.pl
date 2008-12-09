#!/usr/bin/env perl

use strict;
use warnings;
use Set::IntSpan::Fast;

sub Set::IntSpan::Fast::empty { @{$_[0]} = () }

my $set = Set::IntSpan::Fast->new;
$set->add(1, 12, 37, 16, 9);
print join(', ', $set->as_array), "\n";
$set->empty;
print $set->as_string, "\n";

# vim:ts=2:sw=2:sts=2:et:ft=perl

