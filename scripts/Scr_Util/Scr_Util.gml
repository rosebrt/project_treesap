function approach(_start, _end, _step){
	if (_start < _end)
	    return min(_start + _step, _end); 
	return max(_start - _step, _end);
}

function wrap(_val, _min, _max) {
	var width = abs(_max - _min);
	if (_val > _max) {
		//var dif = (_val - _max) % width;
		return _min; 
	} else if (_val < _min) {
		//var dif = (_min - _val) % width;
		return _max; 
	}else return _val;
}

function get_color(_color,_type) {
	return global.colors[# _color, _type];
}

function instance_nearest_notme(x,y,_obj) {
	x += 100000;
	var inst = instance_nearest(x-100000,y,_obj);
	x -= 100000;
	if( inst != self )
		return inst;
	return noone;
}

function string_to_color(_string) {
	var _color = wc.red;
	
	_string = string_lower(_string);
	
	switch (_string) {
		case "red":
			_color = wc.red;
			break;
		case "orange":
			_color = wc.orange;
			break;
		case "yellow":
			_color = wc.yellow;
			break;
		case "green":
			_color = wc.green;
			break;
		default:
		case "blue":
			_color = wc.blue;
			break;
	}
	
	return _color;
}