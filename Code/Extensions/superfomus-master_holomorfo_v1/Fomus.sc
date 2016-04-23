// SuperFomus -- SuperCollider bindings to FoMus Music Notation
// Copyright (C) 2011 Bernardo Barros
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

Fomus {
	var <eventList;
	var <>fileName = "~/Desktop/SCFomus";
	var <>lilyPath = "/usr/bin/lilypond";
	var <>lilyViewPath = "/usr/bin/xpdf";
	var <>qt = true;
	var <>instruments;

	*new { arg noteList, n,instru;
		^super.new.init(noteList, n);
	}

	init { arg thisStuff=[], n=1, instru =[\piano];
		instruments = instru;
		eventList = Array.new;

		(thisStuff.size > 0 or: thisStuff.class == Routine).if({
			this.put(thisStuff, n)
		});

	}

	putEvents{arg stuffIn, instru;
		instruments= instru;
		stuffIn.do { |thisEvent|
			if( thisEvent.class == Event,
				{ eventList = eventList.add(thisEvent)},
				{ "At least one element of the Array is not an Event".error}
			);
		}
	}

	put { arg stuffIn, n=1, instru;
		instruments= instru;
		case
		{stuffIn.class == Event}
		{ eventList = eventList.add(stuffIn)}

		{stuffIn.class == Array}
		{
			stuffIn.do { |thisEvent|
				if( thisEvent.class == Event,
					{ eventList = eventList.add(thisEvent)},
					{ "At least one element of the Array is not an Event".error}
				);
			}
		}

		{stuffIn.class == Routine}
		{
			stuffIn.nextN(n,()).do { |thisEvent|
				eventList = eventList.add(thisEvent)
			};
		}

		{(stuffIn.class == Event or: stuffIn.class == Array).not}
		{ "You must provide an Event, a Stream or an Array of Events".error};

	}

	asString {
		var out = "";

		eventList.do { arg i;
			out = out ++ i.asFomusString ++ "\n"
		};
		^out;
	}

	qtString {
		this.qt.if(
			{^"quartertones = yes"},
			{^"quartertones = no"})
	}

	header {
		var out,defs, parts="", voices;
		defs =			this.qtString ++ "\n" ++
		"lily-exe-path = " ++ this.lilyPath ++ "\n" ++
		"lily-view-exe-path = " ++ this.lilyViewPath  ++ "\n";
		this.instruments.do({|name|
			parts=parts++"part <id "++name.asString++", inst "++name.asString++">"  ++ "\n";
		});
		voices="voice (1 2 3 4 5 6)"  ++ "\n";
		out =(defs++parts++voices).asString;
		^out;
	}

	write {
		var file;
		file = File(this.fileName.standardizePath ++ ".fms","w");
		file.write(this.header ++ "\n");
		file.write(this.asString);
		file.close;
	}

	ly {
		this.write;
		(
			"fomus " ++ this.fileName.standardizePath ++ ".fms" ++
			" -o " ++ this.fileName.standardizePath ++ ".ly"
		).systemCmd;
	}

	midi {
		this.write;

		(
			"fomus " ++ this.fileName.standardizePath ++ ".fms" ++
			" -o " ++ this.fileName.standardizePath ++ ".mid"
		).systemCmd;
	}


	xml {
		this.write;
		( "fomus " ++ this.fileName.standardizePath ++ ".fms" ++
			" -o " ++ this.fileName.standardizePath ++ ".xml"
		).systemCmd;
	}


	show {
		(this.lilyViewPath ++ " " ++ this.fileName.standardizePath ++ ".pdf").unixCmd;
	}

}
