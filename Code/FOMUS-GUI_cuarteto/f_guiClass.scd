~masterWin=Window("Ensamble",Rect(100,Window.screenBounds.height*0.30,855,500)).front;

~instGui=Array.new(16);
~instPdf.do({|ins|
	~instGui.add(InstrumentoGUI(ins,~masterWin).localLayout);
});

~masterWin.layout_(
	GridLayout.columns(
		~instGui			)
);

