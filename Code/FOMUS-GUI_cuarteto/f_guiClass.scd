
~masterWin=Window("Ensamble",Rect(0,0,Window.screenBounds.width/2,Window.screenBounds.height/2)).front;

~instGui=Array.new(16);
~instPdf.do({|ins|
	~instGui.add(InstrumentoGUI(ins,~masterWin,~t).localLayout);
});

~masterWin.layout_(
	GridLayout.columns(~instGui);
);

(
~optionsWin=Window("Play",Rect(0,Window.screenBounds.height*0.75,300,90)).front;

~btRec =   Button(~optionsWin);
~btRec.states_([
	["StartRec", Color.black, Color.gray],
	["StopRec", Color.black, Color.green],
]);

~btFomus = Button(~optionsWin);
~btFomus.states_([["partitura", Color.black, Color.gray]]);
~btFomus.action_({ "Save fomus".postln;	~saveFomus.value();});
~btPanic = Button(~optionsWin);

~btPanic.action_({16.do({|i|~mid.allNotesOff(i);})
});

~btPanic.states_([["panic", Color.black, Color.gray]]);

~title=StaticText(~optionsWin).string_("Ensamble algorítmico");
~tempoStr=StaticText(~optionsWin).string_("Tempo");

~tempoField = TextField(w);
~tempoField.string = "60";
~tempoField.action = {arg field;
	field.value.postln;
	~t.tempo=field.value.asFloat/60;
};


~optionsGui = GridLayout.rows(
	[~title,~btRec,~btPanic,~btFomus],
	[~tempoStr,~tempoField]
);

~optionsWin.layout_(~optionsGui);
)

//~t.tempo=4;
// (
// ~bo1=Button(w);
// ~bo1.action_({
//
// });
// ~w2=Window("Ensamble",Rect(100,Window.screenBounds.height*0.70,455,100)).front;
// ~w2.layout_(GridLayout.rows(
// 	[~bo1,Button()],
// 	[TextField(),Button()]
// ));
// )

