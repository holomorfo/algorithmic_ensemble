(
MIDIClient.init;
~mid = MIDIOut(2);
~instrumentos = [\violin,\viola,\cello,\contrabass];
("f_pdefs.scd").loadRelative;
("f_guiClass.scd").loadRelative;
("f_fomus.scd").loadRelative;
)
~saveFomus.value();


