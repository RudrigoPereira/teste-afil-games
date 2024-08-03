/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//VARIÁVEIS DO OBJETO
main_menu_options	  = ["Jogar", "Configurações", "Sair"];
spacing				  = 50;
cursor				  = 0;
open_settings_menu	  = false;
settings_menu_options = ["Volume", "Tela Cheia", "Voltar"];
show_popup			  = false;	
		   
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
			
	if(_mouse_on_option) {
		cursor = _index;

		if(_left_btn) {
			if(!open_settings_menu) main_menu_selection();
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
		if(!open_settings_menu) main_menu_selection();
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

#endregion
