; Configuration file for My Printer
; Communication and general
M111 S0                             	; Debug off
M550 P"MaxxRailCore"					; Machine name and Netbios name (can be anything you like)
;M551 Pmyrap                        	; Machine password (used for FTP)
;*** If you have more than one Duet on your network, they must all have different MAC addresses, so change the last digits
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xEE 	; MAC Address
;*** Wifi Networking
M552 S1								; Enable WiFi
M555 P2                           	; Set output to look like Marlin
M575 P1 B57600 S1					; Comms parameters for PanelDue

G21                                 	; Work in millimeters
G90                                	; Send absolute coordinates...
M83                                 	; ...but relative extruder moves

; Axis and motor configuration
M667 S1								; CoreXY mode

M584 X0 Y1 Z5:6:7 E3:4:8:9 		; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S1                          ; Drive 0 goes forwards (change to S0 to reverse it) X stepper (Rear)
M569 P1 S0                          ; Drive 1 goes backwards	Y Stepper (Front)
M569 P2 S1                          ; Drive 2 goes forwards		Unused
M569 P3 S1                          ; Drive 3 goes forwards		Extruder 
M569 P4 S1                          ; Drive 4 goes forwards		Extruder (unused)
M569 P5 S0							; Drive 5 goes backwards	Front Left Z
M569 P6 S0							; Drive 6 goes backwards	Rear Left Z
M569 P7 S1							; Drive 7 goes backwards	Right Z

;Leadscrew locations
M671 X-10:-10:333  Y22.5:277.5:150 S7.5  ;Front left, Rear Left, Right  S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew

M350 X16 Y16 Z16 E16 I1	    		; set 16x microstepping for axes& extruder, with interpolation
M574 X1 S1 Y1 Z0 S0		    	; set homing switch configuration (x,y at min, z at max) IF YOU NEED TO REVERSE YOUR HOMING SWITCHES CHANGE S1 to S0
M906 X1400 Y1400 Z1000 E1250 I60 ;	 Set motor currents (mA)
M201 X3000 Y3000 Z200 E1000          	; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600      	; Maximum speeds (mm/min)
M566 X1000 Y1000 Z30 E20            	; Maximum jerk speeds mm/minute
M208 X310 Y300 Z330                 	; set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z-0.0 S1                 	; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed) Z Default -0.5
M92 X200 Y200 Z1600 E837	    	; steps/mm
M206 X-10				; Set Endstop Offset


; Thermistors
M305 P0 T100000 B3950 R4700 H0 L0	; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4725 R4700 H0 L0 C7.06e-8	; Put your own H and/or L values here to set the first nozzle thermistor ADC correction

;M307 H0 A240.3 C608.7 D8.2 S1.00 V24.1 B0 	; Bed Heaters
;M307 H1 A270.7 C90.4 D6.7 B0 S1.0		; Heater 1 model
M307 H0 A365.9 C846.7 D18.1 S1.00 V24.6 B0	; Tuned 06/14/2019 Bed Heater
;M307 H0 A506.8 C1079.0 D13.7 S1.00 V24.6 B0 	; Tuned Settings
M307 H1 A500.9 C273.8 D3.9 S1.00 V24.6 B0	; Tuned Settings



M570 S360				; Hot end may be a little slow to heat up so allow it 180 seconds
M143 S285

; Fans
;M106 P0 H-1 				; disable thermostatic mode for fan 0
M106 P1 T45 H1 				; enable thermostatic mode for fan 1 and set to 45
M106 P2 H-1				; disable thermostatic mode for fan 2
;M106 P0 S0 				; turn off fans
;M106 P1 S0
M106 P2 S0
	
; Tool definitions
M563 P0 S"E3Dv6 Gold" D0 H1 F2                     ; Define tool 0 switched to Fan 2 since Fan 1 doesn't seem to work
G10 P0 S0 R0                        		; Set tool 0 operating and standby temperatures
M143 H1 S290                        ; Maximum H1 (Extruder) heater temperature (E3D requires 285C to change nozzle)

;*** If you have a single-nozzle build, comment the next 2 lines

;M563 P1 D1 H2                      	; Define tool 1
;G10 P1 S0 R0 X0 Y17                   	; Set tool 1 operating and standby temperatures


;M557 X40:280 Y40:280 S40	;Define Mesh

; Z probe and compensation definition
;*** If you have a switch instead of an IR probe, change P1 to P4 in the following M558 command
; IR PRobe - uncomment the following 2 lines if you have a and IR Probe, and comment out the BLTouch section below
;M558 P1 X0 Y0 Z1			; Z probe is an IR probe and is not used for homing any axes
;G31 X0 Y30 Z2.00 P500			; Set the zprobe height and threshold (put your own values here) 

;BLTouch - comment out the following 3 lines if using a IR Probe
;M307 H3 A-1 C-1 D-1
;M558 P9 X0 Y0 Z1 H5 F50 T6000 A5 S0.02  
;G31 X2 Y42 Z1.85 P25 ; Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here

;Precision Piezo Orion
;M558 P8 I1 H3 R0.5 F250
;G31 X0 Y0 Z-0.10 P50
;M558 P8 I1 H3 R1 F250 T6000 A5 S0.005 	; Probe type digital/unfiltered, Inverted, Dive Height 3mm, Recovery time after trigger .5 secs, Speed 450mm/m (possible 600), Speed between probes 600mm/m, Probe 5 times until there's less than 0.005 deviations between any 2 consecutive samples
;G31 X0 Y0 Z0.02 P250 			;  P500 Default Z-0.02 Last was -0.1 Default Set current probe status, X/Y/Z height, tells machine it is at height of Z[x] when touches bed. A larger (positive) trigger height in G31 moves you CLOSER to the bed, a lower (further negative) number sets the nozzle higher (more gap).
;M574 Z1 S2 				; Set endstops controlled by probe for Precision Piezo Orion

;M558 P1 I1 H3 R0.1 F450 T6000 A5 S0.005; Precision Piezo Orion v2.0(analog)
M558 P1 I1 H2.5 R0.1 F450 T6000 A5 S0.005; Precision Piezo Orion v2.0(analog) H0.5
G31 X0 Y0 Z0.0 P470 		; Your p-val is going to depend a lot on your particular setup.  Look at the z-probe resting value and add 10-20.G31 X0 Y0 Z-0.05 P468 Was just 0.04
			 	; e.g. - this value of 480 is based on a resting value of 465. The sensitivity of the tuning potentiometer and your mounting
			 	; of the piezo may impact this


;M501
;
T0					; select first hot end