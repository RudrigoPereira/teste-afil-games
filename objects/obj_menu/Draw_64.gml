/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//DEFININDO ALINHAMENTO
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//VARIÁVEIS LOCAIS
var _spacing	 = 50,
	_menu_heigth = (array_length(main_menu_options) - 1) * _spacing,
	_x			 = display_get_gui_width() * 0.5,
	_y			 = (display_get_gui_height() * 0.5) - (_menu_heigth * 0.5);

//DESENHANDO O MENU
for(var _i = 0; _i < array_length(main_menu_options); _i++) {
	draw_set_font(fnt_menu);
	
	draw_text(_x, _y, main_menu_options[_i]);
	_y += _spacing;
}

//RESETANDO OS DRAW SET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
