/*
 These are the same as the "CREATE DIARY RECORD" modules you would place in-game

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

This is the way it must be typed ==================================================================

player createDiaryRecord["Diary", ["SUBJECT NAME", "TEXT GOES HERE"]];

===================================================================================================

player createDiaryRecord - DO NOT CHANGE!!
"DIARY" - DO NOT CHANGE!!
"SUBJECT NAME" - This is what you'll call the subject name to click on (e.g. Situation or Mission)
"TEXT GOES HERE" - This is where the information relating to the subject
                 - To create a new line put <br/> after you have finished your sentence. This works the same as pressing 'ENTER' in Word.
                 - To create a gap for paragraphs put <br/><br/> after you have finished your sentence. This works the same as pressing '2xENTER' in Word.

EXAMPLE:

player createDiaryRecord["Diary", ["Situation", "Russia has invaded America.<br/>America is not happy.<br/><br/>America is going to nuke russia because murica"]];

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

For multiple subjects and wanting to have them in the correct order, the must be placed in reverse.
e.g.

player createDiaryRecord["Diary", ["Time of Day / Weather", "TEXT GOES HERE"]];

player createDiaryRecord["Diary", ["Enemy Composition", "TEXT GOES HERE"]];

player createDiaryRecord["Diary", ["Mission", "TEXT GOES HERE"]];

player createDiaryRecord["Diary", ["Situation", "TEXT GOES HERE"]];

This will display in the briefing tab - Situation, Mission, Enemy Composition, Time of Day / Weather

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

*/

player createDiaryRecord["Diary", ["Game Notes", "TEXT GOES HERE"]];
