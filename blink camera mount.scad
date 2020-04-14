width = 26;
length = 85;
end_r = width/2;
thick=3;
hole_r = 13/2;
post_r = 16.3/2;
lip_r = 16.9/2-.5;
lip_h = 1.7;
hinge_count = 7;
hinge_width = width/hinge_count;
hinge_down = .2;
teeth_size = .15;
teeth_w = .4;

difference() {
    union() {
        cube([width, length-end_r*2, thick]);
        translate([end_r,0,0]) cylinder(thick, end_r, end_r);
        translate([end_r,length-end_r*2,0]) cylinder(thick, end_r, end_r);

        // camera end
        translate([end_r,0,0]) cylinder(thick+lip_h+.5, post_r, post_r);
        translate([end_r,0,thick+lip_h]) rotate_extrude() translate([lip_r-.25,0,0]) circle(thick/2/2, $fn=20);

        // wall end
        translate([end_r,length-end_r*2,0]) cylinder(thick+lip_h+.5, post_r, post_r);
        translate([end_r,length-end_r*2,thick+lip_h]) rotate_extrude() translate([lip_r,0,0]) circle(thick/2/2, $fn=20);
        
/*        // close tab (camera side)
        translate([end_r,-end_r-thick/2+.1,-thick])
        cube([thick/2, thick/2, thick*2]);
        translate([end_r-.5,-end_r-thick/2+.1,-thick])
        cube([thick/2, thick/2, thick/2-.25]);

        // close tab (wallside)
        translate([end_r-thick/2,length-end_r-.1,-thick])
        cube([thick/2, thick/2, thick*2]);
        translate([end_r-thick/2+.5,length-end_r-.1,-thick])
        cube([thick/2, thick/2, thick/2-.25]); //*/

    }
    
    // camera end hole (a little bigger)
    translate([end_r,0,-1]) cylinder(20, hole_r+.25, hole_r+.25);
    translate([end_r,length-end_r*2,-1]) cylinder(20, hole_r, hole_r);
    
    // camera end cutouts
    for(i=[0:120:360])
    translate([end_r,0,0])
    rotate([0,0,i])
    translate([0,-thick,thick])
    cube([20,thick*2,6]);

    // hinge gap (camera side)
    difference() {
        for(i=[0:ceil(hinge_count/2)])
        translate([i*(2*hinge_width)-.25,(length-end_r*2)/2,-hinge_down], $fn=20)
        rotate([0,90,0])
        cylinder(hinge_width+.5, thick+.3, thick+.3);
        translate([0,(length-end_r*2)/2,-5]) cube([width,10,10]);
    }
        
    // hinge gap (wall side)
    difference() {
        union() {
            for(i=[0:floor(hinge_count/2)])
            translate([i*(2*hinge_width)+hinge_width-.25,(length-end_r*2)/2,-hinge_down], $fn=20)
            rotate([0,90,0])
            cylinder(hinge_width+.5, thick+.3, thick+.3);
            translate([0,(length-end_r*2)/2,0], $fn=20)
            rotate([0,90,0])
            cylinder(width, thick/2+.2, thick/2+.2);
        }
        translate([0,(length-end_r*2)/2-10,-5]) cube([width,10,10]);
    }

    translate([6,length/2+4,0]) mirror([0,1,0]) linear_extrude(.5) text("WALL", 4);
    translate([-7.3+width,14,0]) rotate([0,0,180]) mirror([0,1,0]) linear_extrude(.5) text("CAM", 4);
        
}

difference() {
    // hinge
    for(i=[0:hinge_count-1])
    translate([i*hinge_width+.15,(length-end_r*2)/2,-hinge_down], $fn=20)
    rotate([0,90,0])
    union() {
        cylinder(hinge_width-.3, thick, thick);
        for(i=[0:20:360]) {
            
            // -x side
            rotate([0,0,i-2]) translate([2.2,-teeth_w/4,-teeth_size]) cube([.7,teeth_w/2,teeth_size]);
            rotate([0,0,i+2]) translate([2.2,-teeth_w/4,-teeth_size]) cube([.7,teeth_w/2,teeth_size]);
            
            // +x side
            rotate([0,0,i+8]) translate([2.2,-teeth_w/4,hinge_width-.3]) cube([.7,teeth_w/2,teeth_size]);
            rotate([0,0,i+12]) translate([2.2,-teeth_w/4,hinge_width-.3]) cube([.7,teeth_w/2,teeth_size]);
        }
    }

    // hinge pin gap
    translate([0,(length-end_r*2)/2,-hinge_down], $fn=20)
    rotate([0,90,0])
    cylinder(width+2, thick/2+.2, thick/2+.2);
}


// hinge pin
translate([0,(length-end_r*2)/2,-hinge_down], $fn=20)
rotate([0,90,0])
cylinder(width, thick/2-.03, thick/2-.03);


