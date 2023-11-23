#macro GRID_SIZE 24

enum gamestates {
	overworld,
	cutscene,
	paused_menu,
	battle
}

enum triggertypes {
	one_time,
	repeated,
	loading_zone
}

enum dir {
	right = 0,
	up = 1,
	left = 2,
	down = 3
}

#region COLORS -----------------------------------------------------------

enum wc {
	red,
	orange,
	yellow,
	green,
	blue
}

enum ct {
	light = 0,
	dark = 1,
}

function init_color() {

	global.colors = ds_grid_create(10,2);
	
	global.colors[# wc.red, ct.light] = #d50f0f;
	global.colors[# wc.red, ct.dark] = #7d0723;
	global.colors[# wc.orange, ct.light] = #f66822;
	global.colors[# wc.orange, ct.dark] = #922e0b;
	global.colors[# wc.yellow, ct.light] = #fbe846;
	global.colors[# wc.yellow, ct.dark] = #9a6d0d;
	global.colors[# wc.green, ct.light] = #6fd217;
	global.colors[# wc.green, ct.dark] = #057a0b;
	global.colors[# wc.blue, ct.light] = #37afe7;
	global.colors[# wc.blue, ct.dark] = #104e9a;

}

#endregion