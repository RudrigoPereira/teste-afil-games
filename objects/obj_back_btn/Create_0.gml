/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//PARANDO A MÚSICA
audio_stop_all();

//VARIÁVEIS DO OBJETO
text = "Retornar";

//FUNÇÕES
btn_selection = function(_x1, _y1, _x2, _y2) {
	var _enter = keyboard_check_pressed(vk_enter),
		_mouse_on_button = point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2),
		_left_btn = mouse_check_button_pressed(mb_left);
	
	//teclado
	if(_enter) room_goto(rm_menu);
	
	//mouse
	if(_mouse_on_button) {
		if(_left_btn) room_goto(rm_menu);
	} 
}
