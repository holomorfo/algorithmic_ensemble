InstrumentoGUI{
	var name;
	var w;
	var btnPanic, btnOnOff;
	var popNotes,popDurs,popAmps;
	var textName;
	var inputNotes,inputDur,inputAmp;
	var idx;
	var <>localLayout;
	var instPd;
	*new { arg insPd, par;
		"piano".postln;
		^super.new.init(insPd,par);
	}

	init{arg insPd, par;
		var ins;
		instPd=insPd;
		name= instPd.name;
		idx=instPd.idSym;
		"Inicio instrumento".postln;
		w=par;

		btnOnOff = Button(w, Rect(90, 20, 200, 30));
		btnOnOff.states_([
			["off", Color.black, Color.gray],
			["on", Color.black, Color.gray]
		]);
		btnOnOff.action_({ arg butt;
			butt.value.postln;
			if(butt.value.asFloat==1,{
				Pdef(idx.asSymbol).play
				},{
					Pdef(idx.asSymbol).stop}
			);
		});

		inputNotes = TextField(w);
		inputNotes.string = "1";
		inputNotes.action = {arg field;
			field.value.postln;
			this.notesSequence(inputNotes.string);
		};
		popNotes= PopUpMenu(w, Rect(10, 10, 90, 20))
		.items_(["Pseq", "Pxrand" , "Prand"]);
		popNotes.action_({
			this.notesSequence(inputNotes.string);
		});

		inputDur = TextField(w);
		inputDur.string = "1";
		inputDur.action = {arg field;
			field.value.postln;
			this.dursSequence(field.value);
		};
		popDurs= PopUpMenu(w, Rect(10, 10, 90, 20))
		.items_(["Pseq", "Pxrand" , "Prand"]);
		popDurs.action_({
			this.notesSequence(inputNotes.string);
		});


		inputAmp = TextField(w);
		inputAmp.string = "1";
		inputAmp.action = {arg field;
			field.value.postln;
			this.ampsSequence(field.value);
		};
		popAmps= PopUpMenu(w, Rect(10, 10, 90, 20))
		.items_(["Pseq", "Pxrand" , "Prand"]);
		popAmps.action_({
			this.notesSequence(inputNotes.string);
		});


		ins=StaticText(w).string_(name);

		localLayout =	GridLayout.rows(
			[ins,StaticText(w).string_("Nota"),popNotes,inputNotes],
			[btnOnOff,StaticText(w).string_("Duración"),popDurs,inputDur],
			[btnPanic,StaticText(w).string_("Amplitud"),popAmps,inputAmp]
		);


		//w.layout_(localLayout);

		^this;
	}

	notesSequence{|v|
		var x,i;
		i=popNotes.items[popNotes.value].asString;
		x = case
		{ i == "Pseq" }   {
			"seq".postln;
			instPd.notes.source =Pseq(v.split($,).asFloat,inf);
			//~notas[0].source =Pseq(v.split($,).asFloat,inf);
		}
		{ i == "Prand" } {
			"rand".postln;
			instPd.notes.source =Prand(v.split($,).asFloat,inf);
			//~notas[0].source =Prand(v.split($,).asFloat,inf);
		}
		{ i == "Pxrand" } {
			"xrand".postln;
			instPd.notes.source =Pxrand(v.split($,).asFloat,inf);
			//~notas[0].source =Pxrand(v.split($,).asFloat,inf);
		};
	}

	dursSequence{|v|
		var x,i;
		i=popDurs.items[popDurs.value].asString;
		x = case
		{ i == "Pseq" }   {
			"seq".postln;
			instPd.durs.source =Pseq(v.split($,).asFloat,inf);
			//~notas[0].source =Pseq(v.split($,).asFloat,inf);
		}
		{ i == "Prand" } {
			"rand".postln;
			instPd.durs.source =Prand(v.split($,).asFloat,inf);
			//~notas[0].source =Prand(v.split($,).asFloat,inf);
		}
		{ i == "Pxrand" } {
			"xrand".postln;
			instPd.durs.source =Pxrand(v.split($,).asFloat,inf);
			//~notas[0].source =Pxrand(v.split($,).asFloat,inf);
		};
	}

	ampsSequence{|v|
		var x,i;
		i=popAmps.items[popAmps.value].asString;
		x = case
		{ i == "Pseq" }   {
			"seq".postln;
			instPd.amps.source =Pseq(v.split($,).asFloat,inf);
			//~notas[0].source =Pseq(v.split($,).asFloat,inf);
		}
		{ i == "Prand" } {
			"rand".postln;
			instPd.amps.source =Prand(v.split($,).asFloat,inf);
			//~notas[0].source =Prand(v.split($,).asFloat,inf);
		}
		{ i == "Pxrand" } {
			"xrand".postln;
			instPd.amps.source =Pxrand(v.split($,).asFloat,inf);
			//~notas[0].source =Pxrand(v.split($,).asFloat,inf);
		};
	}

}