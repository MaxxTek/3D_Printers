;File     : bltouch-bed.g
;Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
;Use-case : The BL-touch is affected by magnets. This 4 point bed.g was created by Robert Hendricks to probe points in the nulls in the magnetic field.
;         : remove/rename the original bed.g and rename this file to 'bed.g' to activate.


M561                         ; clear any existing bed transform
G1 Z5 S2

G30 P0 X15 Y20 Z-99999		; Adjusted with Offset
G30 P1 X15 Y275 Z-99999		; Adjusted with Offset

G30 P2 X295 Y150 Z-99999 S3
;G1 X0 Y0 F5000 ; move the head to the corner (optional)


