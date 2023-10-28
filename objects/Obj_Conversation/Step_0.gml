// INPUTS -----------------------------------------
var select_button = player.interact;
if text_display_length == 0
	select_button = 0;
var key_dir = player.key_pressed_down - player.key_pressed_up;
var num_options = ChatterboxGetOptionCount(chatterbox);

// SELECT -----------------------------------------
// Cycle through the valid options and push the pointer that direction
if key_dir > 0 {
	for( var i = option_index + 1; i < num_options; i++ ) {
		if( ChatterboxGetOptionConditionBool(chatterbox, i) ) {
			option_index = i;
			break;
		}
	}
} else if key_dir < 0 {
	for( var i = option_index - 1; i >= 0; i-- ) {
		if( ChatterboxGetOptionConditionBool(chatterbox, i) ) {
			option_index = i;
			break;
		}
	}
}

// If a select button was pressed, advance accordingly
if (select_button) {
	if (text_display_length < string_length(text))
		text_display_speed = 3;
	else {
		selected = -1;
		if (num_options > 0) {
			selected = option_index;
		}
		advance(selected);
	}
}

// DRAWING -----------------------------------------
if (text_display_length < string_length(text))
	text_display_length = approach(text_display_length, string_length(text), text_display_speed);


// DESTROY -----------------------------------------
if ChatterboxIsStopped(chatterbox) {
	instance_destroy();
	global.gamestate = gamestates.overworld;
}