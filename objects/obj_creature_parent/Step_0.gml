/// @description Insert description here
// You can write your code in this editor
if (hp<1){
	instance_destroy();
}
if (snd_kill!=noone && hit){
	audio_play_sound(snd_kill,2,false);
	hit=false;
}