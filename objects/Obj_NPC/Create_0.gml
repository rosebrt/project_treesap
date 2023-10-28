/// @description Setup NPC Defaults
event_inherited();
yarn_file = "default.yarn"
interact = function() {
	start_conversation(yarn_file);
}