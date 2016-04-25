
(
~notasPas=Array.new(64);
~notasMandar=Array.new(64);

~notas =Array.new(64);
~str="";
~on = MIDIFunc.noteOn({ |veloc, num, chan, src|
	"ON ======================".postln;
	("Chan "++chan).postln;
	("Src "++src).postln;
	~notas.add(num-60).postln;
	if(~notas.size>0,{
		~instGui[0].setNotes(~notas);
	});
});

~off = MIDIFunc.noteOff({ |veloc, num, chan, src|
	"Off ======================".postln;
	("Chan "++chan).postln;
	("Src "++src).postln;
	num=num-60;
	~notas.remove(num);
	~notas.postln;
	if(~notas.size>0,{});
});


)


//q = { ~on.free; ~off.free; };

//q.value;

