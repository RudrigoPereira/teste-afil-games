/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//VARIÁVEIS DO OBJETO
main_menu_options	  = ["Jogar", "Configurações", "Sair"];
spacing				  = 50;
cursor				  = 0;
open_settings_menu	  = false;
settings_menu_options = ["Volume", "Tela Cheia", "Voltar"];
show_popup			  = false;	
exit_options		  = ["Sim", "Não"];
open_music_volume	  = false;

ini_open("savedata.ini");
//music_volume  = ini_read_real("settings", "music_volume", audio_sound_get_gain());
is_fullscreen = ini_read_real("settings", "isFullscreen", window_get_fullscreen());
ini_close();
window_set_fullscreen(is_fullscreen);
		   
#region FUNÇÕES

draw_menu = function(_x, _y, _array) {				   
	for(var _i = 0; _i < array_length(_array); _i++) {
		draw_set_font(fnt_cursor);
		
		var _string_w = string_width(_array[_i]),
			_string_h = string_height(_array[_i]),
			_padding  = 5,
			_x1		  = _x - (_string_w * 0.5) - _padding,
			_y1		  = _y - (_string_h * 0.5) - _padding,
			_x2		  = _x + (_string_w * 0.5) + _padding,
			_y2		  = _y + (_string_h * 0.5) + _padding;
	
		if(cursor == _i) {
			//destacando a opção onde está o cursor
			draw_set_color(c_red);
			draw_roundrect(_x1, _y1, _x2, _y2, true);
		} else {
			draw_set_font(fnt_menu);
		}
	
		draw_set_color(c_white);
		draw_text(_x, _y, _array[_i]);
		_y += spacing;
	
		//navegação com o mouse
		menu_mouse_navigation(_x1, _y1, _x2, _y2, _i);
	}
}

menu_mouse_navigation = function(_x1, _y1, _x2, _y2, _index) {
	var _mouse_x		 = device_mouse_x_to_gui(0),
		_mouse_y		 = device_mouse_y_to_gui(0),
		_mouse_on_option = point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2),
		_left_btn = mouse_check_button_pressed(mb_left);
	
	//seleção do menu
	if(_mouse_on_option) {
		cursor = _index;

		if(_left_btn) {
			if(!open_settings_menu) {
				if(show_popup) exit_popup_selection();
				else main_menu_selection();
			} else {
				settings_menu_selection();
			}
		}
	}
}

menu_keyboard_navigation = function(_array) {
	var _up	   = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")),
		_down  = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")),
		_enter = keyboard_check_pressed(vk_enter);

	if(_up) cursor -= 1;
	if(_down) cursor += 1;
	cursor = clamp(cursor, 0, array_length(_array) - 1);
	
	/*
		Caso queira um efeito de carrossel no menu descomente o código abaixo
		E comente a linha anterior com a função CLAMP
	*/
	
	//if (cursor < 0) cursor = array_length(_array) - 1;
	//if (cursor >= array_length(_array)) cursor = 0;
	
	//seleção do menu
	if(_enter){
		if(!open_settings_menu) {
			if(show_popup) exit_popup_selection();
			else main_menu_selection();
		} else {
			settings_menu_selection();
		}
	}
}

main_menu_selection = function() {
	switch(cursor) {
		case 0://Jogar
			room_goto(rm_gameplay);
			break;
			
		case 1://Configurações
			open_settings_menu = true;
			cursor			   = 0;
			break;
			
		case 2://Sair
			show_popup = true;
			cursor	   = 0;
			break;
			
		default:
			break;
	}
}

settings_menu_selection = function() {
	switch(cursor) {
		case 0: //Volume
			open_music_volume = !open_music_volume;
			break;
		case 1: //Tela Cheia
			is_fullscreen = !is_fullscreen
			window_set_fullscreen(is_fullscreen);
			ini_open("savedata.ini");
			ini_write_real("settings", "isFullscreen", is_fullscreen);
			ini_close();
			break;
		case 2: //Voltar
			open_settings_menu = false;
			cursor = 1;
			break;
	}
}

draw_exit_popup = function(_x, _y) {
	var _padding = 150,
		_x1		 = _x - _padding,
		_y1		 = _y - _padding,
		_x2		 = _x + _padding,
		_y2		 = _y + _padding;
	
    draw_roundrect(_x1, _y1, _x2, _y2, true);
	draw_set_color(c_dkgray);
    draw_roundrect(_x1, _y1, _x2, _y2, false);
    draw_set_color(c_white);
	draw_set_font(fnt_menu);
    draw_text(_x, _y - (spacing * 1.5), "Você deseja sair?");
	draw_menu(_x, _y + (spacing * 0.5), exit_options);
}

exit_popup_selection = function() {
	if(cursor == 0) {
		game_end();
	}
	else {
		show_popup = false;
		cursor = 2;
	}
}

#endregion
