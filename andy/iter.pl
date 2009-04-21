#!/usr/bin/env perl

use strict;
use warnings;
use Set::IntSpan::Fast;

my $set = Set::IntSpan::Fast->new;
$set->add( 1, 2, 3, 5, 7, 9, 11 );
{
  my $iter = $set->iterate_runs();
  while ( my ( $from, $to ) = $iter->() ) {
    for my $member ( $from .. $to ) {
      print "$member\n";
    }
  }
}

{
  my $iter = member_iter( $set );
  while ( my $n = $iter->() ) {
    print "$n\n";
  }
}

sub member_iter {
  my $set  = shift;
  my $iter = $set->iterate_runs;
  if ( my ( $from, $to ) = $iter->() ) {
    return sub {
      while ( 1 ) {
        return $from++ if $from <= $to;
        return unless ( $from, $to ) = $iter->();
      }
    };
  }
  return sub { };
}

# vim:ts=2:sw=2:sts=2:et:ft=perl

