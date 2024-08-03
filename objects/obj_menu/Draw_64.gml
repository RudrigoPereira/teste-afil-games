/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//DEFININDO ALINHAMENTO
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//VARIÁVEIS LOCAIS DO MENU
var _array = open_settings_menu ? settings_menu_options : main_menu_options,
	_menu_heigth = (array_length(_array) - 1) * spacing,
	_x			 = display_get_gui_width() * 0.5,
	_y			 = (display_get_gui_height() * 0.5) - (_menu_heigth * 0.5);
				   
//DESENHANDO O MENU
if(show_popup) {
	draw_exit_popup(_x, display_get_gui_height() * 0.5);
} else {
	draw_menu(_x, _y, _array);
}

//NAVEGAÇÃO COM O TECLADO
menu_keyboard_navigation(_array);

//RESETANDO OS DRAW SET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);
