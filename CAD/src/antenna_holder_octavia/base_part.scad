
beam_top_width = 32;
beam_bottom_width = 21;
beam_height = 25;

holder_width = 40;
below_beam = 6;


min_wall = 4;

M4_screw_diameter = 4.3;
M4_nut_diameter = 7;
M4_nut_height = 4;

lock_thickness = 8;
lock_join_width = 30;
lock_conection_width = 15;
lock_clearence = 1;


lock_around_wall = (holder_width-lock_join_width)/2-1;


module join_fuse_hole(){
    
    translate([0, 0, 35/3])
        rotate([90, 0, 0]){
            cylinder(d = M4_screw_diameter, h = 50, center = true, $fn = 40);
            translate([0, 0, holder_width/2-3])
                cylinder(d = M4_nut_diameter, h = 20, $fn = 6);
        }
        
}


module bottom_part(){

    difference(){
    translate([0, -holder_width/2, -below_beam])
        cube([beam_top_width + 2*M4_screw_diameter + 4*3, holder_width, below_beam+beam_height]);

    translate([beam_top_width/2+ M4_screw_diameter + 2*3, 0, 0]) rotate([90, 0, 0]) hull(){
        translate([beam_bottom_width/2 - 3/2, 3/2, 0])
            cylinder(d = 3, h = 100, center = true, $fn = 50);
        translate([-beam_bottom_width/2 + 3/2, 3/2, 0])
            cylinder(d = 3, h = 100, center = true, $fn = 50);

        translate([beam_top_width/2 - 3/2, beam_height, 0])
            cylinder(d = 3, h = 100, center = true, $fn = 50);
        translate([-beam_top_width/2 + 3/2, beam_height, 0])
            cylinder(d = 3, h = 100, center = true, $fn = 50);
    }

    for(x = [3+M4_screw_diameter/2, 3*3+1.5*M4_screw_diameter+beam_top_width], y=[-holder_width/3*1, holder_width/3])
        translate([x, y, -below_beam]){
            translate([0, 0, 3]) cylinder(d = M4_screw_diameter, h = 100, $fn = 30);
            rotate(30) translate([0, 0, -0.1])
            cylinder(d = M4_nut_diameter, h = 3, $fn = 6);

        }
    
        join_fuse_hole();

    }



    difference(){
        translate([-(lock_thickness+lock_around_wall), -holder_width/2, -below_beam])
            cube([lock_thickness+lock_around_wall, holder_width, below_beam+beam_height + 6]);

        translate(){
            translate([-(lock_thickness), -lock_join_width/2, 0])
                cube([lock_thickness, lock_join_width, below_beam+beam_height+11]);
            translate([-(lock_thickness)-20, -lock_conection_width/2, 0])
                cube([lock_thickness+20, lock_conection_width, below_beam+beam_height+11]);
        }
        
    join_fuse_hole();

    }

}

module top_part(){

    difference(){
        translate([1, -holder_width/2, 0])
            cube([beam_top_width + 2*M4_screw_diameter + 4*3 - 1, holder_width, 6]);

        for(x = [3+M4_screw_diameter/2, 3*3+1.5*M4_screw_diameter+beam_top_width], y=[-holder_width/3*1, holder_width/3])
            translate([x, y, -0.1]){
                cylinder(d = M4_screw_diameter, h = 100, $fn = 30);
            }
    }
    /*difference(){
        translate([-(lock_thickness+lock_around_wall), -holder_width/2, 0])
            cube([lock_thickness+lock_around_wall, holder_width, 10]);

        translate(){
            translate([-(lock_thickness), -lock_join_width/2, 0])
                cube([lock_thickness, lock_join_width, below_beam+beam_height+1]);
            translate([-(lock_thickness)-20, -lock_conection_width/2, 0])
                cube([lock_thickness+20, lock_conection_width, below_beam+beam_height+1]);
        }
    }*/
    
}



module antenna_5g_holder(){

        difference(){
            union(){
                translate([0, 0, 0]) cylinder(d1 = 20+10, d2=30+10, h=10, $fn=100);
                translate([0, 0,10]) cylinder(d1 = 30+10, d2=35+10, h=25, $fn=100);
                translate([0, 0,35]) cylinder(d = 35+10, h=5, $fn=100);

                translate([-lock_clearence, -(lock_conection_width-lock_clearence)/2, 0])
                    cube([40, lock_conection_width-lock_clearence, 35]);
                translate([40-lock_thickness, -(lock_join_width-lock_clearence)/2, 0])
                    cube([lock_thickness-lock_clearence, lock_join_width-lock_clearence, 35]);
            }

            union(){
                translate([0, 0, 0]) cylinder(d = 20, h=10, $fn=100);
                translate([0, 0,10]) cylinder(d = 30, h=25, $fn=100);
                translate([0, 0,35]) cylinder(d = 35, h=10, $fn=100);

                translate([40, 0, 35/3]) rotate([90, 0, 0]) cylinder(d = 4.5, h=50, $fn=100, center = true);
            }

        }

}

module antenna_helix_holder(){

        difference(){
            union(){
                translate([0, 0, 0]) cylinder(d = 16+5, h= 35, $fn=100);

                translate([-lock_clearence, -(lock_conection_width-lock_clearence)/2, 0])
                    cube([23, lock_conection_width-lock_clearence, 35]);
                translate([23-lock_thickness, -(lock_join_width-lock_clearence)/2, 0])
                    cube([lock_thickness-lock_clearence, lock_join_width-lock_clearence, 35]);
            }

            union(){
                translate([0, 0, 0]) cylinder(d = 16-5, h=10, $fn=100);
                translate([0, 0, 3]) cylinder(d = 16.2, h=50, $fn=100);

                translate([23, 0, 35/3]) rotate([90, 0, 0]) cylinder(d = 4.5, h=50, $fn=100, center = true);
            }
        }
}

module 2_4_antenna(){

        difference(){
            union(){
                translate([0, 0, 0]) cylinder(d = 13+5, h= 35, $fn=100);

                translate([-lock_clearence, -(lock_conection_width-lock_clearence)/2, 0])
                    cube([25, lock_conection_width-lock_clearence, 35]);
                translate([25-lock_thickness, -(lock_join_width-lock_clearence)/2, 0])
                    cube([lock_thickness-lock_clearence, lock_join_width-lock_clearence, 35]);
            }
            translate([-100, -50, 2]) cube(100);


            for(z = [15, 27])
              translate([0, 0, z])
                difference(){
                  cylinder(d = 13+5+3, h=4);
                  cylinder(d = 13+5+0.5, h=4);
                }

            union(){
                //translate([0, 0, 0]) cylinder(d = 16-5, h=10, $fn=100);
                translate([0, 0, 2]) cylinder(d = 13.2, h=50, $fn=100);

                translate([25, 0, 35/3]) rotate([90, 0, 0]) cylinder(d = 4.5, h=50, $fn=100, center = true);
            }
        }
}

translate([-40-20, 0, 0])
antenna_5g_holder();

translate([-20-20, 50, 0])
antenna_helix_holder();

bottom_part();

translate([0, 0, beam_height+1]) top_part();
