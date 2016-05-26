(
MIDIClient.init;
//MIDIClient.init(1,1);    // explicitly intialize the client
//MIDIIn.connect(8, MIDIClient.sources.at(8));

~src=2;
~mid = MIDIOut(~src);
~instrumentos = [\violin,\viola,\cello,\contrabass,\piano];
("f_pdefs.scd").loadRelative;
//("f_guiClass.scd").loadRelative;
//("f_midi.scd").loadRelative;
("f_fomus.scd").loadRelative;
)


~notas

Pdef(\0).play(~t);// Violin
~notas[0].source =Pseq([0,3,7]+12,inf);
~durs[0].source =Pseq([0.25],inf);
~amps[0].source = Pbrown(0.1,1,0.1,inf);

Pdef(\1).play(~t);// Viola
~notas[1].source =Pseq([0,3,9],inf);
~durs[1].source =Pseq([0.5],inf);
~amps[1].source = Pbrown(0.1,1,0.1,inf);

Pdef(\2).play(~t);// Chello
~notas[2].source =Pbrown(36-60,76-60,5,inf).trace;
~durs[2].source =Pseq([1],inf);
~amps[2].source = Pbrown(0.1,1,0.1,inf);

Pdef(\3).play(~t);// Contabajo
~notas[3].source =Pbrown(28-60,67-60,1,inf).trace;
~durs[3].source =Pseq([2],inf);
~amps[3].source = Pbrown(0.1,1,0.1,inf);


// Aquí para terminar cada línea
Pdef(\0).stop;
Pdef(\1).stop;
Pdef(\2).stop;
Pdef(\3).stop;
