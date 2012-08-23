#!/usr/bin/perl

if(@ARGV < 2) {
	print "Usage: speedup.pl inputfile outputfile [start] [incr]\n";
	print "start: Speed at layer 2 (first layer modified) as % (default: 3)\n";
	print "incr: percent increase per layer as % (default 1)\n";
	
	exit(1);
}

print "Processing ".$ARGV[0]." into ".$ARGV[1]."\n";

# sensible minimum
$startat = 30;
if(@ARGV > 2) {
	$startat = int($ARGV[2]);
}

$incr = 3;
if(@ARGV > 3) {
	$incr = int($ARGV[3]);
}

open FIN, $ARGV[0] or die $!;
open FOUT, ">", $ARGV[1] or die $!;

$currentspeed = $startat;

$firstlayer=0;

while(<FIN>) {
	@renew = split(';', $_);
	$line = $renew[0];
	if($line =~ /.*G1.*Z[0-9]+.*/) {

		if($firstlayer == 1) {
			print FOUT "M220 S".$currentspeed."\n";
			$currentspeed += $incr;
		} else {
			$firstlayer = 1;
		}
	}
	print FOUT $_;
}
print FOUT "M220 S100; back to normal;";

print "Done\n";
