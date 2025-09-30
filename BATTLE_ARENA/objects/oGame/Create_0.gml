//	Initialise Game
game_set_speed( GAMESPEED, gamespeed_fps );

//	Create Cursor && Camera
instance_create_layer( mouse_x, mouse_y, "System", oCursor );
instance_create_layer( oPlayer.x, oPlayer.y, "System", oCamera );