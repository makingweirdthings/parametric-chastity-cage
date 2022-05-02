include <handyfunctions.scad>

cylinder_radius = 3.5;
// count from one edge unlocked to the other edge in locked position:
locking_cam_turn_radius = 120;

module stealth_lock(slop=0) {
  union() {
    // circle:
    rx(90) cylinder(r=cylinder_radius+slop, h=19);
    // rectangle:
    dx(-1.6-slop) dy(-19) dz(-8.1-slop) cube([3.2+2*slop, 19, 8.1+slop]);
    // what the thing moves through:
    ry(90) rx(90) rotate_extrude(angle=-locking_cam_turn_radius) {
      square([8.1+slop, 7+slop]);
    }
  }
}