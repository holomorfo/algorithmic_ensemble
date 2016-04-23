// Parte de inicializaciones
~instrumentos = [\violin,\viola,\cello,\contrabass];

~t = TempoClock.new;

~n = Array.new(2000);
~regF={{|v|~n.add((\note:(v.note),\dur:v.dur,\mark:v.mark,\time:v.time,\voice: v.voice, \instru: v.instru))}};

~instPdf = Array.new(16);
~instrumentos.do({|name,i|
	~instPdf.add(InstrumentoPdef(name,i));
});



~pdefs=Array.fill(~instrumentos.size,{|i|
	Pdef(i.asSymbol,
		Pbind(
			\type, \midi,
			\midicmd, \noteOn,
			\midiout, ~mid,
			\chan, i,

			\instru, ~instPdf[i].name.asSymbol,
			\voice,i+1,
			\note, ~instPdf[i].notes,
			\dur, ~instPdf[i].durs,
			\amp,~instPdf[i].amps,
			\mark, Pfunc({|env|
				i = env.amp;
				x = case
				{i >= 0.8} {"[ff]"}
				{(i < 0.8) && (i >= 0.78)} {"[>]"}
				{(i < 0.78) &&(i >= 0.74)} {"[mf] "}
				{(i < 0.74) &&(i >= 0.55)} {" "}
				{(i < 0.55) &&(i >= 0.51)} {"[mp]"}
				{i < 0.51} {"[p]"}; // refinar para todas las dinámicas
			}),
			\time, Pfunc({~t.beats;}),
			\grabar, Pfunc(~regF.value(v))
		)
	);
});


