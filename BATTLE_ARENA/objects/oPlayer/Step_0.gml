#region Move Player

	//Declare Local variable
	var xaxis, yaxis, len;
	
	//Determine movement along axis
	xaxis = ( D_HELD - A_HELD );
	yaxis = ( S_HELD - W_HELD );
	
	dir = point_direction(0,0,xaxis,yaxis);
	
	//Check if dashing and direction
	if (SPACE_PRESSED && can_dash && (xaxis != 0 || yaxis != 0)){
		can_dash = false;
		is_dashing = true;
		alarm_set(0, dash_cooldown);
	}

	//Get movement length and direction
	if ((xaxis !=0 || yaxis != 0) && !is_dashing){
		len = spd;
	} else if(is_dashing){
		len = dash_spd;
		var ghost = {
			
			spr: sprite_index,
			img: image_index,
			p_x: x,
			p_y: y,
			angle: 0,
			scale_x: x_scale,
			scale_y: y_scale,
			alpha: 1	
		};
		ds_list_add(blur, ghost)
		

		if (dash_length <= 0) {
			is_dashing = false;	
		}
		dash_length -= 1;
	} else len = 0;
	
	for (var i = ds_list_size(blur) - 1; i >= 0; i--) {
		var g = blur[| i];
		g.alpha -= .125
		if (g.alpha <= 0) {
			ds_list_delete(blur, i);
		} else blur[| i] = g;
	}
	
	//Set movement
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);
	
#region		COLLISION CHECK
	
		//	No Bounce in X
		var _checkHspd = ceil( abs( hspd ) ) * sign( hspd );
		if( place_meeting( x + _checkHspd, y, oCollision ) ){
			for( var i = abs( _checkHspd ); i >= 0; i -- ){
				var _tempHspd = i * sign( hspd );
				if( !place_meeting( x + _tempHspd, y, oCollision ) ){
					hspd = _tempHspd;
					break;
				}
			}
		}
		
		//	No Bounce in Y
		var _checkVspd = ceil( abs( vspd ) ) * sign( vspd );
		if( place_meeting( x, y + _checkVspd, oCollision ) ){
			for( var i = abs( _checkVspd ); i >= 0; i -- ){
				var _tempVspd = i * sign( vspd );
				if( !place_meeting( x, y + _tempVspd, oCollision ) ){
					vspd = _tempVspd;
					break;
				}
			}
		}
	
		/*
		//	Old Check for Collision		Was giving a bounce when moving diagonally
		while( ceil( abs( hspd ) ) > 0 && place_meeting( x + hspd, y, oCollision )) {
	        hspd -= sign(hspd);
	    }

		while( ceil( abs( vspd ) ) > 0 && place_meeting( x, y + vspd, oCollision )) {
	        vspd -= sign(vspd);
		}
		*/
#endregion
	
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

//	Check that weapon has cooled down
if( canAttack ){
	
	//	Create Attack Object
	if (mouse_check_button_pressed(mb_left)){
		
		var attack = instance_create_depth(x, y, depth, oSwordSlash);
		attack.image_angle	= m_angle;
		attack.damage		= damage;
		array_push( attack.hitList, id );
		
		//	Set Cooldown
		canAttack -= attackCooldown;
		
	}
	
} else canAttack ++;


//This will draw a triangle to determine angle
if (can_arrow) {
	//gets coordinates of marker
	if( mouse_check_button(mb_right) && can_arrow){
		tri_pts = triangle_points_facing(x, y, arrow_angle, range, -m_angle);
		if (arrow_angle != 0){
			arrow_angle -= 1
		} else {
			arrow_attack();
		}

	}


//							TESTING ARROWS WITH RIGHT MOUSE BUTTON
//	Shoot Arrow
	if( mouse_check_button_released( mb_right ) ){
		var _arrow = instance_create_depth( x, y, depth, oArrow );
		var a_dir = binomial_arrow_dir(arrow_angle/2);
		_arrow.dir			= m_angle + a_dir;
		_arrow.image_angle	= m_angle + a_dir;
		_arrow.image_index	= 0;
		array_push( _arrow.hitList, id );
		arrow_angle = 45;
		
		//	Set Cooldown
		can_arrow -= arrow_cooldown;
	}
} else can_arrow ++;
#endregion

#region		SPRITE CONTROL

//	Sprite Control
sprite_index = spriteRight;
if( m_angle >= 45	&& m_angle <= 135 ) sprite_index = spriteUp;
if( m_angle > 135	&& m_angle < 225 )	sprite_index = spriteLeft;
if( m_angle >= 225	&& m_angle <= 315 ) sprite_index = spriteDown;

//	Animate if Moving
if( hspd != 0 || vspd != 0 ){
	
	//	Set Depth
	depth = -y;
	
	//	Animate sprite
	image_speed = 1;
	
} else {
	
	//	Not Moving
	image_speed = 0;
	image_index = 0;
	
}

#endregion