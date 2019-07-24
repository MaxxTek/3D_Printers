;File     : TrueLevel.g
;Effect   : Homes, performs 3 bed-leveling routines and homes again.
;Use-case : Time-saving macro, in order to get the bed as level as possible and homed.

M140 S60	; Set Bed Temp to 60C
M109 S130 T0 	; Wait for hot-end temp to rise to 130C

G28 X Y		; Home X & Y

M561     	; Clear bed transforms
G29 S2		; Clear Mesh
G28 Z    	; Home Z
G32      	; Level Bed 1
G32      	; Level Bed 2
G32      	; Level Bed 3
G32		; Level Bed 4
G32		; Level Bed 5
G28 Z    	; Home Z

   
