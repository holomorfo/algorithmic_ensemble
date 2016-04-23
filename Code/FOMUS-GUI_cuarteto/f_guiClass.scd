~masterWin=Window("Ensamble",Rect(100,Window.screenBounds.height*0.30,855,500)).front;

~instGui=Array.new(16);
~instPdf.do({|ins|
	~instGui.add(InstrumentoGUI(ins,~masterWin).localLayout);
});

~masterWin.layout_(
	GridLayout.columns(
		~instGui			)
);

//~t.tempo=4;
// (
// ~bo1=Button(w);
// ~bo1.action_({
// 	~saveFomus.value();
// });
// ~w2=Window("Ensamble",Rect(100,Window.screenBounds.height*0.70,455,100)).front;
// ~w2.layout_(GridLayout.rows(
// 	[~bo1,Button()],
// 	[TextField(),Button()]
// ));
// )

