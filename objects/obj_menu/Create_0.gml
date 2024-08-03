/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//VARIÁVEIS DO OBJETO
main_menu_options = ["Jogar", "Configurações", "Sair"];
spacing			  = 50;
cursor			  = 0;
		   
#region FUNÇÕES

draw_menu = function(_x, _y, _array) {				   
	for(var _i = 0; _i < array_length(_array); _i++) {
		draw_set_font(fnt_cursor);
		
		var _padding = 5,
			_x1		 = _x - (string_width(_array[_i]) * 0.5) - _padding,
			_y1		 = _y - (string_height(_array[_i]) * 0.5) - _padding,
			_x2		 = _x + (string_width(_array[_i]) * 0.5) + _padding,
			_y2		 = _y + (string_height(_array[_i]) * 0.5) + _padding;
	
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
		_mouse_on_option = point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2);
			
	if(_mouse_on_option) cursor = _index;
}

menu_keyboard_navigation = function(_array) {
	var _up	  = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")),
		_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

	if(_up) cursor -= 1;
	if(_down) cursor += 1;
	cursor = clamp(cursor, 0, array_length(_array) - 1);
	
	/*
		Caso queira um efeito de carrossel no menu descomente o código abaixo
		E comente a linha anterior com a função CLAMP
	*/
	
	//if (cursor < 0) cursor = array_length(_array) - 1;
	//if (cursor >= array_length(_array)) cursor = 0;
}

#endregion
