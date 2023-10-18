/// @description Setup Conversation Customizables

current_line = new line("Test Speaker", "This is a test", noone);
ending_action = function() {}; //called at the end of the conversation

function add_lines(_speaker, _color, _text, _responses) {
	
	//TODO - delimit _text by some escape character and create a number of lines, returning the first one.
	
	if(string_length(_text) > 256)
		show_error("Error: String too long - [" + string_copy(_text,1,10) + "]", true);
	
	return new line(_speaker, _color, _text, _responses);
}