
difference() {
cube([52, 40, 5]);

translate([8,8,0]) cylinder(r=5, h=10, $fn=5);

translate([20,8,0]) cylinder(r=5, h=10, $fn=8);

translate([32,8,0]) cylinder(r=5, h=10, $fn=10);

translate([44,8,0]) cylinder(r=5, h=10, $fn=14);

translate([8,20,0]) cylinder(r=5, h=10, $fn=20);

translate([20,20,0]) cylinder(r=5, h=10, $fn=24);

translate([32,20,0]) cylinder(r=5, h=10, $fn=28);

translate([44,20,0]) cylinder(r=5, h=10, $fn=32);

translate([8,32,0]) cylinder(r=5, h=10, $fn=40);

translate([20,32,0]) cylinder(r=5, h=10, $fn=52);

translate([32,32,0]) cylinder(r=5, h=10, $fn=80);

translate([44,32,0]) cylinder(r=5, h=10, $fn=150);
}