/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//DEFININDO ALINHAMENTO
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//VARIÁVEIS LOCAIS DO MENU
var _menu_heigth = (array_length(main_menu_options) - 1) * spacing,
	_x			 = display_get_gui_width() * 0.5,
	_y			 = (display_get_gui_height() * 0.5) - (_menu_heigth * 0.5);
				   
//DESENHANDO O MENU
draw_menu(_x, _y, main_menu_options);

//NAVEGAÇÃO COM O TECLADO
menu_keyboard_navigation(main_menu_options);

//RESETANDO OS DRAW SET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);
