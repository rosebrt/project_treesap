#region QUICK FUNCTIONS --------------------------------------
//TODO
function character_alive(_character_name) {
	return true;
}
function character_in_party(_character_name) {
	return true;
}
function item_in_inventory(_item_name) {
	return false;
}
function met_character(_character_name) {
	return true;
}
function been_to_realm(_realm) {
	return true;
}
#endregion

#region QUEST DATA --------------------------------------
function load_data() {
};
function get_quest_data(_var_string) {
	if( variable_global_exists(_var_string) )
		return variable_global_get(_var_string);
	return false;
}
function set_quest_data(_var_string, _value) {
	if( variable_global_exists(_var_string) )
		variable_global_set(_var_string, _value);
}

#region    /----- Test Quest -----\
global.READ_TEST_SIGN = false;
#endregion \----------------------/

#endregion