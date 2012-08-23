#!/usr/bin/perl

if(@ARGV < 2) {
	print "Usage: speedup.pl inputfile outputfile [start] [incr]\n";
	print "start: acell at layer 2 (first layer modified) as % (default: 500)\n";
	print "incr: increase per layer (default 25)\n";
	
	exit(1);
}

print "Processing ".$ARGV[0]." into ".$ARGV[1]."\n";

# sensible minimum
$startat = 500;
if(@ARGV > 2) {
	$startat = int($ARGV[2]);
}

$incr = 10;
if(@ARGV > 3) {
	$incr = int($ARGV[3]);
}

open FIN, $ARGV[0] or die $!;
open FOUT, ">", $ARGV[1] or die $!;

$currentaccel = $startat;

$firstlayer=0;

while(<FIN>) {
	@renew = split(';', $_);
	$line = $renew[0];
	if($line =~ /.*G1.*Z[0-9]+.*/) {

		if($firstlayer == 1) {
			print FOUT "M204 S".$currentaccel."\n";
			print FOUT "M201 X".$currentaccel." Y".$currentaccel."\n";
			$currentaccel += $incr;
		} else {
			$firstlayer = 1;
		}
	}
	print FOUT $_;
}

print "Done\n";
