module slicer(height, step, thickness){
    for(i = [0:step:height]){
        translate([0, 0, i]) linear_extrude(thickness)
        projection(cut = true) translate([0, 0, -i]) children();
    }
}

