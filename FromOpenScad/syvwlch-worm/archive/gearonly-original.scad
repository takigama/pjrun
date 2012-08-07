use <original/Thingiverse-Projects/Threaded Library/Thread_Library.scad>
use <original/MCAD/involute_gears.scad>
use <original/MCAD/shapes.scad>

numberTeeth=14;
pitchRadius=14;
thickness=6;

echo ("teeth:", numberTeeth, " and rad:", pitchRadius);

length=34;
radius=6;
pitch=2*3.1415*pitchRadius/numberTeeth;

angle=-360*$t;
offset=6;

distance=radius+pitchRadius+0.0*pitch;


difference () {
union () {
	translate([0,0,6]) {
		cylinder(h=4, r=10);
	}
	gear ( 
		number_of_teeth=numberTeeth,
		circular_pitch=360*pitchRadius/numberTeeth,
		pressure_angle=20,
		clearance = 0,
		gear_thickness=thickness,
		rim_thickness=thickness,
		rim_width=5,
		hub_thickness=thickness,
		hub_diameter=8,
		bore_diameter=8.2,
		circles=0,
		backlash=0.1,
		twist=-pitchRadius/radius,
		involute_facets=12,
		flat=false);
}
	translate([0,0,10]) {
		hexagon(size=13,height=8.2);
	}
}

