 /// @description player walk

// check keys from movement
moveRight = keyboard_check(vk_right)
moveLeft = keyboard_check(vk_left)
moveUp= keyboard_check(vk_up)
moveDown = keyboard_check(vk_down)

// calculate movement
vx = ((moveRight - moveLeft)* walkSpeed);
vy = ((moveDown - moveUp)* walkSpeed);

// if idle
if (vx == 0 && vy == 0){
	// troca de sprite em relação ao ultimo
	switch dir{
	case 0: sprite_index = spr_player_idle_right; break;
	case 1: sprite_index = spr_player_idle_up; break;
	case 2: sprite_index = spr_player_idle_left; break;
	case 3: sprite_index = spr_player_idle_down; break;
	}
}

// if moving
if (vx != 0 || vy != 0){
	x += vx;
	y += vy;
	
	// trocando os sprites ao se movimentar
	//direita
	if (vx > 0){
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	// esquerda
	if (vx < 0){
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	// baixo
	if (vy > 0){
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	// cima
	if (vy < 0){
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
}

// profundidade
depth =-y;