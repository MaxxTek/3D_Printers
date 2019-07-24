;File     : TrueLevel Then Probe.g
;Effect   : Homes, performs 3 bed-leveling routines and homes again.
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.

M98 P"0:\macros\2_True_Level.g" 	; Run the True_Level.g macro
M98 P"0:\macros\Probe_Bed.g"