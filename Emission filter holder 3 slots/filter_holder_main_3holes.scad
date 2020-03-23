/*
 * Filter holder for a nikon inverted microscope. This is designed to
 * go in the groove under the lower fluorescence turret.
 *
 * Hazen 11/14
 */

$fn = 100;

module cutout()
{
	difference(){
		hull(){
			cylinder(r = 2, h = 4);

			translate([0,43,0])
			cylinder(r = 2, h = 4);

			translate([32,43,0])
			cylinder(r = 2, h = 4);

			translate([32,0,0])
			cylinder(r = 2, h = 4);
		}

		translate([16,65,0])
		cylinder(r = 25, h = 4);
	}
}

module main(){
	difference(){
		union(){

			// body.
			translate([-24,-75,0])
			cube(size = [48,150,3]);

			// end plates.
			translate([-21.5,-75,0])
			cube([43,5,10]);

			translate([-21.5,70,0])
			cube([43,5,10]);

			// side plates.
			translate([-24,-75,0])
			cube([3,150,7.5]);

			translate([21,-75,0])
			cube([3,150,7.5]);

			// filter holder.
			cylinder(r = 21.5, h = 10);
			translate([0,45,0])
			cylinder(r = 21.5, h = 10);
			translate([0,-45,0])
			cylinder(r = 21.5, h = 10);

			// indent
			translate([18,-10,0])
			cube([6,20,7.5]);
            translate([18,35,0])
			cube([6,20,7.5]);
            translate([18,-55,0])
			cube([6,20,7.5]); 

			translate([-24,-10,0])
			cube([6,20,7.5]);
            translate([-24,35,0])
			cube([6,20,7.5]);
            translate([-24,-55,0])
			cube([6,20,7.5]);
    
            
		}

		//
		// filter holder.
		//

		// optical clearance
		translate([0,0,-0.5])
		cylinder(r = 10.7, h = 11);
        translate([0,45,-0.5])
		cylinder(r = 10.7, h = 11);
        translate([0,-45,-0.5])
		cylinder(r = 10.7, h = 11);

		// insert clearance
		translate([0,0,1.5])
		cylinder(r = 14.9, h = 9);
        translate([0,45,1.5])
		cylinder(r = 14.9, h = 9);
        translate([0,-45,1.5])
		cylinder(r = 14.9, h = 9);

		for(i=[0:3]){
			rotate([0,0,90*i])
			translate([14.3,45,-0.1])
			cylinder(r = 1.1, h = 10);

			rotate([0,0,90*i])
			translate([14.3,0,-0.1])
            cylinder(r = 1.1, h = 10);

			rotate([0,0,90*i])
			translate([14.3,-45,-0.1])
			cylinder(r = 1.1, h = 10);
		}
        
        // Some missing holes
        translate([0,59.3,-0.1])
        cylinder(r = 1.1, h = 10);

        translate([0,-59.3,-0.1])
        cylinder(r = 1.1, h = 10);
        
        translate([0,30.7,-0.1])
        cylinder(r = 1.1, h = 10);
        
        translate([0,-30.7,-0.1])
        cylinder(r = 1.1, h = 10);
        

		// remove some excess material
		translate([0,0,6])
		cylinder(r = 20, h = 6);
        translate([0,45,6])
		cylinder(r = 20, h = 6);
        translate([0,-45,6])
		cylinder(r = 20, h = 6);

		//
		// indent
		//
		translate([23,5,-0.5])
		cube([2,2,8.5]);
        translate([23,50,-0.5])
		cube([2,2,8.5]);
        translate([23,-40,-0.5])
		cube([2,2,8.5]);

		translate([-25,-7,-0.5])
		cube([2,2,8.5]);
        translate([-25,38,-0.5])
		cube([2,2,8.5]);
        translate([-25,-52,-0.5])
		cube([2,2,8.5]);

		// cut-outs
		//translate([-16,-65,-0.5])
		//cutout();

		//mirror([0,1,0])
        //translate([-16,-65,-0.5])
		//cutout();
	}
}

module holder(){
	height = 2;
	difference(){
		union(){
			cylinder(r = 14.6, h = height);
	
			for(i=[0:3]){
				rotate([0,0,90*i])
				translate([14.6,0,0]){
					translate([0,0,-1])
					cylinder(r = 1, h = 4 + height);

					translate([0,0,3 + height])
					hull(){
						translate([0,-1,0])
						cylinder(r = 1, h = 1);
						translate([0,1,0])
						cylinder(r = 1, h = 1);	
					}
	
					translate([0,0,height])
					hull(){
						cylinder(r = 1, h = 1);
						translate([-2.6,0,0])
						cylinder(r = 1, h = 1);	
					}
				}
			}
		}
		translate([0,0,-0.01])
		cylinder(r = 12.6, h = (height+0.02));
	}
}

main();
