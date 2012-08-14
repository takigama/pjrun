

//translate([0,0,0]) adaptor();
//translate([0,30,0]) adaptor(3.2, 5.2, 4.5);
translate([0,60,0]) adaptor(3.4, 5.4, 4.5);
//translate([0,90,0]) adaptor(3.6, 5.6, 4.6);


resolution = 50;

module adaptor(r_inside=2.75, r_flange=5.1, r_insert=4.25) {

nval = ceil((r_insert*1.5-r_insert)*2);

echo("nval:", nval);

difference() {
union() {
	cylinder(r=r_insert, h=10, $fn=resolution);
	translate([0,0,2]) cylinder(r1=r_insert, r2=r_flange, h=2, $fn=resolution);
	//translate([0,0,4]) cylinder(r1=r_insert, r2=r_flange, h=2, $fn=resolution);
	translate([0,0,5]) cylinder(r1=r_insert, r2=r_flange, h=2, $fn=resolution);
	translate([0,0,10]) cylinder(r1=r_insert, r2=r_insert*1.5, h=nval, $fn=resolution);
	translate([0,0,10+nval]) cylinder(r=r_insert*1.5, h=5, $fn=resolution);

}
translate([0,0,-1]) cylinder(r=r_inside, h=40+nval, $fn=50);
}

}