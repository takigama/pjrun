#!/usr/bin/perl

if(@ARGV < 3) {
	print "Usage: tempup.pl inputfile outputfile maxtemp [start] [layers] [incr]\n";
	print "maxtemp: MAXIMUM temperature that can safely be reached\n";
	print "start: temp at layer 3 (first layer modified) as (default: print setting)\n";
	print "layers: layers between temp adjustments (default 5)\n";
	print "incr: temperature increment (default 2)\n";
	
	exit(1);
}

print "Processing ".$ARGV[0]." into ".$ARGV[1]."\n";

# sensible minimum
$maxtemp = 215;

$maxtemp = int($ARGV[2]);

# extra args
$startat = 180;
if(@ARGV > 3) {
	$startat = int($ARGV[3]);
}

$layers = 5;
if(@ARGV > 4) {
	$layers = int($ARGV[4]);
}

$incr = 3;
if(@ARGV > 5) {
	$incr = int($ARGV[5]);
}

$printtemp = 0;
open FIN, $ARGV[0] or die $!;
while(<FIN>) {
	chomp($_);
	@renew = split(';', $_);
	$line = $renew[0];
	if($line =~ /.*M10[49].*/) {
		#print "found temp line: ".$line;
		@ln = split(/ +/, $line);
		foreach $tln (@ln) {
			#print "is: ".$tln."\n";
			if($tln =~ /^S.*/) {
				#print "and is: ".substr($tln, 1)."\n";
				$newtemp = int(substr($tln,1));
				if($newtemp > 10) {
					$printtemp=$newtemp;
				}
			} else {
				#print "not s\n";
			}
		}
	}
}

print "so print temp is ".$printtemp."\n";

print "Maxtemp is ".$maxtemp.", temperate change every ".$layers." layers, incrementing by ".$incr."\n";

close FIN;

open FIN, $ARGV[0] or die $!;
open FOUT, ">", $ARGV[1] or die $!;

$currenttemp = $startat;

$atlayer=0;

while(<FIN>) {
	@renew = split(';', $_);
	$line = $renew[0];
	if($line =~ /.*G1.*Z[0-9]+.*/) {

		if($atlayer == 3) {
			print FOUT "M104 S".$currenttemp."\n";
			$currenttemp += $incr;
		}
		if($atlayer > 3) {
			if(($atlayer-3)%$layers == 0) {
				print FOUT "M104 S".$currenttemp."\n";
				$currenttemp += $incr;
				
			}
		}

		if($currenttemp > $maxtemp) {
			$currenttemp = $maxtemp;
		}
		$atlayer++;
	}
	print FOUT $_;
}

print "Done\n";
