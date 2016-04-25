~cGrisClaro = Color( 232/255,232/255,232/255 );


~masterWin=Window("Ensamble",Rect(0,50,Window.screenBounds.width/2,Window.screenBounds.height*0.6)).front;
~masterWin.view.background =  Color( 127/255,137/255,147/255 );

~instGui=Array.new(16);

~instGuiLayout=Array.new(16);
~instPdf.do({|ins|
	var instGui;
	instGui = InstrumentoGUI(ins,~masterWin,~t);
	~instGui.add(instGui);
	~instGuiLayout.add(instGui.localLayout);
});

~masterWin.layout_(
	GridLayout.columns(~instGuiLayout);
);



(
~optionsWin=Window("Play",Rect(0,Window.screenBounds.height*0.75,300,90)).front;
~optionsWin.view.background = Color( 127/255,137/255,147/255 );

~btRec =   Button(~optionsWin);
~btRec.states_([
	["StartRec", Color.black, ~cGrisClaro]
]);
~btRec.action_({~t = TempoClock.new;});

~btFomus = Button(~optionsWin);
~btFomus.states_([["partitura", Color.black, ~cGrisClaro]]);
~btFomus.action_({ "Save fomus".postln;	~saveFomus.value();});
~btPanic = Button(~optionsWin);

~btPanic.action_({16.do({|i|~mid.allNotesOff(i);})
});

~btPanic.states_([["panic", Color.black, ~cGrisClaro]]);

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

