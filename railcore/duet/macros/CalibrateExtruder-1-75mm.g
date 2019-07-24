; This is the g-code that extrudes 100mm of filament for a 1.75mm extruder.
;
; Simply run it as a macro in RepRapFirmware or print it like g-code. It will beep and 
; then pause for 10 seconds so you can set things up. Then it beeps again and starts
; the calibration.
;
G21		; millimeters
M83		; relative extruder moves
T0		; select the first extruder
M300 S300 P800
G4 S10		; wait 10 seconds to get set up
M300 S300 P500
G1 E0		; set extruder 1 to 0
G1 E10 F30	; extrude 10mm at .5mm/s
G1 E10 F60	; extrude 10mm at 1mm/s
G1 E10 F120	; extrude 10mm at 2mm/s
G1 E10 F180	; extrude 10mm at 3mm/s
G1 E10 F180	; extrude 10mm at 3mm/s
G1 E10 F180	; extrude 10mm at 3mm/s
G1 E10 F120	; extrude 10mm at 3mm/s
G1 E10 F120	; extrude 10mm at 2mm/s
G1 E10 F60	; extrude 10mm at 1mm/s
G1 E10 F30	; extrude 10mm at .5mm/s
M300 S300 P500