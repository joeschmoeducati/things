use <../boxes.scad>

fudge = 0.1;

slotWidth = 1.5;
mountHeight = 2;

//roundedBox([27.5, 59, 3], 1.5, true);

translate([5,-33,0]) {
    difference() {
        translate([16.5,33,2]) roundedBox([33, 66, 4], 2, true);
        translate([2.5,3,0]) cube([28, 60, 4]);
    }
    
    // switch
    translate([4,4.5,0]) cube([25, 57, 2]);
    translate([4,4.5,0]) cube([1, 50, 4]);
    translate([4,58.8,0.8]) rotate([75,0,0]) cube([1, 2, 5]);
    translate([28,4.5,0]) cube([1, 50, 4]);
    translate([28,58.8,0.8]) rotate([75,0,0]) cube([1, 2, 5]);
    
    // switch hinge
    translate([4,4.5,0]) cube([25, 3, 4]);
    translate([4,0,3.5]) cube([25, 7, .5]);
    
    // tabs
    translate([1,11,3.5]) cube([.5, 8, mountHeight]);
    translate([1,47,3.5]) cube([.5, 8, mountHeight]);
    translate([31.5,11,3.5]) cube([.5, 8, mountHeight]);
    translate([31.5,47,3.5]) cube([.5, 8, mountHeight]);
}

translate([-5-35,-53,0]) {
//    cube([35, 106, 1]);
    difference() {
        cube([35, 106, mountHeight]);
        
        // slots
        translate([2.25-slotWidth/2,30,0]) cube([slotWidth, 10, mountHeight]);
        translate([2.25-slotWidth/2,66,0]) cube([slotWidth, 10, mountHeight]);
        translate([32.75-slotWidth/2,30,0]) cube([slotWidth, 10, mountHeight]);
        translate([32.75-slotWidth/2,66,0]) cube([slotWidth, 10, mountHeight]);
        
        // rocker travel
        translate([3.5,21,0]) cube([28, 50, mountHeight]);
        
        // switch hole
//        translate([15.5,78,0]) cube([4, 4, 2]);
        translate([17.5,79,0]) cylinder(h=mountHeight, r=2.5, center=false);
        
        // 83 c2c
        translate([16.5,11.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([18.5,11.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([16.5,9,0]) cube([2, 5, mountHeight]);
        translate([16.5,94.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([18.5,94.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([16.5,92,0]) cube([2, 5, mountHeight]);
        
        // 97 c2c faceplate screw holes
        translate([17.5,4.5,0]) cylinder(h=mountHeight, r=1.75, center=false);
        translate([17.5,101.5,0]) cylinder(h=mountHeight, r=1.75, center=false);
    }
}
