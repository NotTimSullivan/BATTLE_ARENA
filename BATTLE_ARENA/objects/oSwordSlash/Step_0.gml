#region Destroy instance after animation completes

	//Match animation coordiantes to player
	x = oPlayer.x;
	y = oPlayer.y;

	//Destroy instancee after anime ends
	if (image_index >= image_number - 1){
		instance_destroy();
	}

#endregion