
(
~notas =Array.new(64);
~str="";
~on = MIDIFunc.noteOn({ |veloc, num, chan, src|
	"======================".postln;

	if(src.asFloat!=(~src-1),{
		("Chan "++chan).postln;
		("Src "++src).postln;
		~notas.add(num-60).postln;});

});

~off = MIDIFunc.noteOff({ |veloc, num, chan, src|
	//"Chan "++chan.postln;
	//"Src "++src.postln;
	num=num-60;
	(src.asFloat!=(~src-1)).postln;
	if(src.asFloat!=(~src-1),{

		{
			~notas.do({|v|
				if(~str.size>0,{
					"demas notas".postln;
					~str=~str++","++v.asString;
					},{
						"primera nota".postln;
						~str=~str++v.asString;});
				}
			);
			"estoy mandando mucho".postln;
			if(~str.size>0,{
				~instGui[0].inputNotes.value=""++~str;
				~instGui[0].notesSequence(~instGui[0].inputNotes.string);
			});
			~str="";
			~notas =Array.new(64);
		}.defer(0);
	});
});

)

//q = { ~on.free; ~off.free; };

//q.value;

