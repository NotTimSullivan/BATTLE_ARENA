#region		FOLLOW PLAYER

	//	Declare Local Variables
	var xaxis, yaxis, len, dir;

	//	Determine movement along axis 
	xaxis = ( oPlayer.x - x );
	yaxis = ( oPlayer.y - y );

	//	Get Direction
	dir = point_direction( 0, 0, xaxis, yaxis );

	//	Get Movement Length
	if( xaxis != 0  || yaxis != 0 ){
		len = point_distance( 0, 0, xaxis, yaxis );
	} else len = 0;

	//	Set Movement
	hspd = lengthdir_x( len, dir );
	vspd = lengthdir_y( len, dir );

	//	Apply Movement
	x += hspd;
	y += vspd;
	
#endregion