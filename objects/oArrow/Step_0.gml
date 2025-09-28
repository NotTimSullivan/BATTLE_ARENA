#region		DEAL DAMAGE
	
	//	Collide with something
	if( place_meeting( x, y, oCollision ) ){
		
		//	Get ID of that something
		var _target = instance_place( x, y, oCollision );
		
		//	Decide what we hit
		var _parent = object_get_parent( _target.object_index );
		switch( _parent ){
			
			//	Target is a child of oActor
			case oActor:
				//	Loop through hitList to make sure we didn't already hit this Target
				var _alreadyHit = false;
				for( var i = 0; i < array_length( hitList ); i ++ ){
					if( hitList[ i ] == _target ){
						_alreadyHit = true;
						break;
					}
				}
			
				//	If target has not been hit deal damage and kill yourself
				if( _alreadyHit == false ){
			
					_target.hp -= damage
					instance_destroy();
			
				}
			break;
			
			//	Target is not an Actor
			default:
				
				//	Check if we can fly over this object
				if( !_target.arrowPassable ){
				
					//	Explode
					repeat( 12 ){
						var _particle = instance_create_depth( x, y, depth, oParticle );
						_particle.colour = c_orange;
					}
					instance_destroy();
				}
				
		}
	}
	
#endregion

//	Move
x += lengthdir_x( spd, dir );
y += lengthdir_y( spd, dir );

//	Update Depth
depth = -y - 10;