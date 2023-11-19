focus = instance_nearest(0,0,Obj_OWPlayer);
cam = view_camera[0];
xDest = focus.x;
yDest = focus.y;

view_size_h = camera_get_view_height(cam);
view_size_w = camera_get_view_width(cam);
view_size_h_half = view_size_h/2;
view_size_w_half = view_size_w/2;

surface_resize( application_surface, view_size_w, view_size_h );
display_set_gui_size(view_size_w, view_size_h);