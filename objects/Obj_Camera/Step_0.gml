// Planning
if(focus != noone) {
	xDest = focus.x;
	yDest = focus.y;
}

// Movement
if( xDest != x || yDest != y ) {
	x += 0.1*(xDest - x);
	y += 0.1*(yDest - y);
}

x = clamp(x,view_size_w_half, room_width - view_size_w_half );
y = clamp(y,view_size_h_half, room_height - view_size_h_half );

camera_set_view_pos(cam,x-view_size_w_half,y-view_size_h_half);