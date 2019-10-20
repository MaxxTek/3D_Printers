; stop.g
; called when a print is cancelled after a pause.
M106 S1		;Turn on Part Cooler
G1 E-5 F180	;Retract Filament
M104 S160	;Set Temp to 160
G91 ; Relative move
G1 Z+30		;Go down 30mm
;M18 X Y		;Turn of X & Y
M18 E0		;Turn off Extruder
G90		;Absolute Moves


