angle += 2*spin;

x += lengthdir_x( spd, dir );
y += lengthdir_y( spd, dir );

img += imgSpd / GAMESPEED;
if( img > sprite_get_number( sprite_index ) ) instance_destroy();