(
MIDIClient.init(1,1);    // explicitly intialize the client
MIDIIn.connect(8, MIDIClient.sources.at(8));

~src=2;
~mid = MIDIOut(~src);
~instrumentos = [\violin,\viola,\cello,\contrabass,\piano];
("f_pdefs.scd").loadRelative;
//("f_guiClass.scd").loadRelative;
//("f_midi.scd").loadRelative;
("f_fomus.scd").loadRelative;
)


