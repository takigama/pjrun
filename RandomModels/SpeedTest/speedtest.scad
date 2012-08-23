

union() {

//central cube
translate([-1,-10,0]) cube([2,20,50]);
translate([-10,-1,0]) cube([20,2,50]);

// maze
translate([-10,0,0]) cube([0.2, 40, 50]);
translate([-10,40,0]) cube([50, 0.2, 50]);
translate([40,15,0]) cube([0.2, 25.2, 50]);
translate([-5,15,0]) cube([45, 0.2, 50]);
translate([-5,15,0]) cube([0.2, 20, 50]);
translate([-5,35,0]) cube([40, 0.2, 50]);
translate([35,20,0]) cube([0.2, 15.2, 50]);
translate([0,20,0]) cube([35, 0.2, 50]);
translate([0,22,0]) cube([35, 0.2, 50]);

// 3
translate([0,20,0]) cube([0.2, 11,  50]);
translate([0,31,0]) cube([32, 0.2,  50]);
translate([32,23,0]) cube([0.2, 8.2,  50]);
translate([3,23,0]) cube([29, 0.2,  50]);

// 2
translate([3,23,0]) cube([0.2, 6,  50]);
translate([3,29,0]) cube([27, 0.2,  50]);
translate([30,25,0]) cube([0.2, 4.2,  50]);
translate([5,25,0]) cube([25, 0.2,  50]);

// 1
translate([5,25,0]) cube([0.2, 3,  50]);
translate([5,28,0]) cube([24, 0.2,  50]);
translate([29,26,0]) cube([0.2, 2.2, 50]);
translate([6,26,0]) cube([23, 0.2, 50]);

translate([0,-20,0]) cube([0.2, 10, 50]);
//translate([0,-39,0]) rotate(a=[0,0,90.5]) spiral();

translate([10,0,0]) cube([10, 0.2, 50]);

// cylinder
difference() {
	translate([22, 0, 0]) cylinder(r=5, h=50, $fn=50);
	translate([23.5, 0, 0]) cylinder(r=3, h=50, $fn=50);
}

}


// hmm, this is gunna be fun
module spiral(middle_x = 0, middle_y = 0, middle_z = 0, start=20, end=3, height=50, per_rot=2, res=2, width=0.2) {

// each rotation
for(i=[end:per_rot:start]) {
	for(k=[0:res:360]) {
		echo("i am ", i, " and ", k);
		translate([middle_x+cos(k)*(i-(k/360*per_rot)), middle_y+sin(k)*(i-(k/360*per_rot)), height/2]) rotate(a=[0,0,k*1.01]) cube([0.2, 1.05*(i-(k/360*per_rot))*sin(res),50], center=true);
	}
}

}
