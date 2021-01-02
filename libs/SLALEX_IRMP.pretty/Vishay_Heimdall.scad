pins_per_row = 4;
pin_step = 1.27;
pin_w = 0.5;
pin_th = 0.2;
pin_l = 1;
pin_h = 1.2;

delta = 0.01;

case_w = 6.8;
case_l = 2.5;
case_h = 3;
case_co_rear = case_h - 0.8;
lens_r = 1.3;
lens_h = 1.7;
lens_dist = 3.4;
lens_off_y = 1;
lens_co_w = 2.2;

module pin(_x,_y,_z)
{
	translate([-_x/2,-_y/2,0])
		cube([_x,_y,_z]);
};

module pins_array(_cnt, _distance)
{
    translate([-_distance*(_cnt-1)/2,0,0])
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
            color("#F0B030")
                translate([_distance*_i,-pin_l/2,0])
                    pin(pin_w,pin_l,pin_th);
            color("#F0B030")
                translate([_distance*_i,-pin_l+pin_th,pin_h/2])
                    rotate([90,0,0])
                        pin(pin_w,pin_h,pin_th);
		}
	}
}

module case()
{
    translate([0,-pin_l,0])
    difference()
    {
        color("#303030")
            translate([-case_w/2,0,0])
                cube([case_w,case_l,case_h]);

        color("#303030")
        translate([-pins_per_row*pin_step/2,-delta,-delta])
            cube([pins_per_row*pin_step,pin_l,pin_th+delta]);

        color("#303030")
            translate([-pins_per_row*pin_step/2,-delta,-delta])
                cube([pins_per_row*pin_step,pin_th+delta,case_co_rear]);
    }
    difference()
    {
        union()
        {
            color("#303030")
                translate([-lens_dist/2,lens_off_y,lens_h])
                    rotate([90,0,0])
                        sphere(r=lens_r, $fn=30);
            color("#303030")
                translate([lens_dist/2,lens_off_y,lens_h])
                    rotate([90,0,0])
                        sphere(r=lens_r, $fn=30);
            
        }
        color("#303030")
            translate([-lens_co_w/2,lens_off_y-lens_r,0])
                cube([lens_co_w,lens_r*2,case_h]);
    }
}

union()
{   
    // Array1 of pins
    pins_array(pins_per_row,pin_step);
    
    // Draw case
    case();
};