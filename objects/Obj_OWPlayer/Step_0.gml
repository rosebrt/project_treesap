#region INPUTS --------------------------------------------------

key_up =		keyboard_check(ord("W"));
key_left =		keyboard_check(ord("A"));
key_down =		keyboard_check(ord("S"));
key_right =		keyboard_check(ord("D"));

key_pressed_up =		keyboard_check_pressed(ord("W"));
key_pressed_left =		keyboard_check_pressed(ord("A"));
key_pressed_down =		keyboard_check_pressed(ord("S"));
key_pressed_right =		keyboard_check_pressed(ord("D"));

interact =		keyboard_check_pressed(ord("E"));

var x_input = key_left - key_right;
var y_input = key_down - key_up;


#endregion

#region GRID_MOVEMENT --------------------------------------------------

if( global.gamestate = gamestates.overworld ) {
	// If in animation, complete movement
	if(is_moving()) {
		move(grid_dir);
	} else {
		
		// If input
		if( x_input!=0 || y_input!=0) {
			//get dir
			if (x_input!=0)
				grid_dir = x_input + 1;
			else if(y_input!=0)
				grid_dir = y_input + 2;
				
			//check object in that dir
			if( !instance_facing(Obj_Wall) && !instance_facing(Obj_OWInteractable)) {
				// TODO loading zones & triggers
				set_move(grid_dir);
			}
		}
	}
}

#endregion

#region INTERACTION  --------------------------------------------------

if( interact && global.gamestate = gamestates.overworld ) {
	var _target = instance_facing(Obj_OWInteractable);
	if (_target != noone) {
		if( _target.object_index == Obj_NPC)
			_target.image_index = (grid_dir + 2)%4;
		
		_target.interact();
	}
}

#endregion

#region ANIMATION  --------------------------------------------------

if( global.gamestate = gamestates.overworld || global.gamestate = gamestates.cutscene) {
	//TODO animations
	image_index = grid_dir;
}

#endregion