;File     : bltouch-bed.g
;Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
;Use-case : The BL-touch is affected by magnets. This 4 point bed.g was created by Robert Hendricks to probe points in the nulls in the magnetic field.
;         : remove/rename the original bed.g and rename this file to 'bed.g' to activate.


M561                         ; clear any existing bed transform
G1 Z5 S2
;G30 P0 X15 Y45 Z-99999		;Full Plate
;G30 P1 X15 Y275 Z-99999	;Full Plate
G30 P0 X25 Y45 Z-99999		;Textured Plate
G30 P1	X25 Y275 Z-99999	;Textured Plate
G30 P2 X295 Y150 Z-99999 S3
;G1 X0 Y0 F5000 ; move the head to the corner (optional)


;M561 ; clear any existing bed transform
;G30 P0 X50.5 Y45.9 Z-99999 ; define 4 points in a clockwise direction around the bed, starting near (0,0)
;G30 P1 X50.5 Y255.9 Z-99999
;G30 P2 X293.9 Y255.9 Z-99999
;G30 P3 X293.9 Y45.9 Z-99999 S3
;G1 X0 Y0 F5000


;From Emma Puggle 06/14/2019
;M561 ; clear any existing bed transform 05/05/2019
;G30 P0 X25 Y45 Z-99999 ; define 4 points in a clockwise direction around the bed, starting near (0,0)
;G30 P1 X25 Y275 Z-99999
;G30 P2 X275 Y275 Z-99999
;G30 P3 X275 Y45 Z-99999 S3
;G1 X2 Y2 F5000 ; move the head to the corner (optional)