//Draw the Player

if (ds_exists(blur, ds_type_list)) {

	for(var i = 0; i < ds_list_size(blur); i++){
		var g = blur[| i];
		draw_sprite_ext(
			g.spr,
			g.img,
			g.p_x, g.p_y,
			g.scale_x, g.scale_y,
			g.angle,
			c_white,
			g.alpha
		)
	}
}	
// draw arrow percision marker
if ( mouse_check_button( mb_right) && can_arrow){
	var tri = draw_triangle(x, y, tri_pts[0], tri_pts[1], tri_pts[2], tri_pts[3], false);
}

//Draw the Player
draw_self();


//Draw the Player and rotate it based on mouse loaction

draw_sprite_ext(sFacing, 1, x, y, x_scale, y_scale, m_angle, c_white, visible);

