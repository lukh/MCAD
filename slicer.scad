// slice object.
// Vivien HENRY

module slicer(height, step, thickness, is_2d, inc, x_cnt_max, add_text, text_offset, text_size){
    if(!is_2d){
        for(i = [0:step:height]){
            translate([0, 0, i]) linear_extrude(thickness)
            projection(cut = true) translate([0, 0, -i]) children();
        }
    }
    else{
        for(i = [0:height/step]){
            x = inc[0] * (i % x_cnt_max);
            y = inc[1] * floor(i / x_cnt_max);

            translate([x, y, 0]){ 
                difference(){
                    projection(cut = true) translate([0, 0, -i*step]) children();
                    if(add_text){
                        translate(text_offset) text(str(i+1), text_size);
                    }
                }
            }
        }
    }
}

