//	Die
if( hp <= 0 ){
	
	repeat( 16 ){
		var _particle = instance_create_depth( x, y, depth, oParticle );
		_particle.colour = c_red;
	}
	
	instance_destroy();
}

// Update Depth
depth = -y;