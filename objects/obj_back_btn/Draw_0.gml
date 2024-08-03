/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//DEFININDO ALINHAMENTO E FONTE DE TEXTO
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_cursor);

//DEFININDO POSIÇÃO
x = room_width * 0.5;
y = room_height * 0.5;

//DESENHANDO O BOTÃO
var _string_w = string_width(text),
	_string_h = string_height(text),
	_padding  = 5,
	_x1		  = x - (_string_w * 0.5) - _padding,
	_y1		  = y - (_string_h * 0.5) - _padding,
	_x2		  = x + (_string_w * 0.5) + _padding,
	_y2		  = y + (_string_h * 0.5) + _padding;

draw_set_color(c_red);
draw_roundrect(_x1, _y1, _x2, _y2, true);
draw_set_color(c_white);
draw_text(x, y, text);

//SELECIONANDO O BOTÃO
btn_selection(_x1, _y1, _x2, _y2);

//RESETANDO OS DRAW SET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);