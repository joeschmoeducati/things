inner_w = 58;
outer_w = 62;
wall_t = (outer_w-inner_w)/2;
filter_h = 20;
slant = 15;
inset = tan(slant)*filter_h;
T = 2;
pipe_id = 26.4;


rotate([180,0,0])
union() {

    // catch shell
    translate([0,0,filter_h-1])
    difference() {
        union() {
            translate([-wall_t,-wall_t,0]) cube([outer_w+2*wall_t, outer_w+2*wall_t, filter_h]);
            for (i=[0,1]) for (j=[0,1])
            translate([i*outer_w,j*outer_w,filter_h-8]) difference() {
                cylinder(8,10,10);
                cylinder(9,6,6);
            }
        }
        translate([0, 0, -1]) cube([outer_w, outer_w, filter_h+2]);
    };


    // lip
    lip_t = sqrt(wall_t*wall_t + wall_t*wall_t);
    for (k=[0,1])
        rotate([0,0,k*90])
    for (j=[0,1])
        translate([j*outer_w,-k*outer_w,0])
        mirror([j,0,0])
    translate([-wall_t,0,filter_h])
    rotate([0,45,0])
    cube([lip_t,outer_w,lip_t]);

    // outer shell
    translate([0,0,-filter_h-5])
    difference() {
        union() {
            cube([outer_w, outer_w, 2*filter_h+5]);
            translate([outer_w/2, 0, pipe_id/2+3.9])
            rotate([120,0,0]) translate([0,0,-8]) cylinder(37,pipe_id/2,pipe_id/2);
        }
        translate([wall_t, wall_t, -1]) cube([inner_w, inner_w, 2*filter_h+20]);
        translate([outer_w/2, 3, pipe_id/2+5])
        rotate([120,0,0]) translate([0,.6,-10]) cylinder(50,pipe_id/2-2,pipe_id/2-2);
    };
    
    // lowest diverter
    for (i=[0,1]) mirror([i,0,0]) translate([-outer_w*i,0,0])
    translate([0,wall_t,.1-filter_h]) rotate([0,2,0]) cube([outer_w/2, 4, 2]);

    // side diverters
    for (i=[0,1]) translate([(outer_w-2*wall_t-4)*i,0,0])
    translate([wall_t,.1,-.2-filter_h-1]) rotate([2,0,0]) cube([4, outer_w-.1, 3]);

    // highest diverter
    for (i=[0,1]) mirror([i,0,0]) translate([-outer_w*i,outer_w-2*wall_t-4,1.8])
    translate([.1,wall_t,.05-filter_h-2]) rotate([0,-2,0]) cube([outer_w/2, 4, 4]);

    // slats
    for (k=[0,1])
        rotate([0,0,k*90])
    for (j=[0,1])
        translate([j*outer_w,-k*outer_w,0])
        mirror([j,0,0])
    for (i=[0:2:inner_w])
    translate([inset-.1,wall_t-.5+i,0])
    rotate([0,-slant,0])
    cube([2,1,filter_h]);

    // corner blocks
    for (i=[0,1])
    for (j=[0,1])
    translate([wall_t+i*(inner_w-inset),wall_t+j*(inner_w-inset),0])
    cube([inset,inset,1]);

    // inner chamber
    inside_w = inner_w-2*inset+4.3;
    translate([wall_t+inset-2,wall_t+inset-2,1-filter_h])
    difference() {
        cube([inside_w, inside_w, filter_h]);
        translate([T, T, -1]) cube([inside_w-2*T, inside_w-2*T, filter_h+2]);
    };


    // insert into bottom downspout
    translate([wall_t,wall_t,1-2*filter_h-5])
    difference() {
        cube([inner_w, inner_w, filter_h+5]);
        translate([2*wall_t, 2*wall_t, -1]) cube([inner_w-4*wall_t, inner_w-4*wall_t, filter_h+20]);
    for (i=[0,1]) for (j=[0,1])
        translate([i*inner_w,j*inner_w,0]) rotate([0,0,45]) translate([-4,-4,-1]) cube([8,8,filter_h]);
    };

    // bottom of drain
    translate([2*wall_t,2*wall_t,1-filter_h-T])
    difference() {
        cube([inner_w-2*wall_t, inner_w-2*wall_t, T]);
        translate([wall_t, wall_t, -1]) cube([inner_w-2*wall_t-2*wall_t, inner_w-2*wall_t-2*wall_t, T+2]);
    };

}