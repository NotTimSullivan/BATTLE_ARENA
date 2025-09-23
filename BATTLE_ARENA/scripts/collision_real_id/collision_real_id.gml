function collision_real_id(arg0, arg1, arg2){
	var x_offset = arg0;
	var y_offset = arg1;
	var obj = arg2;
	var collision_id = noone;
	
	for(var i = 0; i < instance_number(obj); i++){
		var obj_id = instance_find(obj, i)
		
		if bbox_top + y_offset < obj_id.bbox_bottom
		&& bbox_left + x_offset < obj_id.bbox_right
		&& bbox_bottom + y_offset > obj_id.bbox_top
		&& bbox_right + x_offset > obj_id.bbox_left{
			collision_id = obj_id;
		}
	}
    return collision_id;
}