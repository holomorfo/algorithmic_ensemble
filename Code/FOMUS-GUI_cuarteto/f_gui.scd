

(
w=Window("Ensamble",Rect(100,Window.screenBounds.height*0.70,455,100)).front;

~t1 = TextField(w);
~t1.string = "1";
~t1.action = {arg field; field.value.postln; ~f1.value(field.value) };
~m1= PopUpMenu(w, Rect(10, 10, 90, 20))
.items_(["Pseq", "Pxrand" , "Prand"]);
~m1.action_({~f1.value(~t1.string)});
~b1 = Button(w, Rect(90, 20, 200, 30));
~b1.states_([
	["off", Color.black, Color.gray],
	["on", Color.black, Color.gray]
]);
~b1.action_({ arg butt;
	butt.value.postln;
	if(butt.value.asFloat==1,{Pdef(\0).play},{Pdef(\0).stop});
});

~t2 = TextField(w);
~t2.string = "1";
~t2.action = {arg field; field.value.postln; ~f2.value(field.value) };
~m2= PopUpMenu(w, Rect(10, 10, 90, 20))
.items_(["Pseq", "Pxrand" , "Prand"]);


~t3 = TextField(w);
~t3.string = "1";
~t3.action = {arg field; field.value.postln; ~f3.value(field.value) };
~m3= PopUpMenu(w, Rect(10, 10, 90, 20))
.items_(["Pseq", "Pxrand" , "Prand"]);


~f1={|v|
	i=~m1.items[~m1.value].asString;
	x = case
	{ i == "Pseq" }   {
		"seq".postln;
		~notas[0].source =Pseq(v.split($,).asFloat,inf);
	}
	{ i == "Prand" } {
		"rand".postln;
		~notas[0].source =Prand(v.split($,).asFloat,inf);
	}
	{ i == "Pxrand" } {
		"xrand".postln;
		~notas[0].source =Pxrand(v.split($,).asFloat,inf);
	};
};

~f2={|v|
	~durs[0].source =Pseq(v.split($,).asFloat,inf);
	"Valor 2".postln;
	~m2.value.postln;
};

~f3={|v|
	~amps[0].source =Pseq(v.split($,).asFloat,inf);
	"Valor 3".postln;
	~m3.value.postln;
};

~panic = Button(w);
~panic.action_({16.do({|i|~mid.allNotesOff(i);})
});

~instrumento=StaticText(w).string_("Instrumento");

~g1=	GridLayout.rows(
	[~instrumento,StaticText(w).string_("Nota"),~m1,~t1],
	[~b1,StaticText(w).string_("Duración"),~m2,~t2],
	[~panic,StaticText(w).string_("Amplitud"),~m3,~t3]
);


w.layout_(~g1);

)

//~m1.item
//~m1.items[0].asString=="Pseq"