#region INPUTS --------------------------------------------------

key_up =		keyboard_check(ord("W"));
key_left =		keyboard_check(ord("A"));
key_down =		keyboard_check(ord("S"));
key_right =		keyboard_check(ord("D"));

interact =		keyboard_check_pressed(ord("F"));

var x_input = key_right - key_left;
var y_input = key_down - key_up;

#endregion

#region COLLISION --------------------------------------------------

var x_speed = max_speed * x_input;
var y_speed = max_speed * y_input;
var total_speed = point_distance(0,0,x_speed,y_speed);

if(total_speed > max_speed) {
	x_speed *= (max_speed/total_speed);
	y_speed *= (max_speed/total_speed);
}

// TODO collisions

#endregion

#region INTERACTION  --------------------------------------------------

if( global.gamestate = gamestates.overworld ) {
	// TODO interactions
}

#endregion

#region FINAL MOVEMENT  --------------------------------------------------

if( global.gamestate = gamestates.overworld ) {
	x += x_speed;
	y += y_speed;
}

#endregion

#region ANIMATION  --------------------------------------------------

if( global.gamestate = gamestates.overworld || global.gamestate = gamestates.cutscene) {
	//TODO animations
}

#endregion