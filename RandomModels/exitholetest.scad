
inside_diameter=4.6;
internal_diameter=3;
lip_diameter=5.2;
top_diameter=6;
res=50;

module base() {
	difference() {
		union() {
			cylinder(r=inside_diameter, h=8, $fn=res);
			translate([0,0,2]) cylinder(r1=inside_diameter, r2=lip_diameter, h=2, $fn=res);
			translate([0,0,4]) cylinder(r1=inside_diameter, r2=lip_diameter, h=2, $fn=res);

			translate([0,0,8]) cylinder(r1=inside_diameter, r2=top_diameter, h=4, $fn=res);
			translate([0,0,12]) cylinder(r=top_diameter, h=4, $fn=res);
		}

		translate([0,0,-2]) cylinder(r=internal_diameter, h=8, $fn=res);
		//translate([0,0,14]) sphere(r=internal_diameter*1.1, $fn=res);

	}
}


difference() {
	base();
	translate([0,0,6]) cylinder(r1=internal_diameter, r2=0.8, h=10, $fn=res);
}

translate([16,0,0]) difference() {
	base();
	translate([0,0,6]) cylinder(r1=internal_diameter, r2=0.8, h=4, $fn=res);
	translate([0,0,10]) cylinder(r=0.8, h=10, $fn=res);
}

translate([32,0,0]) difference() {
	base();
	translate([0,0,6]) cylinder(r1=internal_diameter, r2=0.8, h=6, $fn=res);
	translate([-internal_diameter,-0.4,6]) cube([internal_diameter*2, 1.6, 10]);
}
