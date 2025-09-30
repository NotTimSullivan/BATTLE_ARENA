/// triangle_points_facing(x0, y0, theta, h, facing)
/// @param x0     apex x
/// @param y0     apex y
/// @param theta  angle at apex (degrees)
/// @param h      altitude (height)
/// @param facing direction the triangle points (degrees)
/// @return [Bx, By, Cx, Cy]

function triangle_points_facing(x0, y0, theta, h, facing)
{
    var half_base = h * tan(degtorad(theta / 2));

    // altitude unit vector: points in "facing" direction
    var ux = dcos(facing);
    var uy = dsin(facing);

    // foot of altitude
    var Dx = x0 + h * ux;
    var Dy = y0 + h * uy;

    // perpendicular unit vector
    var vx = -uy;
    var vy = ux;

    // base points
    var Bx = Dx + half_base * vx;
    var By = Dy + half_base * vy;
    var Cx = Dx - half_base * vx;
    var Cy = Dy - half_base * vy;

    return [Bx, By, Cx, Cy];
}

// sends out and arrow
function arrow_attack() {
	var _arrow = instance_create_depth( x, y, depth, oArrow );
	var a_dir = binomial_arrow_dir(arrow_angle/2);
	_arrow.dir			= m_angle + a_dir;
	_arrow.image_angle	= m_angle + a_dir;
	_arrow.image_index	= 0;
	array_push( _arrow.hitList, id );
	arrow_angle = 45;
	
	canAttack -= attackCooldown;
}
//determins a binomial distribution of the angle to send the arrow
function binomial_arrow_dir(n) {

    var k = 0;
    for (var i = 0; i < n; i++) {
        if (random(1) < 0.5) {
            k += 1;
        }
    }
    return 2 * k - n;
}
