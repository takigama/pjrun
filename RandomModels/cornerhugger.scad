wallThickness = 4;
hangerThickness = 5;
hangerLength = 10;
hangerHeight = 18;
edgeHeight = 26; // size of edge lengths
edgeSize = 54;
edgeOverHang = 11;
edgeThickness = 2;
feathering = 0.4; // extra width on holes
screwSize= 4;

pylonHeight = 150;
pylonWidth = 8;
pylonDepth = 30;
pylonTop = 15; // the bit at the top that holds filament batton
pylonConnectorRadius =4;

pylonCaptureSize = 5;
pylonCaptureHeight = 8;
pylonCaptureDepth = 3;

battonLength = 80;
battonWidth = 8;
battonAngle = 20;
battonCaptureSize = 60;
battonCaptureDistance = 20;
resolution=50;




// some calcs
endDiff = edgeSize - hangerLength-(edgeSize*0.15);
screwDiff = ((edgeOverHang/2));
battonCapZdiff = (battonCaptureDistance+(pylonConnectorRadius + (pylonConnectorRadius*2.5-pylonConnectorRadius)/2))*tan(battonAngle)-1;
battonCapZdiffEnd = (battonLength-battonWidth/2+(pylonConnectorRadius + (pylonConnectorRadius*2.5-pylonConnectorRadius)/2))*tan(battonAngle)-1;




//viewPort();
printPort();

module printPort() {
	//topClip();
	//translate([-edgeHeight*1.1, -edgeHeight*1.1, 0]) bottomClip();
	//translate([-pylonHeight/1.8,-pylonHeight/3.6,0]) rotate(a=[0,0,45]) pylon();
	translate([-edgeSize,-edgeSize,0]) batton();
}

//translate([edgeSize/2+-edgeSize, -edgeSize, 0]) 

viewPort() {
	translate([0,0, -(hangerHeight-wallThickness)]) bottomClip();
	topClip();
	translate([edgeSize/2-pylonWidth/2, edgeSize, wallThickness*3.1]) rotate(a=[180,0,0]) pylon();
	translate([edgeSize/2-pylonWidth/2+4, -battonLength*2, wallThickness*3.1-4]) rotate(a=[90,0,0]) batton();
}


module topClip() {
	union() {
		difference() {
			cube([edgeSize, edgeSize, wallThickness], $fn=resolution);
			//translate([edgeHeight,edgeHeight,-wallThickness]) cube([edgeSize, edgeSize,wallThickness*3], $fn=resolution);

			// screws
			translate([screwDiff*1.2,screwDiff*1.2,  -edgeThickness]) cylinder(r = (screwSize/2)+feathering, h=4*edgeThickness, $fn=resolution);

			translate([screwDiff, edgeSize-(1.5*screwSize),  -edgeThickness]) cylinder(r = (screwSize/2)+feathering, h=4*edgeThickness, $fn=resolution);

			translate([edgeSize-(1.5*screwSize), screwDiff, -edgeThickness]) cylinder(r = (screwSize/2)+feathering, h=4*edgeThickness, $fn=resolution);

			//edge holes
			translate([edgeOverHang-feathering, edgeOverHang-feathering, -edgeThickness]) cube([hangerThickness+feathering*2,hangerLength+feathering*2,hangerHeight], $fn=resolution);
			translate([edgeOverHang-feathering, edgeOverHang-feathering, -edgeThickness]) cube([hangerLength+feathering*2,hangerThickness+feathering*2,hangerHeight], $fn=resolution);

			// end edge holes
			translate([endDiff-feathering, edgeOverHang-feathering, -edgeThickness]) cube([hangerLength+feathering*2,hangerThickness+feathering*2,hangerHeight], $fn=resolution);

			translate([edgeOverHang-feathering,endDiff-feathering,  -edgeThickness]) cube([hangerThickness+feathering*2,hangerLength+feathering*2,hangerHeight], $fn=resolution);

		}
//translate([edgeSize/2-pylonWidth/2-feathering, edgeSize-pylonCaptureHeight-pylonCaptureDepth, wallThickness]) cube([pylonWidth+feathering*2, pylonCaptureHeight, pylonWidth+feathering*2], $fn=resolution);
		// pylon capture, y bottom
		difference() {
			translate([edgeSize/2-pylonWidth/2-pylonCaptureSize-feathering, edgeSize-pylonCaptureHeight, wallThickness]) cube([pylonWidth+pylonCaptureSize*2+feathering*2, pylonCaptureHeight, pylonWidth+pylonCaptureSize+feathering*2], $fn=resolution);
			translate([edgeSize/2-pylonWidth/2-feathering, edgeSize-pylonCaptureHeight-pylonCaptureDepth, wallThickness]) cube([pylonWidth+feathering*2, pylonCaptureHeight, pylonWidth+feathering*2], $fn=resolution);
		}
		// pylon capture, x bottom
		difference() {
			translate([edgeSize-pylonCaptureHeight, edgeSize/2-pylonWidth/2-pylonCaptureSize-feathering, wallThickness]) cube([pylonCaptureHeight, pylonWidth+pylonCaptureSize*2+feathering*2, pylonWidth+pylonCaptureSize+feathering*2], $fn=resolution);
			translate([edgeSize-pylonCaptureHeight-pylonCaptureDepth, edgeSize/2-pylonWidth/2-feathering, wallThickness]) cube([pylonCaptureHeight, pylonWidth+feathering*2, pylonWidth+feathering*2], $fn=resolution);
		}

