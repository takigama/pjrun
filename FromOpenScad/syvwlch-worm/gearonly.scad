use <original/Thingiverse-Projects/Threaded Library/Thread_Library.scad>
use <original/MCAD/involute_gears.scad>

numberTeeth=25;
pitchRadius=40;
thickness=15;


length=100;
radius=15;
pitch=2*3.1415*pitchRadius/numberTeeth;

angle=-360*$t;
offset=4;

distance=radius+pitchRadius+0.0*pitch;

gear ( 
	number_of_teeth=numberTeeth,
	circular_pitch=360*pitchRadius/numberTeeth,
	pressure_angle=20,
	clearance = 0,
	gear_thickness=thickness,
	rim_thickness=thickness,
	rim_width=5,
	hub_thickness=thickness,
	hub_diameter=10,
	bore_diameter=5,
	circles=0,
	backlash=0.1,
	twist=-pitchRadius/radius,
	involute_facets=0,
	flat=false);
