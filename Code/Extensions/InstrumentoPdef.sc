InstrumentoPdef{
	var <>name;
	var <>idSym;
	var <>notes, <>durs, <>amps;

	*new { arg nameIns="piano", id=0;
		"Pdef".postln;
		^super.new.init(nameIns,id);
	}

	init{arg nameIns="piano",id;
		name= nameIns;
		idSym = id;
		notes = PatternProxy();
		durs = PatternProxy();
		amps = PatternProxy();
		^this;
	}
}