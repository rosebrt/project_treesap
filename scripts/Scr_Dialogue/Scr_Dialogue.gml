#region CUTSCENE FUNCTIONS ---------------------------------------------
function cutscene_pause(_time) {
	//TODO
}
function cutscene_focus(_inst_name) {
	var f = noone;
	for( var i = 0; i < instance_number(Obj_OWEntity); i++ ) {
		var o = instance_find(Obj_OWEntity, i);
		if( o.name == _inst_name) {
			f = o;
			break;
		}
	}
	
	if (f != noone)
		global.camera.focus = f;
}
function cutscene_shake(_time) {
	//TODO
}
function cutscene_charwalk(_inst_name, _x, _y, _speed) {
	//TODO
}
#endregion

#region CHATTERBOX USAGE ---------------------------------------------
function init_chatterbox() {
	ChatterboxLoadFromFile("default.yarn");
	
	// Add Chatterbox Functions
	ChatterboxAddFunction("get_quest_data",get_quest_data);
	ChatterboxAddFunction("set_quest_data",set_quest_data);
	ChatterboxAddFunction("focus",cutscene_focus);
	
}

function start_conversation(_yarn_file) {
	
	ChatterboxLoadFromFile(_yarn_file);
	var c = ChatterboxCreate(_yarn_file);
	var convo = instance_create_depth(0,0,0,Obj_Conversation);
	convo.chatterbox = c;
	ChatterboxJump(convo.chatterbox, "Start", _yarn_file);
	convo.chatterbox_update();
	convo.select_next_option(1,0);
	global.gamestate = gamestates.cutscene;
	
}
#endregion