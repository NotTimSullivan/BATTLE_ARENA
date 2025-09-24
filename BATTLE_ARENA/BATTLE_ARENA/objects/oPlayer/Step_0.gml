#region Move Player

	//Declare Local variable
	var xaxis, yaxis, len, dir;
	
	//Determine movement along axis
	xaxis = ( D_HELD - A_HELD );
	yaxis = ( S_HELD - W_HELD );
	
	//Get Direction
	dir = point_direction(0,0,xaxis,yaxis);

	//Get movement length
	if (xaxis !=0 || yaxis != 0){
		len = spd;
	} else len = 0;
	
	//Set movement
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);
	
	//	Check for Collision
	while( abs( hspd ) > 0 && place_meeting( x + hspd, y, oCollision )) {
        hspd -= sign(hspd);
    }

	while( abs( vspd ) > 0 && place_meeting( x, y + vspd, oCollision )) {
        vspd -= sign(vspd);
	}
	
	//	Apply Movement
	x += hspd;
	y += vspd;
		
#endregion


#region Mouse direction and angle

	//Set mouse Coordinates variable
	m_x = oCursor.x;
	m_y = oCursor.y;

	//Set agnle between player and mouse
	m_angle = point_direction(x, y, m_x, m_y);



#endregion

#region Trigger Attack on left click

	if (mouse_check_button_pressed(mb_left)){
		var attack = instance_create_layer(x, y, "Actors", oSwordSlash);
		attack.image_angle = m_angle;
	}

#endregion


