/// @description Initialize Player
event_inherited();

//INPUTS
key_up =		keyboard_check(ord("W"));
key_left =		keyboard_check(ord("A"));
key_down =		keyboard_check(ord("S"));
key_right =		keyboard_check(ord("D"));
interact =		keyboard_check_pressed(ord("E"));

//MOVEMENT
grid_dir = dir.right;
move_speed = 2;
goal_x = x;
goal_y = y;

function is_moving() {
	return goal_x != x || goal_y != y;
}

function set_move(_dir) {
	switch (_dir) {
	    case dir.right:
		goal_x = x + GRID_SIZE;
	        break;
		case dir.up:
		goal_y = y - GRID_SIZE;
	        break;
		case dir.left:
		goal_x = x - GRID_SIZE;
	        break;
		case dir.down:
		goal_y = y + GRID_SIZE;
	        break;
	    default:
	        break;
	}
}

function move(_dir) {
	x = approach(x,goal_x,move_speed);
	y = approach(y,goal_y,move_speed);
}

//INTERACTION
interaction_distance = 18;

function instance_facing(_obj) {
	var dx = lengthdir_x(24,dir_to_angle(grid_dir));
	var dy = lengthdir_y(24,dir_to_angle(grid_dir));
	
	return instance_position(x+dx,y+dy,_obj);
}