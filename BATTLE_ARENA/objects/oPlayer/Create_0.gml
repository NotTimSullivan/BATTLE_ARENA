//	Movement Variables
hspd = 0;
vspd = 0;
spd = 2;
dir = 0;

//	Combat Variables
canAttack = true;
attackCooldown = GAMESPEED div 2;
damage = 10;

//Define and set mouse Coordinates variable
m_x = 0;
m_y = 0;
m_angle = 0;

//Define X and X Scale
x_scale = 1;
y_scale = 1;

//	Drawing Variables
spriteRight	= sCharSwordR;
spriteUp	= sCharSwordU;
spriteLeft	= sCharSwordL;
spriteDown	= sCharSwordD;

sprite_index = spriteDown;
image_speed = 0;
image_index = 0;

//Dash Variables
is_dashing = false;
dash_cooldown = 60; //1 seconds in frames
dash_length = 8; //dash length in frames
can_dash = true;
dash_spd = 8;

// blur trail
blur = ds_list_create();

//aim triangle
arrow_angle = 45;
range = 50;
tri_pts = [];
can_arrow = true;
arrow_cooldown = GAMESPEED div 2;
