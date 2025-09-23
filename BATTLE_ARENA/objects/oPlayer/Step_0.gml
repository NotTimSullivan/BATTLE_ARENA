#region Move Player

	//Declare Local variable
	var right_key, left_key, up_key, down_key, xaxis, yaxis, len, dir;

	//Create key variables
	right_key = keyboard_check(ord("D"));
	left_key = keyboard_check(ord("A"));
	up_key = keyboard_check(ord("W")); 
	down_key = keyboard_check(ord("S"));
	
	//Determine movement along axis
	xaxis = (right_key - left_key);
	yaxis = (down_key - up_key);
	
	//Get Direction
	dir = point_direction(0,0,xaxis,yaxis);

	//Get movement length
	if (xaxis !=0 || yaxis != 0){
		len = spd;
	} else len = 0;
	
	//Set movement
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);
	
	//sprite bbox variables
	var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1;
	var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
	var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index) + 1;
	
	//Collision
	//Horizontal
	for(var h=0; h<=ceil(abs(hspd));h++){
		var wall_x = collision_real_id(h*sign(hspd), y_offset, oObstacle);
		if wall_x != noone {
			var wall_left = wall_x.bbox_left;
			var wall_right = wall_x.bbox_right;
			if x < wall_left {
				snap_x = wall_left-sprite_bbox_right;
			} else if x > wall_right {
				snap_x = wall_right-sprite_bbox_left;
			}
			hspd = 0;
		}
	}
	
	//Verical
	for(var v=0; h<=ceil(abs(vspd));v++){
		var wall_y = collision_real_id(x_offset, v*sign(vspd), oObstacle);
		if wall_y != noone {
			var wall_top = wall_y.bbox_top;
			var wall_bottom = wall_y.bbox_bottom;
			if y < wall_top {
				snap_y = wall_top-sprite_bbox_bottom;
			} else if y > wall_bottom {
				snap_y = wall_bottom-sprite_bbox_top;
			}
			vspd = 0;
		}
	}	
	
	
	
	//Apply movement
	x += hspd
	y += vspd
	if snap_x != 0 x = snap_x;
	if snap_y != 0 y = snap_y;

#endregion

#region Mouse direction and angle

	//Set mouse Coordinates variable
	m_x = mouse_x;
	m_y = mouse_y;

	//Set agnle between player and mouse
	m_angle = point_direction(x, y, m_x, m_y);



#endregion

#region Trigger Attack on left click

	if (mouse_check_button_pressed(mb_left)){
		var attack = instance_create_layer(x, y, "Actors", oSwordSlash);
		attack.image_angle = m_angle;
	}

#endregion


