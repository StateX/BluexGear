[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| AI |------------------------------------------------------

[Command]
name = "AI0"
command = a,a,a,a,b,b,b,b
time = 0
[Command]
name = "AI1"
command = a,a,a,a,c,c,c,c
time = 0
[Command]
name = "AI2"
command = a,a,a,a,x,x,x,x
time = 0
[Command]
name = "AI3"
command = a,a,a,a,y,y,y,y
time = 0
[Command]
name = "AI4"
command = a,a,a,a,z,z,z,z
time = 0
[Command]
name = "AI5"
command = a,a,a,a,s,s,s,s
time = 0
[Command]
name = "AI6"
command = a,a,a,a,F,F,F,F
time = 0
[Command]
name = "AI7"
command = a,a,a,a,D,D,D,D
time = 0
[Command]
name = "AI8"
command = a,a,a,a,B,B,B,B
time = 0
[Command]
name = "AI9"
command = a,a,a,a,U,U,U,U
time = 0
[Command]
name = "AI10"
command = b,b,b,b,a,a,a,a
time = 0
[Command]
name = "AI11"
command = b,b,b,b,c,c,c,c
time = 0
[Command]
name = "AI12"
command = b,b,b,b,x,x,x,x
time = 0
[Command]
name = "AI13"
command = b,b,b,b,y,y,y,y
time = 0
[Command]
name = "AI14"
command = b,b,b,b,z,z,z,z
time = 0
[Command]
name = "AI15"
command = b,b,b,b,s,s,s,s
time = 0
[Command]
name = "AI16"
command = b,b,b,b,F,F,F,F
time = 0
[Command]
name = "AI17"
command = b,b,b,b,D,D,D,D
time = 0
[Command]
name = "AI18"
command = b,b,b,b,B,B,B,B
time = 0
[Command]
name = "AI19"
command = b,b,b,b,U,U,U,U
time = 0
[Command]
name = "AI20"
command = c,c,c,c,a,a,a,a
time = 0
[Command]
name = "AI21"
command = c,c,c,c,b,b,b,b
time = 0
[Command]
name = "AI22"
command = c,c,c,c,x,x,x,x
time = 0
[Command]
name = "AI23"
command = c,c,c,c,y,y,y,y
time = 0
[Command]
name = "AI24"
command = c,c,c,c,z,z,z,z
time = 0
[Command]
name = "AI25"
command = c,c,c,c,s,s,s,s
time = 0
[Command]
name = "AI26"
command = c,c,c,c,F,F,F,F
time = 0
[Command]
name = "AI27"
command = c,c,c,c,D,D,D,D
time = 0
[Command]
name = "AI28"
command = c,c,c,c,B,B,B,B
time = 0
[Command]
name = "AI29"
command = c,c,c,c,U,U,U,U
time = 0
[Command]
name = "AI30"
command = x,x,x,x,a,a,a,a
time = 0
;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------
[Command]
name = "Black_Onslaught"
command = ~D,DF,F,D,DF,F,b
time = 30

[Command]
name = "Devoured_By_Darkness"
command = ~D, DB, B, D, DB, B, b
time = 25

[Command]
name = "Carnage_Scissors"
command = ~F, DF, D, DB, B, F, a
time = 25

[Command]
name = "Blood_Kain"
command = ~D, DB, B, D, DB, B, a
time = 25

;-| Special Motions |------------------------------------------------------
[Command]
name = "Not_Yet"
command = ~D,D,b
time = 15

[Command]
name = "Infernal_Divider_Axe_Kick"
command = ~D,DB,B,b
time = 15

[Command]
name = "Infernal_Divider_Soco_Fudidex"
command = ~D,DF,F,b
time = 15

[Command]
name = "Infernal_Divider_P2"
command = ~D,DF,F,b
time = 15

[Command]
name = "Infernal_Divider_Forte"
command = ~F,D,DF,a
time = 15

[Command]
name = "Infernal_Divider"
command = ~F,D,DF,b
time = 15

[Command]
name = "Hell_Fang"
command = D,DB,B,x
time = 15

[Command]
name = "Hell_Fang_2"
command = D,DB,B,a
time = 15

[Command]
name = "Death_Spike"
command = D,DB,B,a
time = 15

[Command]
name = "Gauntlet_Hades"
command = D,DB,B,y
time = 15

[Command]
name = "Gauntlet_Hades_P_2"
command = ~D,DB,B,a
time = 15

[Command]
name = "Grab"
command = z
time = 1

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery"
command = a
time = 1

[Command]
name = "recovery"
command = b
time = 1

[Command]
name = "recovery"
command = x
time = 1

[Command]
name = "recovery"
command = y
time = 1

[Command]
name = "recovery"
command = c
time = 1

[Command]
name = "recovery"
command = z
time = 1

[Command]
name = "Assault"
command = x+a
time = 1

[Command]
name = "Assault"
command = x+b
time = 1

[Command]
name = "Assault"
command = y+b
time = 1

[Command]
name = "Assault"
command = a+b
time = 1

[Command]
name = "Rapid"
command = x+a+b
time = 1

[Command]
name = "Rapid"
command = x+a+y
time = 1

[Command]
name = "Rapid"
command = x+y+b
time = 1

[Command]
name = "Rapid"
command = a+y+b
time = 1

[Command]
name = "Rapid"
command = c
time = 1


;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

[Command]
name = "up"
command = U
time = 1

[Command]
name = "forward"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name = "down"
command = D
time = 1


;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

[Command]
name = "High_Jump"
command = $D, $U
time = 10
;-------------------------------------------------------------------------------
;Não Remova a Linha Abaixo
[Statedef -1]
;-------------------------------------------------------------------------------
;Black Onslaught
[State -1, Black Onslaught]
type = ChangeState
value = 3030
triggerall = power >= 2000
triggerall = command = "Black_Onslaught"
triggerall = statetype != A
triggerall = ctrl
triggerall = Life <=500
trigger1 = stateno != 100
;-------------------------------------------------------------------------------
;Devoured By Darkness
[State -1, Devoured By Darkness]
type = ChangeState
value = 3020
triggerall = power >= 1000
triggerall = numhelper(26)
triggerall = command = "Blood_Kain"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;-------------------------------------------------------------------------------
;Blood Kain
[State -1, Blood Kain]
type = ChangeState
value = 3010
triggerall = power >= 1000
triggerall = command = "Blood_Kain"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;-------------------------------------------------------------------------------
;Carnage Scissors
[State -1, Carnage Scissors]
type = ChangeState
value = 3000
triggerall = power >= 1000
triggerall = command = "Carnage_Scissors"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;-------------------------------------------------------------------------------
; I'ts Not Over Yet
[State -1, I'ts Not Over Yet]
type = ChangeState
value = 1040
triggerall = command = "Not_Yet"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;-------------------------------------------------------------------------------
;Infernal Divider Axe Kick
[State -1, Infernal Divider Axe Kick]
type = ChangeState
value = 1037
triggerall = var(59) < 1
triggerall = command = "Infernal_Divider_Axe_Kick"
trigger1 = stateno = 1035
trigger1 = movehit = 1 || time > 3
;-------------------------------------------------------------------------------
;Infernal Divider Soco Fudidex
[State -1, Infernal Divider Soco Fudidex]
type = ChangeState
value = 1036
triggerall = var(59) < 1
triggerall = command = "Infernal_Divider_Soco_Fudidex"
trigger1 = stateno = 1035
trigger1 = movehit = 1 || time > 3
;-------------------------------------------------------------------------------
;Infernal Divider Soco
[State -1, Infernal Divider Soco]
type = ChangeState
value = 1035
triggerall = var(59) < 1
triggerall = command = "Infernal_Divider_P2"
trigger1 = stateno = [1031,1034]
trigger1 = movehit = 1 || time > 3
;-------------------------------------------------------------------------------
;Infernal Divider Forte
[State -1, Infernal Divider Forte]
type = ChangeState
value = 1033
TriggerAll = Var(59) < 1
triggerall = command = "Infernal_Divider_Forte"
trigger1 = statetype != C
trigger1 = ctrl || fvar(0)
trigger2 = stateno = 100
trigger3 = stateno = 103
trigger4 = movecontact
trigger4 = stateno = 200
trigger5 = movecontact
trigger5 = stateno = 210
trigger6 = movecontact
trigger6 = stateno = 400
trigger7 = movecontact
trigger7 = stateno = 410
trigger8 = movecontact
trigger8 = stateno = 230
trigger9 = movecontact
trigger9 = stateno = 430
trigger10 = movecontact
trigger10 = stateno = 260
trigger11 = stateno = 40 || stateno = 52
;-------------------------------------------------------------------------------
;Infernal Divider
[State -1, Infernal Divider]
type = ChangeState
value = 1030
TriggerAll = Var(59) < 1
triggerall = command = "Infernal_Divider"
trigger1 = statetype != C
trigger1 = ctrl || fvar(0)
trigger2 = stateno = 100
trigger3 = stateno = 103
trigger4 = movecontact
trigger4 = stateno = 200
trigger5 = movecontact
trigger5 = stateno = 210
trigger6 = movecontact
trigger6 = stateno = 400
trigger7 = movecontact
trigger7 = stateno = 410
trigger8 = movecontact
trigger8 = stateno = 230
trigger9 = movecontact
trigger9 = stateno = 430
trigger10 = movecontact
trigger10 = stateno = 260
trigger11 = stateno = 40 || stateno = 52
;-------------------------------------------------------------------------------
;Hell's Fang Parte 2
[State -1, Hell's Fang Parte 2]
type = ChangeState
value = 1021
triggerall = var(59) < 1
triggerall = command = "Hell_Fang_2"
trigger1 = stateno = [1020,1020]
trigger1 = movehit = 1
;-------------------------------------------------------------------------------
;Hell's Fang
[State -1, Hell's Fang]
type = ChangeState
value = 1020
TriggerAll = Var(59) < 1
triggerall = command = "Hell_Fang"
trigger1 = statetype != A
trigger1 = ctrl || fvar(0)
trigger2 = stateno = 100
trigger3 = stateno = 103
trigger4 = movecontact
trigger4 = stateno = 200
trigger5 = movecontact
trigger5 = stateno = 210
trigger6 = movecontact
trigger6 = stateno = 400
trigger7 = movecontact
trigger7 = stateno = 410
trigger8 = movecontact
trigger8 = stateno = 230
trigger9 = movecontact
trigger9 = stateno = 430
trigger10 = movecontact
trigger10 = stateno = 260
;-------------------------------------------------------------------------------
[State -1, Death Spike]
type = ChangeState
value = 1000
triggerall = command = "Death_Spike"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 220 && movecontact
trigger6 = stateno = 230 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 420 && movecontact
;-------------------------------------------------------------------------------
[State -1, Gauntlet Hades Kick]
type = ChangeState
value = 1011
triggerall = var(59) < 1
triggerall = command = "Gauntlet_Hades_P_2"
trigger1 = stateno = [1010,1010]
trigger1 = movehit = 1

;---------------------------------------------------------------------------
;Gauntlet Hades
[State -1, Gauntlet Hades]
type = ChangeState
value = 1010
triggerall = var(59) < 1
triggerall = command = "Gauntlet_Hades"
trigger1 = statetype != C
trigger1 = ctrl || fvar(0)
trigger2 = stateno = 100
trigger3 = stateno = 103
trigger4 = movecontact
trigger4 = stateno = 200
trigger5 = movecontact
trigger5 = stateno = 210
trigger6 = movecontact
trigger6 = stateno = 400
trigger7 = movecontact
trigger7 = stateno = 410
trigger8 = movecontact
trigger8 = stateno = 230
trigger9 = movecontact
trigger9 = stateno = 430
trigger10 = movecontact
trigger10 = stateno = 235
trigger11 = movecontact
trigger11 = stateno = 220
trigger12 = movecontact
trigger12 = stateno = 215
trigger13 = movecontact
trigger13 = stateno = 205
trigger14 = movecontact
trigger14 = stateno = 220
trigger15 = movecontact
trigger15 = stateno = 225
;-------------------------------------------------------------------------------
[State -1, Counter Assault]
type = ChangeState
value = 970
triggerall = alive
triggerall = command = "Assault" && command = "holdfwd"
triggerall = power >= 1000
triggerall = stateno = [150,153]
triggerall = var(59) < 1
trigger1 = !hitshakeover
trigger1 = movetype = H
;-------------------------------------------------------------------------------
[State -1, Counter Assault]
type = ChangeState
value = 971
triggerall = alive
triggerall = command = "Assault" && command = "holdfwd"
triggerall = power >= 1000
triggerall = stateno = [150,153]
triggerall = var(59) < 1
trigger1 = movetype = H
;-------------------------------------------------------------------------------
;Recovery Forward
[State -1,Recovery Forward]
type = Changestate
triggerall = var(59)<1
triggerall = roundstate = 2 && alive
triggerall = (stateno = 5120) && (time = 1)
trigger1 = command = "holdfwd"
value = 5220
;-------------------------------------------------------------------------------
;Recovery Backward
[State -1,Recovery Back]
type = Changestate
triggerall = var(59)<1
triggerall = roundstate = 2 && alive
triggerall = (stateno = 5120) && (time = 1)
trigger1 = command = "holdback"
value = 5230
;-------------------------------------------------------------------------------
[State -1,Recovery Back]
type = Changestate
triggerall = var(59)<1
triggerall = roundstate = 2 && alive
triggerall = (stateno = 5120) && (time = 1)
trigger1 = ((command = "hold_a")|| (command="hold_b")||(command="hold_c")|| (command="hold_x")||(command="hold_y")||(command="hold_z"))
value = 5201
;-------------------------------------------------------------------------
; Rapid
[State -1, Rapid]
type = ChangeState
value = 950
triggerall = var(59) < 1
trigger1 = power >= 1000
trigger1 = command = "Rapid" || !stateno = [3030,3031]
trigger1 = statetype = S || statetype = C
trigger1 = var(20) = 1
;-------------------------------------------------------------------------
; Air Rapid
[State -1, Air Rapid]
type = ChangeState
value = 960
triggerall = var(59) < 1
trigger1 = power >= 1000
trigger1 = command = "Rapid"
trigger1 = statetype = A || !stateno = [3030,3031]
trigger1 = var(20) = 1
;-------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "Grab"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;-----------------------------------------------------------------------
; Back Throw
[State -1, Back Throw]
type = ChangeState
value = 830
triggerall = command = "Grab"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdback"
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;-------------------------------------------------------------------------
;Air throw
[State -1, Air Throw]
type = ChangeState
value = 850
triggerall = command = "Grab"
triggerall = var(59) < 1
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 && movecontact > 1
trigger3 = stateno = 110 && var(5) >= 5 || stateno = 115 && var(5) <= -5
;-------------------------------------------------------------------------------
[State -1, Dash Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
triggerall = var(59) < 1
trigger1 = statetype = S
trigger1 = ctrl
;-------------------------------------------------------------------------------
[State -1, Dash Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
triggerall = var(59) < 1
trigger1 = statetype = S
trigger1 = ctrl
;-------------------------------------------------------------------------------
[State -1, Air Dash Forward]
type = ChangeState
value = 110
triggerall = command = "FF"
triggerall = var(5) = 0
triggerall = var(59) < 1
triggerall = statetype = A
triggerall = ctrl
trigger1 = pos Y  <= -40 && vel Y < 0
trigger2 = pos Y  <= -10 && vel Y >= 0
;-------------------------------------------------------------------------------
[State -1, Air Dash Back]
type = ChangeState
value = 115
triggerall = command = "BB"
triggerall = var(5) = 0
triggerall = var(59) < 1
triggerall = statetype = A
triggerall = ctrl
trigger1 = pos Y  <= -40 && vel Y < 0
trigger2 = pos Y  <= -10 && vel Y >= 0
;-------------------------------------------------------------------------------
[State -1, High Jump]
type = ChangeState
value = 900
triggerall = command = "High_Jump"
triggerall = var(3) = 0
triggerall = var(59) < 1
trigger1 = statetype != A && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 210 && movecontact > 1
trigger4 = stateno = 220 && movecontact > 1
trigger5 = stateno = 420 && movecontact > 1
;-------------------------------------------------------------------------------
[State -1, Jump Start]
type = ChangeState
value = 40
triggerall = command = "holdup"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 210 && movecontact > 1
trigger4 = stateno = 220 && movecontact > 1
trigger5 = stateno = 420 && movecontact > 1
;-------------------------------------------------------------------------------
[State -1, Air Jump Start]
type = ChangeState
value = 45
triggerall = command = "holdup"
triggerall = var(4) != 2
triggerall = var(5) = 0
triggerall = var(59) < 1
trigger1 = stateno = 610 && movecontact > 1
trigger2 = stateno = 620 && movecontact > 1
;-------------------------------------------------------------------------------
[State -1, Taunt]
type = ChangeState
value = ifelse(var(58) = 1,196,195)
triggerall = command = "start"
triggerall = var(59) < 1
trigger1 = statetype != A
trigger1 = ctrl
;-------------------------------------------------------------------------------
[State -1, Dash Cancel]
type = ChangeState
value = 910
triggerall = command = "FF"
triggerall = var(59) < 1
triggerall = statetype = S
trigger1 = stateno = 220 && movecontact > 1
trigger2 = stateno = 235 && movecontact > 1
;-----------------------------------------------------------------------------
[State -1, Light Punch Closed]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
;----------------------------------------------------------
[State -1, Light Punch]
type = ChangeState
value = 200
triggerall = command = "x" && command != "holddown"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 200 && animelemtime(5) >= 0
trigger5 = stateno = 400 && movecontact
;-----------------------------------------------------------------------------
[State -1, Kick Closed]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
;------------------------------------------------------------------------------
[State -1,  Kick]
type = ChangeState
value = 210
triggerall = command = "y" && command != "holddown"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
;------------------------------------------------------------------------------
[State -1, Closed Special Attack]
type = ChangeState
value = 225
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 220 && movecontact
trigger6 = stateno = 230 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
;------------------------------------------------------------------------------
[State -1, Special Attack]
type = ChangeState
value = 220
triggerall = command = "a" && command != "holddown"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 205 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 215 && movecontact
trigger7 = stateno = 230 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact
trigger10 = stateno = 430 && movecontact
;------------------------------------------------------------------------------
[State -1, Closed Slash]
type = ChangeState
value = 235
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 205 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 215 && movecontact
trigger7 = stateno = 230 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact
;------------------------------------------------------------------------------
[State -1, Slash]
type = ChangeState
value = 230
triggerall = command = "b" && command != "holddown"
triggerall = var(59) < 1
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
;---------------------------------------------------------------------------
[State -1, Crouch Light Punch]
type = ChangeState
value = 400
triggerall = command = "x" && command = "holddown"
triggerall = var(59) < 1
trigger1 = statetype = C && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 200 && animelemtime(5) >= 0
trigger5 = stateno = 400 && movecontact
;--------------------------------------------------------------------------
[State -1, Crouch Kick]
type = ChangeState
value = 410
triggerall = command = "y" && command = "holddown"
triggerall = var(59) < 1
trigger1 = statetype = C && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 400 && movecontact
;------------------------------------------------------------------------------
[State -1, Crouch Special Attack]
type = ChangeState
value = 420
triggerall = command = "a" && command = "holddown"
triggerall = var(59) < 1
trigger1 = statetype = C && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 220 && movecontact
trigger6 = stateno = 225 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 230 && movecontact
;-------------------------------------------------------------------------------
[State -1,Crouch Closed Slash]
type = ChangeState
value = 435
triggerall = command = "b" && command = "holddownfwd"
triggerall = var(59) < 1
trigger1 = statetype = C && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 220 && movecontact
trigger6 = stateno = 225 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 430 && movecontact
;-------------------------------------------------------------------------------
[State -1, Crouch Slash]
type = ChangeState
value = 430
triggerall = command = "b" && command = "holddown"
triggerall = var(59) < 1
trigger1 = statetype = C && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 220 && movecontact
trigger6 = stateno = 230 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
;-------------------------------------------------------------------------------
[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = var(59) < 1
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 110 && var(5) >= 5 || stateno = 115 && var(5) <= -5
;-------------------------------------------------------------------------------
[State -1, Jumping Kick]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = var(59) < 1
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 110 && var(5) >= 5 || stateno = 115 && var(5) <= -5
;-------------------------------------------------------------------------------
[State -1, Jumping Special Attack]
type = ChangeState
value = 620
triggerall = command = "a"
triggerall = var(59) < 1
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact
trigger5 = stateno = 110 && var(5) >= 5 || stateno = 115 && var(5) <= -5
trigger6 = stateno = 225 && movecontact
;-------------------------------------------------------------------------------
[State -1, Jumping Slash]
type = ChangeState
value = 630
triggerall = command = "b"
triggerall = var(59) < 1
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 110 && var(5) >= 5 || stateno = 115 && var(5) <= -5



