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

rotate(a=[0,90,0]) {
#trapezoidThread( 
	length=length, 			// axial length of the threaded rod
	pitch=pitch,				 // axial distance from crest to crest
	pitchRadius=radius, 		// radial distance from center to mid-profile
	threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5,			 // ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=20, 			// angle between the two faces of the thread
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0.2, 			// radial clearance, normalized to thread height
	backlash=0.06, 			// axial clearance, normalized to pitch
	stepsPerTurn=96 			// number of slices to create per turn
	);
}
