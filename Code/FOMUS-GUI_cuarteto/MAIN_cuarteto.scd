(
MIDIClient.init;
~mid = MIDIOut(2);
~instrumentos = [\violin,\viola,\cello,\contrabass];
("f_pdefs.scd").loadRelative;
("f_guiClass.scd").loadRelative;
("f_fomus.scd").loadRelative;
)
~saveFomus.value();

(
~bo1=Button(w);
~bo1.action_({
	~saveFomus.value();
});
~w2=Window("Ensamble",Rect(100,Window.screenBounds.height*0.70,455,100)).front;
~w2.layout_(GridLayout.rows(
	[~bo1,Button()],
	[TextField(),Button()]
));
)

//================================================
// para cambiar el temo
~t.tempo=4;
// para callar todas las notas si se queda una colgada
//================================================


//*****************************************
// Crear la partitura
// Deben tener instalada la extensión fomus que les mando aqui
// La modifiqué para que automáticamente

T("c8 d").notas;

T("c8 d").durs;