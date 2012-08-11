wallThickness = 4;
hangerThickness = 4;
edgeSize = 30;
edgeOverHang = 4;
edgeThickness = 2;



bottomClip();

module bottomClip() {
	union() {
	difference() {
		cube([edgeSize, edgeSize, wallThickness]);
		rotate(a=[0,0,45]) translate([0,0,-wallThickness]) cube([edgeSize*3, edgeSize*3,wallThickness*3]);
	}

	translate([edgeSize*0.3, edgeOverHang, edgeThickness]) cube([5,edgeThickness,15]);
	
	translate([edgeSize-(2*edgeOverHang), edgeOverHang, edgeThickness]) cube([5,edgeThickness,15]);

	translate([edgeSize-edgeOverHang, edgeSize-(3*edgeOverHang), edgeThickness]) cube([edgeThickness,5,15]);

	translate([edgeSize-edgeOverHang, edgeOverHang, edgeThickness]) cube([edgeThickness,5,15]);
	}
}