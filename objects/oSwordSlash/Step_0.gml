#region Destroy instance after animation completes

	//Match animation coordiantes to player
	x = oPlayer.x;
	y = oPlayer.y;

	//Destroy instancee after anime ends
	if (image_index >= image_number - 1){
		instance_destroy();
	}

#endregion

#region		DEAL DAMAGE
	
	//	Collide with an Actor
	if( place_meeting( x, y, oActor ) ){
		
		//	Get ID of that Actor
		var _target = instance_place( x, y, oActor );
			
		//	Loop through hitList to make sure we didn't already hit this Target
		var _alreadyHit = false;
		for( var i = 0; i < array_length( hitList ); i ++ ){
			if( hitList[ i ] == _target ){
				_alreadyHit = true;
				break;
			}
		}
			
		//	If target has not been hit deal damage and add them to hitList
		if( _alreadyHit == false ){
				
			_target.hp -= damage
			array_push( hitList, _target );
		}
	}
	
#endregion