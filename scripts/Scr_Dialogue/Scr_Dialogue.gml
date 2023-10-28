#region CUTSCENE FUNCTIONS ---------------------------------------------
function cutscene_pause(_time) {
	//TODO
}
function cutscene_focus(_instance, _time) {
	//TODO
}
function cutscene_shake(_time) {
	//TODO
}
function cutscene_charwalk(_instance, _x, _y, _speed) {
	//TODO
}
#endregion

#region CHATTERBOX USAGE ---------------------------------------------
function init_chatterbox() {
	ChatterboxLoadFromFile("default.yarn");
	
	// Add Chatterbox Functions
	
}

function start_conversation(_yarn_file) {
	
	ChatterboxLoadFromFile(_yarn_file);
	var c = ChatterboxCreate(_yarn_file);
	var convo = instance_create_depth(0,0,0,Obj_Conversation);
	convo.chatterbox = c;
	ChatterboxJump(convo.chatterbox, "Start", _yarn_file);
	convo.chatterbox_update();
	global.gamestate = gamestates.cutscene;
	
}
#endregion