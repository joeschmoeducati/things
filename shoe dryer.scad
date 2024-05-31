w = 60.5;
d = 82;
r = 120;
fan_h = 11.2/2;
fan_corner_r = 5;
wire_r = 3.5/2;
screw_r = 3.5/2;

module rounded_cube() {
  translate([-w/2+fan_corner_r,-w/2+fan_corner_r,0]) {
    minkowski() {
      cylinder(r=fan_corner_r,h=fan_h);
      cube([w-fan_corner_r*2,w-fan_corner_r*2,fan_h]);
    }
  }
}

module pie_slice(a, r, h) {
  rotate_extrude(angle=a) square([r,h]);
}

module main() {
  intersection() {
    //translate([0,0,-w/2+1]) cube([1000,1000,w-2]);
    translate([0,0,-w/2]) pie_slice(45,300,w);
    difference() {
      rotate_extrude($fn=100) translate([r, 0, 0]) circle(r = d/2+2, $fn=100);
      rotate_extrude() translate([r, 0, 0]) circle(r = 56/2);
      translate([r,0,0]) rotate([-90,0,0]) rounded_cube();
      for(i=[0,1]) translate([r,fan_h*2+i+.7,-100]) cylinder(100,wire_r,wire_r, $fn=20);
      for(i=[-1,1]) for(j=[-1,1]) 
      translate([r+i*(w/2-fan_corner_r),0,j*(w/2-fan_corner_r)]) rotate([-90,0,0]) cylinder(fan_h*2+10,screw_r,screw_r, $fn=20);
    }
  }
}

//rounded_cube();
main();