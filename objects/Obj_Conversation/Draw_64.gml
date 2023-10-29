if (IsChatterbox(chatterbox) and text != undefined) {

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(Fnt_Small);
	
	var num_options = ChatterboxGetOptionCount(chatterbox);
	var _text_w = camera.view_size_w - (2*H_PAD) - (2*H_MARGIN);
	var _text_h = string_height_ext(text,LINE_HEIGHT,_text_w);
	var _name_w = string_width(speaker);
	var _light_color = get_color(current_color,ct.light);
	var _dark_color = get_color(current_color,ct.dark);
	
	if( num_options == 0 ) { //standard textbox -----------------------------------
		
		var _x1 = H_MARGIN;
		var _y1 = camera.view_size_h - V_MARGIN - (2*H_PAD) - _text_h;
		var _x2 = camera.view_size_w - H_MARGIN;
		var _y2 = camera.view_size_h - V_MARGIN;
	
		// DRAW TEXTBOX
		
		//background
		draw_sprite_stretched(Spr_UIBox,0,_x1,_y1,_x2-_x1,_y2-_y1);
	
		// DRAW TEXT
		if( speaker != "" ) {
			//black nameplate background
			draw_sprite_stretched_ext(Spr_UIBox,1,_x1+9,_y1-7,_name_w+(2*NAME_H_PAD)+2,11,c_black,1); 
			//color nameplate
			draw_sprite_stretched_ext(Spr_UIBox,1,_x1+10,_y1-6,_name_w+(2*NAME_H_PAD),9,_light_color,1); 
			//nameplate
			draw_set_color(c_black);
			draw_text(_x1+10+NAME_H_PAD,_y1-5,string_upper(speaker));
		}
		//main text
		draw_set_color(c_white);
		draw_text_ext(_x1+H_PAD,_y1+V_PAD,string_copy(text,1,floor(text_display_length)),LINE_HEIGHT,_text_w);
	
		// DRAW SELECTOR
		if(text_display_length == string_length(text)) {
			var _sx = _x2 - 8;
			var _sy = _y2-1;
						
			//draw background
			draw_sprite(Spr_Arrow,0,_sx,_sy);
			//draw button
			draw_sprite(Spr_Arrow,1,_sx,_sy);
			//draw chevron bg
			draw_sprite(Spr_Arrow,2,_sx,_sy);
			//draw chevron light
			draw_sprite_ext(Spr_Arrow,3,_sx,_sy,1,1,0,_light_color,1);
			//draw chevron dark
			draw_sprite_ext(Spr_Arrow,4,_sx,_sy,1,1,0,_dark_color,1);
		}
	
	} else { //textbox with responses -----------------------------------
		
		var num_selectable_options = 0;
		for( var i = 0; i < num_options; i++ ) {
			if( ChatterboxGetOptionConditionBool(chatterbox, i) )
				num_selectable_options++;
		}
		
		var _optiontext_h = 9*num_selectable_options - 4;
		var _text_w = camera.view_size_w - (2*H_PAD) - (2*H_MARGIN) - H_MARGIN;
		var _text_h = string_height_ext(text,LINE_HEIGHT,_text_w);
		
		var _ox1 = H_MARGIN+72;
		var _oy1 = camera.view_size_h - V_MARGIN - (2*V_PAD) - _optiontext_h;
		var _ox2 = camera.view_size_w - H_MARGIN;
		var _oy2 = camera.view_size_h - V_MARGIN;
		
		var _x1 = H_MARGIN;
		var _y1 = camera.view_size_h - (2*V_MARGIN) - (2*V_PAD) - _text_h - _optiontext_h;
		var _x2 = camera.view_size_w - (2*H_MARGIN);
		var _y2 = camera.view_size_h - (V_MARGIN) - _optiontext_h - 3;
		
		// DRAW TEXTBOX
		
		//background
		draw_sprite_stretched(Spr_UIBox,0,_x1,_y1,_x2-_x1,_y2-_y1);
	
		// DRAW TEXT
		
		draw_set_font(Fnt_Small);
		if( speaker != "" ) {
			//black nameplate background
			draw_sprite_stretched_ext(Spr_UIBox,1,_x1+9,_y1-7,_name_w+(2*NAME_H_PAD)+2,11,c_black,1); 
			//color nameplate
			draw_sprite_stretched_ext(Spr_UIBox,1,_x1+10,_y1-6,_name_w+(2*NAME_H_PAD),9,_light_color,1); 
			//nameplate
			draw_set_color(c_black);
			draw_text(_x1+10+NAME_H_PAD,_y1-5,string_upper(speaker));
		}
		//main text
		draw_set_color(c_white);
		draw_text_ext(_x1+H_PAD,_y1+V_PAD,string_copy(text,1,floor(text_display_length)),LINE_HEIGHT,_text_w);
	
		// DRAW OPTIONBOX
		
		if(text_display_length == string_length(text)) {
			
			//background
			draw_sprite_stretched(Spr_UIBox,0, _ox1,_oy1, _ox2-_ox1,_oy2-_oy1);
	
			// DRAW OPTIONS
		
			if( num_options > 0 ) {
				var iy = 0;
			
				for( var i = 0; i < num_options; i++ ) {
						
					//draw selector
					var _sx = _ox1 + 5;
					var _sy = _oy1 + 2 + V_PAD + 9*(iy);
					
					if(option_index == i) {
						
						//draw background
						draw_sprite(Spr_Arrow,0,_sx,_sy);
						//draw button
						draw_sprite(Spr_Arrow,1,_sx,_sy);
						//draw up or down arrows if needed
						if (num_selectable_options > 1 && iy > 0)
							draw_sprite_ext(Spr_Arrow,5,_sx,_sy,1,1,0,_light_color,1);
						if (num_selectable_options > 1 && iy < (num_selectable_options - 1))
							draw_sprite_ext(Spr_Arrow,6,_sx,_sy,1,1,0,_light_color,1);
					}
					
					if( ChatterboxGetOptionConditionBool(chatterbox, i) ) {
						//draw chevron
						//bg
						draw_sprite(Spr_Arrow,2,_sx,_sy);
						//light
						draw_sprite_ext(Spr_Arrow,3,_sx,_sy,1,1,0,_light_color,1);
						//dark
						draw_sprite_ext(Spr_Arrow,4,_sx,_sy,1,1,0,_dark_color,1);
						
						//draw text
						draw_text_color(_ox1+H_PAD,_oy1 - 1 + V_PAD + 9*(iy),
							ChatterboxGetOption(chatterbox, i), _light_color,_light_color,_light_color,_light_color,1);
						iy++;
					}
				}
			}
		}
	}
}