// drawing
camera = global.camera;
player = instance_nearest(0,0,Obj_OWPlayer);

// basics
chatterbox = noone;
node = noone;
speaker = noone;
text = "empty";
option_index = 0;
current_color = wc.blue;

text_display_length = 0;
text_display_speed = 0.5;

// functions
function chatterbox_update() {
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContentSpeech(chatterbox, 0);
	speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	current_color = string_to_color(ChatterboxGetContentSpeakerData(chatterbox, 0));
}

function advance(_option) {
	if(_option != -1)
		ChatterboxSelect(chatterbox, _option);
	else
		ChatterboxContinue(chatterbox);
	chatterbox_update();
	option_index = 0;
	text_display_length = 0;
	text_display_speed = 0.5;
	
	select_next_option(1,0);
}

function select_next_option(_dir,_offset) {
	var num_options = ChatterboxGetOptionCount(chatterbox);
	if _dir > 0 {
	for( var i = option_index + _offset; i < num_options; i++ ) {
		if( ChatterboxGetOptionConditionBool(chatterbox, i) ) {
			option_index = i;
			break;
		}
	}
	} else if _dir < 0 {
		for( var i = option_index - _offset; i >= 0; i-- ) {
			if( ChatterboxGetOptionConditionBool(chatterbox, i) ) {
				option_index = i;
				break;
			}
		}
	}
}

V_MARGIN = 10;
H_MARGIN = 6;
V_PAD = 6;
H_PAD = 6;
LINE_HEIGHT = 9;
NAME_H_PAD = 4;