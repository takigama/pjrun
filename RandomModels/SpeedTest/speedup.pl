#!/usr/bin/perl

if(@ARGV < 2) {
	print "Usage: speedup.pl inputfile outputfile [min]\n";
	print "min: minimum speeddown (percent)\n";
}

print "Processing ".$ARGV[0]." into ".$ARGV[1]."\n";

# sensible minimum
$min = 10;
if(@ARGV == 3) {
	$min = int($ARGV[2]);
}

open FIN, $ARGV[0] or die $!;
open FOUT, ">", $ARGV[1] or die $!;

$maxspeed = 0;

while(<FIN>) {
	if($_ =~ /.*G1.*Z[0-9]+.*/) {
		# print "found a z, ".$_;

		# get the z variable
		@n = split(/ +/, $_);
		foreach $l (@n) {
			if($l =~ /^[Zz].*/) {
				$zval = substr $l, 1;
				$suval = int(10*$zval);
				if($suval < $min) {
					$suval = $min;
				}
				print FOUT "M220 S".$suval."\n";
			} else {
				#print "no match for z on ".$l."\n";
			}
		}
	}
	print FOUT $_;
}

print "Done\n";
