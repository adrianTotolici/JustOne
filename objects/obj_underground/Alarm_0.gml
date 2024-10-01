/// @description Insert description here
// You can write your code in this editor
if (sound_play && sound_playing==false){
	audio_play_sound(snd_cave_background, 1, true);
	sound_playing=true;
	sound_play=false;
}