$fn=128;

nestDiameter=70.5;
gatDiameter=28;
schroefgatDiameter=5.90;
laagdikte=5.8;
padding=40;
insparingDiameter=84.70;

mirror([0,0,180])
alles();

module alles()
{
    union()
    {
        difference()
        {
            afdekplaat();
            gat();
            schroefgat_rechts();
            schroefgat_links();
            
            //holte midden
            translate([0,0,-0.1])
            linear_extrude(laagdikte)
            circle(d = 45);
            
            difference()
            {
                translate([0,0,-0.1])
                linear_extrude(laagdikte)
                circle(d = 119);
                
                
                translate([0,0,-1]) 
                linear_extrude(laagdikte+1)
                circle(d = 80);
            }
            
            draadgoot();
            mirror()
            draadgoot();
            
            translate([0,0,-1])
            plakplatos();
        }

        plakplatos();
        
        color("purple") union(){
            schroefring_rechts();
            schroefring_links();
        }
    }
}


module nest()
{
    color("black", 0.5)
    translate([0,0,laagdikte+1])
    linear_extrude(5.55)
    circle(d=75.50);

    color("darkgrey", 1)
    translate([0,0,laagdikte+1+5.55])
    linear_extrude(22.22)
    circle(d=83.85);
}




module plakplatos()
{
    plakplato();
    mirror([0,1,0])
    plakplato();
}


module plakplato()
{
translate([0,40,1])
linear_extrude(laagdikte-1)
square([60,20], center = true);
}

module draadgoot()
{
    translate([0,0,(laagdikte/2)])
    rotate([15,90,00])
    cylinder(100, d=4.5, center=true);
}









module afdekplaat()
{
    color("white", 1)
    difference()
    {
        color("orange") ring();
        color("green") insparing();
    };
}

module gat()
{
    translate([0,0,-laagdikte*3])
    linear_extrude(laagdikte*5)
    circle(d = gatDiameter);
}

module insparing()
{
    translate([0,0,laagdikte+1])
    linear_extrude(laagdikte*2, scale = 1.1)
    circle(d = insparingDiameter);
}



module schroefgat_rechts()
{
    translate([(nestDiameter/2)-schroefgatDiameter,0,0])
    {
        cylinder(r=4, h=7, $fn=6);
    }
}

module schroefring_rechts()
{
    translate([(nestDiameter/2)-schroefgatDiameter,0,laagdikte-1])
    {
        difference()
        {
            linear_extrude(2)
            circle(d = 10);
                
            linear_extrude(2)
            circle(d = 5);
        }

    }
}

module schroefring_links()
{
    mirror()
    schroefring_rechts();
}


module schroefgat_links()
{
    mirror()
    schroefgat_rechts();
}


//Ring
module ring()
{
        linear_extrude((laagdikte*3)-4 , scale = 0.9)
        circle(d = insparingDiameter + padding);
}