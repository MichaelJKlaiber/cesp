void play_sound(int pitch, int duration){
	int instrument = 1;
	int volume = 127;
	//...
	asm ("ecall");
}



int main(){
	const int e = 64;
	const int g = 67;
	const int b = 71;
	const int c = 72;
	const int p = 0;
	
	int pitches[8] = {e, g, b, c, b, g, e, p};
	int duration[8] = {400, 400, 400, 400, 400, 400, 400, 30};
	for(int i =0; i<64;i++)
		play_sound(pitches[i%8], duration[i%8]);
	return 0;
}
