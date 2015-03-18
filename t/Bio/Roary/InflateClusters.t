#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;
use File::Slurp::Tiny qw(read_file write_file);

BEGIN { unshift( @INC, './lib' ) }
$ENV{PATH} .= ":./bin";

BEGIN {
    use Test::Most;
    use_ok('Bio::Roary::InflateClusters');
}

my $obj;


ok( $obj = Bio::Roary::InflateClusters->new(
  clusters_filename  => 't/data/clustersfile',
  mcl_filename       => 't/data/mcl_file',
  output_file        => 'example.output'
),'initialise object');
ok($obj->inflate,'inflate the results');

is(read_file('example.output'),read_file('t/data/expected_inflated_results'), 'inflated results as expected');
unlink('example.output');


ok( $obj = Bio::Roary::InflateClusters->new(
  clusters_filename  => 't/data/clusters_to_inflate',
  mcl_filename       => 't/data/clusters_to_inflate.mcl',
  output_file        => 'example.output'
),'initialise object');
ok($obj->inflate,'inflate the results');

is(read_file('example.output'),read_file('t/data/expected_clusters_to_inflate'), 'inflated results as expected');
unlink('example.output');

done_testing();

