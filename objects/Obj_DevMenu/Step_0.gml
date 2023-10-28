cam = view_camera[0];

view_size_h = camera_get_view_height(cam);
view_size_w = camera_get_view_width(cam);

surface_resize( application_surface, view_size_w, view_size_h );
display_set_gui_size(view_size_w, view_size_h);