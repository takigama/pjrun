use <original/Thingiverse-Projects/Threaded Library/Thread_Library.scad>
use <original/MCAD/involute_gears.scad>
use <original/MCAD/shapes.scad>

numberTeeth=15;
pitchRadius=15;
thickness=6;
length=44;
radius=6;
pitch=2*3.1415*pitchRadius/numberTeeth;
printWorm = 1;
printGear = 1;
nutSize = 13;
wormConeBegin=25;
wormOffset=-2;

echo ("teeth:", numberTeeth, " and rad:", pitchRadius);


angle=-360*$t;
offset=6;

distance=radius+pitchRadius+0.0*pitch;

if(printWorm > 0) {
	difference() {

		union() {

			translate([0,0,wormOffset]) trapezoidThread( length=length, pitch=pitch, pitchRadius=radius, threadHeightToPitch=0.5, profileRatio=0.5, threadAngle=20, RH=true, clearance=0.2, backlash=0.05, stepsPerTurn=96);
			translate([0,0,wormConeBegin+5]) cylinder(h=7, r=9);

			cylinder(h=0.2,r=15);
			translate([0,0,wormConeBegin]) cylinder(h=5, r1=4, r2=9);
		}

		translate([3.2,-2.8,wormConeBegin+5+7-6.5]) cube(size=[2.8,5.6,7]);
		translate([0,0,wormOffset-0.2]) cylinder(h=abs(wormOffset)+0.2, r=radius*5, $fn=30);
		translate([0,0,wormConeBegin+5+7]) cylinder(h=50, r=radius*5, $fn=30);
		translate([0,0,wormConeBegin+5+7-25]) cylinder(h=25, r=2.7, $fn=30);
	}
}

//translate([0,0,wormConeBegin+5+7-25]) cylinder(h=26, r=2.7, $fn=30);

if(printGear > 0) {
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
	                hexagon(size=nutSize,height=8.2);
	        }
	}
}
