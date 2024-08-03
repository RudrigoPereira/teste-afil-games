/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//DEFININDO ALINHAMENTO
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//VARIÁVEIS LOCAIS DO MENU
var _spacing	 = 50,
	_menu_heigth = (array_length(main_menu_options) - 1) * _spacing,
	_x			 = display_get_gui_width() * 0.5,
	_y			 = (display_get_gui_height() * 0.5) - (_menu_heigth * 0.5);
	
//VARIÁVEIS LOCAIS DO MOUSE
var _mouse_x = device_mouse_x_to_gui(0),
	_mouse_y = device_mouse_y_to_gui(0);
				   
//DESENHANDO O MENU
for(var _i = 0; _i < array_length(main_menu_options); _i++) {
	draw_set_font(fnt_cursor);
	var _padding = 5,
		_x1		 = _x - (string_width(main_menu_options[_i]) * 0.5) - _padding,
		_y1		 = _y - (string_height(main_menu_options[_i]) * 0.5) - _padding,
		_x2		 = _x + (string_width(main_menu_options[_i]) * 0.5) + _padding,
		_y2		 = _y + (string_height(main_menu_options[_i]) * 0.5) + _padding;
	
	if(cursor == _i) {
		//destacando a opção onde está o cursor
		draw_set_color(c_red);
		draw_roundrect(_x1, _y1, _x2, _y2, true);
	} else {
		draw_set_font(fnt_menu);
	}
	
	draw_set_color(c_white);
	draw_text(_x, _y, main_menu_options[_i]);
	_y += _spacing;
	
	//navegação com o mouse
	if(point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2)){
		cursor = _i;
	}
}

//VARIÁVEIS LOCAIS DO TECLADO
var _up		= keyboard_check_pressed(vk_up),
	_down	= keyboard_check_pressed(vk_down);

//navegação com o teclado
if(_up) cursor -= 1;
if(_down) cursor += 1;
cursor = clamp(cursor, 0, array_length(main_menu_options) - 1);

//RESETANDO OS DRAW SET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);
