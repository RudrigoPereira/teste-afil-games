/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//VARIÁVEIS DO OBJETO
main_menu_options = ["Jogar", "Configurações", "Sair"];
cursor			  = 0;
spacing = 50;

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
		var _mouse_x = device_mouse_x_to_gui(0),
			_mouse_y = device_mouse_y_to_gui(0);
			
		if(point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2)){
			cursor = _i;
		}
	}
}
#endregion