		// pylon capture, y top
		difference() {
			translate([edgeSize/2-pylonWidth/2-pylonCaptureSize-feathering,0, wallThickness]) cube([pylonWidth+pylonCaptureSize*2+feathering*2, pylonCaptureHeight, pylonWidth+pylonCaptureSize+feathering*2], $fn=resolution);
			translate([edgeSize/2-pylonWidth/2-feathering, -pylonCaptureHeight, wallThickness]) cube([pylonWidth+feathering*2, pylonCaptureHeight*3, pylonWidth+feathering*2], $fn=resolution);
		}

		// pylon capture, x top
		difference() {
			translate([0, edgeSize/2-pylonWidth/2-pylonCaptureSize-feathering,wallThickness]) cube([pylonCaptureHeight, pylonWidth+pylonCaptureSize*2+feathering*2, pylonWidth+pylonCaptureSize+feathering*2], $fn=resolution);
			translate([-pylonCaptureHeight, edgeSize/2-pylonWidth/2-feathering, wallThickness]) cube([pylonCaptureHeight*3, pylonWidth+feathering*2, pylonWidth+feathering*2], $fn=resolution);
		}
	}
}

module batton() {

	union() {
		difference() {
			union() {
				cylinder(r=pylonConnectorRadius*2.5, h=pylonTop, $fn=resolution);
				translate([pylonConnectorRadius + (pylonConnectorRadius*2.5-pylonConnectorRadius)/2,0,battonWidth/2]) 
				rotate(a=[0, 90-battonAngle, 0]) cylinder(r=battonWidth/2, h=battonLength, $fn=resolution);

			}
			translate([0,0,-1]) cylinder(r=pylonConnectorRadius+feathering, h=pylonTop+2, $fn=resolution);
			translate([-(pylonWidth+feathering*2)/2,-(pylonWidth+feathering*2)/2,-5]) cube([pylonWidth+feathering*2, pylonWidth+feathering*2, 9]);
			rotate([0,0,45]) translate([-(pylonWidth+feathering*2)/2,-(pylonWidth+feathering*2)/2,-5]) cube([pylonWidth+feathering*2, pylonWidth+feathering*2, 9]);
		}

		translate([battonCaptureDistance,0,battonCapZdiff]) cylinder(r=battonWidth/2, h=battonCaptureSize, $fn=resolution);
		translate([battonLength-battonWidth/2,0,battonCapZdiffEnd]) cylinder(r=battonWidth/2, h=battonCaptureSize, $fn=resolution);
	}
}

module pylon() {
	union() {
		cube([pylonWidth, pylonHeight, pylonWidth], $fn=resolution);
		translate([pylonWidth/2,pylonHeight,pylonWidth/2]) rotate(a=[-90,0,0]) cylinder(r=pylonConnectorRadius, h=pylonTop, $fn=resolution);
	}
}

module bottomClip() {
	union() {
	difference() {
		cube([edgeSize, edgeSize, wallThickness], $fn=resolution);
		translate([edgeHeight,edgeHeight,-wallThickness]) cube([edgeSize, edgeSize,wallThickness*3], $fn=resolution);

		// screws
		translate([screwDiff*1.2,screwDiff*1.2,  -wallThickness]) cylinder(r = (screwSize/2)+feathering, h=4*edgeThickness, $fn=resolution);

		translate([screwDiff, edgeSize-(1.5*screwSize),  -wallThickness]) cylinder(r = (screwSize/2)+feathering, h=4*edgeThickness, $fn=resolution);

		translate([edgeSize-(1.5*screwSize), screwDiff, -wallThickness]) cylinder(r = (screwSize/2)+feathering, h=4*edgeThickness, $fn=resolution);

	}


	// corner edges
	translate([edgeOverHang, edgeOverHang, edgeThickness]) cube([hangerThickness,hangerLength,hangerHeight], $fn=resolution);

	translate([edgeOverHang, edgeOverHang, edgeThickness]) cube([hangerLength,hangerThickness,hangerHeight], $fn=resolution);

	// end edges
	translate([endDiff, edgeOverHang, edgeThickness]) cube([hangerLength,hangerThickness,hangerHeight], $fn=resolution);

	translate([edgeOverHang,endDiff,  edgeThickness]) cube([hangerThickness,hangerLength,hangerHeight], $fn=resolution);


	}

}