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
	
	//Apply movement
	x += hspd
	y += vspd


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


