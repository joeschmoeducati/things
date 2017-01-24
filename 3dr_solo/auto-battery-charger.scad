use <../boxes.scad>
use <deans-female-connector-housing.scad>

boxWidth = 80;
boxThickness = 2;
boxHeight = 30;
externalScrewHoleR = 1.5;
externalScrewHoleInset = 2;

difference() {
    roundedBox([boxWidth, boxWidth, boxHeight], 4, true);

    // vents
    for (j=[0,90,270]) {
        rotate([0,0,j]) {
            for (i=[-30:6:30]) {
                translate([i,-boxWidth/2,0]) {
                    cube([1,boxThickness*2,boxHeight-8], true);
                }
            }
        }
    }
    rotate([0,0,180]) {
        for (i=[-30:6:30]) {
            translate([i,-boxWidth/2,8]) {
                cube([1,boxThickness*2,boxHeight-8-16], true);
            }
        }
    }

    translate([0,0,boxThickness]) {
        
        // main cutout
        x = boxWidth-(boxThickness+externalScrewHoleR+externalScrewHoleInset+1)*2;
        cube([x, boxWidth-boxThickness, boxHeight], true);
        cube([boxWidth-boxThickness, x, boxHeight], true);
        
        // 12v in insert cutout
        translate([-18,-boxWidth/2,-10]) {
            cube([3,boxThickness,6], true);
        }
    
        // screw holes
        for (i=[-1,1]) {
            for (j=[-1,1]) {
                translate([i*(boxWidth/2-(externalScrewHoleR+externalScrewHoleInset)),j*(boxWidth/2-(externalScrewHoleR+externalScrewHoleInset)),0]) {
                    cylinder(h = boxHeight, r1 = externalScrewHoleR, r2 = externalScrewHoleR, center = true);
                }
            }
        }

        // deans cutout
        for (i=[-3,-1,1,3]) {
            translate([i*8,boxWidth/2,-7]) {
                cube([11,boxThickness,16], true);
            }
        }

    }
}

// 12v in insert
translate([-18,-boxWidth/2+1,-10+boxThickness]) {
    difference() {
        cube([8,boxThickness,10], true);
        roundedBox([3,boxThickness*2,6], 1, false);
    }
}

postsX = 53/2;
postsY = 37/2;

translate([0,-8,-boxHeight/2+boxThickness]) {
    for (i=[-postsX,postsX]) {
        for (j=[-postsY,postsY]) {
            translate([i,j,0]) {
                difference() {
                    cylinder(h = 4, r1 = 2.5, r2 = 2.5, center = false);
                    cylinder(h = 5, r1 = externalScrewHoleR, r2 = externalScrewHoleR, center = false);
                }
            }
        }
    }
}

for (i=[-3,-1,1,3]) {
    translate([i*8,boxWidth/2-boxThickness-1,-boxHeight/2+boxThickness+8]) {
        rotate([-90,0,0]) {
            deansFemaleHousing();
        }
    }
}