; Home X Axis

;G91
;G1 Z4 F200 S2
;G1 X-320 F3000 S1
;G1 X4 F600
;G1 X-10 S1
;G1 Z-4 F200 S2
;G90

M400 ; wait til stuff stops
M574 X1 Y1 S3 ; use stall guard for endstops
M913 X30 Y30  ; drop motor currents to 30% 
M201 X1000 Y1000 ; reduce acceleration on X/Y to stop false triggers
M915 P0:1 S3 R0 F0 H400; both motors because corexy; Sensitivity 4, don’t take action, don’t filter, 400steps/sec
G91 ; set relative
G1 Z5 F1200 S2
G1 S1 X-350 F4000 ; move left 250mm, stopping at the endstop
G1 X45 F1200; move away from end
G1 Z-5 F1200 S2
G90 ; back to absolute positioning
M400 ; wait again
M913 X100 Y100  ; motor currents back to 100%
M201 X3000 Y3000 ; accel back to original
M574 X1 Y1 Z0 S0 ; set endstops back 