; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[command]
name = "counter"
command = B,D,DB,x
time = 15

[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
[command]
name = "Low Parry"
command = D
time = 0

[command]
name = "Block"
command = F
time = 0

[command]
name = "Block 2"
command = D
time = 0

[command]
name = "Air dash"
command = F,F
time = 15

command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
[command]
name = "Taunt"
command = s
time = 15

command.buffer.time = 1

;Super Jump
[Command]
name = "SJ"
command = $D, $U

[Command]
name = "Super_Jump"
command = ~D, U

[command]
name = "bolt"
command = D,DF,F,x
time = 15

;-| Super Motions |--------------------------------------------------------
[command]
name = "Rapid beams"
command = D,DF,F,x+y
time = 15

[command]
name = "Buzzsaw"
command = D,DF,F,b+c
time = 15

[command]
name = "thunder"
command = D,DF,F,c
time = 15
;-| Special Motions |------------------------------------------------------
[command]
name = "Laser shot"
command = D,DF,F,x
time = 15

[command]
name = "M.Laser shot"
command = D,DF,F,y
time = 15

[command]
name = "H.Laser shot"
command = D,DF,F,z
time = 15

[command]
name = "L.Laser shot"
command = D,DF,F,a
time = 15

[command]
name = "LM.Laser shot"
command = D,DF,F,b
time = 15

[command]
name = "LH.Laser shot"
command = D,DF,F,c
time = 15


[command]
name = "Dash teleport back short"
command = D,D,b
time = 15

[command]
name = "Dash teleport back long"
command = D,D,a
time = 15

[command]
name = "Dash teleport forward short"
command = D,D,y
time = 15

[command]
name = "Dash teleport forward long"
command = D,D,x
time = 15
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
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
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
name = "s"
command = s
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
;------------------------------------A.I------------------------------------
[Command]
name = "AI_1"
command=U,B,F,F,B,B
time=1

[Command]
name = "AI_2"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_3"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_4"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_5"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_6"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_7"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_8"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_9"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_10"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_11"
command = U,B,F,F,B,B
time = 1

[Command]
name = "AI_12"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_13"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_14"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_15"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_16"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_17"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_18"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_19"
command = U,B,F,F,B,B
time = 1

[command]
name = "AI_20"
command = U,B,F,F,B,B
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;counter
[State -1, counter]
type = ChangeState
value = 1350
triggerall = command = "counter"
trigger1 = (statetype = s) && ctrl

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y" || command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 10
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H


;Low parry
[State -1, Low Parry]
type=hitoverride
triggerall=var(59)<=0&&roundstate=2&&statetype!=a
triggerall=(statetype=S&&command="holddown")||(statetype=C&&command="holdfwd")&&command!="holdback"&&command!="holdup"
trigger1=ctrl||stateno=700||stateno=701
trigger1=var(21):=2
trigger2=(stateno=[150,153])
trigger2=var(21):=-2
attr=C,AA,AP
stateno=701
slot=0
time=ifelse((stateno=[150,153]),4,8)


;Block 2
[State -1, Block 2]
type = ChangeState
value = 18200
triggerall = command = "Block 2"
triggerall = prevstateno !=11
triggerall=(statetype=S&&command="holddown")||(statetype=C&&command="holdfwd")&&command!="holdback"&&command!="holdup"
trigger1 = ctrl = 1
trigger2 = stateno = 18300
trigger2 = AnimElem = 1, < 0
stateno = 4000,4200
attr = SA, AA, AP

[State -1,  parry];ShinraFix
type = hitoverride
triggerAll = statetype =S && statetype != C && statetype !=A && roundstate = 2
trigger1 = ctrl = 1 || (stateno = [4000,4100])
triggerall=command="holdfwd"&&command!="holdback"&&command!="holdup"&&command!="holddown"
triggerall = stateno != 100 || stateno != 101
attr = SA, AA, AP
stateno = 4000
time = 2

[State -1, air parry];ShinraFix
type = hitoverride
triggerAll = statetype =A && statetype !=S && statetype != C && roundstate = 2
trigger1 = ctrl = 1 || stateno = 4200
triggerall=command="holdfwd"&&command!="holdback"&&command!="holdup"&&command!="holddown"
attr = SA, AP, AA
stateno = 4200
time = 2

;Dash teleport forward long
[State -1, Dash teleport forward long]
type = ChangeState
value = 1600
triggerall = command = "Dash teleport forward long"
trigger1 = (statetype = s) && ctrl


;Dash teleport forward short
[State -1, Dash teleport forward short]
type = ChangeState
value = 1610
triggerall = command = "Dash teleport forward short"
trigger1 = (statetype = s) && ctrl


;Dash teleport back long
[State -1, Dash teleport back long]
type = ChangeState
value = 1620
triggerall = command = "Dash teleport back long"
trigger1 = (statetype = s) && ctrl


;Dash teleport back short
[State -1, Dash teleport back short]
type = ChangeState
value = 1630
triggerall = command = "Dash teleport back short"
trigger1 = (statetype = s) && ctrl

;Air dash
[State -1, Air dash]
type = ChangeState
value = 107
triggerall = command = "Air dash"
trigger1 = (statetype = a) && ctrl


[State -1, AI]
type = VarSet
trigger1 = command = "AI_1"
trigger2 = command = "AI_2"
trigger3 = command = "AI_3"
trigger4 = command = "AI_4"
trigger5 = command = "AI_5"
trigger6 = command = "AI_6"
trigger7 = command = "AI_7"
trigger8 = command = "AI_8"
trigger9 = command = "AI_9"
trigger10 = command = "AI_10"
trigger11 = command = "AI_11"
trigger12 = command = "AI_12"
trigger13 = command = "AI_13"
trigger14 = command = "AI_14"
trigger15 = command = "AI_15"
trigger15 = command = "AI_16"
trigger15 = command = "AI_17"
trigger15 = command = "AI_18"
trigger15 = command = "AI_19"
trigger15 = command = "AI_20"
v = 59
value = 1

[State Aerial Rave OK]
type = VarSet
trigger1 = HitDefAttr = A, NA
trigger1 = MoveHit = 1
var(16) = var(16) + 1

[State Aerial Rave Not OK]
type = VarSet
trigger1 = HitDefAttr = S, NA
trigger1 = MoveHit = 1
var(16) = var(16) - 1


;Rapid beams
[State -1, Rapid beams]
type = ChangeState
value = 3000
triggerall = command = "Rapid beams"
trigger1 = (statetype = s) && ctrl
triggerall = (Power >= 1000) && (Var(22) != 1) && (RoundState = 2)
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;bolt
[State -1, bolt]
type = ChangeState
value = 1100
triggerall = command = "bolt"
trigger1 = (statetype = s) && ctrl
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;Rapid beams
[State -1, Rapid beams]
type = ChangeState
value = 3200
triggerall = command = "thunder"
trigger1 = (statetype = s) && ctrl
triggerall = (Power >= 1000) && (Var(22) != 1) && (RoundState = 2)
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact


;Laser shot
[State -1, Laser shot]
type = ChangeState
value = 1000
triggerall = command = "Laser shot"
trigger1 = (statetype = s) && ctrl
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;Laser shot
[State -1, Laser shot]
type = ChangeState
value = 1001
triggerall = command = "L.Laser shot"
trigger1 = (statetype = s) && ctrl
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;Laser shot
[State -1, Laser shot]
type = ChangeState
value = 1011
triggerall = command = "LM.Laser shot"
trigger1 = (statetype = s) && ctrl
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;Laser shot
[State -1, Laser shot]
type = ChangeState
value = 1012
triggerall = command = "LH.Laser shot"
trigger1 = (statetype = s) && ctrl
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;Laser shot
[State -1, Laser shot]
type = ChangeState
value = 1002
triggerall = command = "M.Laser shot"
trigger1 = (statetype = s) && ctrl
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact


;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "Taunt"
trigger1 = (statetype = s) && ctrl


[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)<1
triggerall = StateType = S || StateType = C
triggerall = ctrl
trigger1 = Command = "SJ"
trigger2 = command = "Super_Jump"
;trigger3 = command = "SSSuper_Jump"
;trigger4 = command = "SSSSuper_Jump"
;trigger5 = command = "SSSSSuper_Jump"
;---------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)<1
triggerall = Command = "holdup"
trigger1 = stateno = 420 && movehit
;---------------------------------------------------------------------------

;BB
[State -1, BB]
type = ChangeState
value = 105
triggerall = command = "BB"
trigger1 = (statetype = s) && ctrl


;FF
[State -1, FF]
type = ChangeState
value = 100
triggerall = command = "FF"
trigger1 = (statetype = s) && ctrl


;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59)>0 && random <=500
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist x <=30
trigger1 = p2stateno !=[5000,5999]
;------------------------------AI---------------------------------
; Stand Light Punch
[State -1, AI Stand Medium Punch]
type = ChangeState
value = 210
triggerall = var(59)>=1  && random <=200
triggerall = statetype != A
trigger1 = p2bodydist x <=30
trigger1 = ctrl
;------------------------------AI---------------------------------
; Stand Light Punch
[State -1, AI Crouch lp]
type = ChangeState
value = 400
triggerall = var(59)>=1  && random <=600
triggerall = statetype != A
trigger1 = p2bodydist x <=30
trigger1 = ctrl
;------------------------------AI---------------------------------
; Stand Light Punch
[State -1, AI Crouch hp]
type = ChangeState
value = 420
triggerall = var(59)>=1  && random <=600
triggerall = statetype != A
trigger1 = stateno = 400 && movehit && p2statetype !=A
;trigger2 = ctrl && p2statetype !=A  && random <=50 && p2bodydist x >=90
;------------------------------AI---------------------------------
; Stand Light Punch
[State -1, AI Crouch hk]
type = ChangeState
value = 450
triggerall = var(59)>=1  && random <=200
triggerall = statetype != A
trigger1 = stateno = 400 && movehit && p2statetype !=A
;trigger2 = ctrl && p2statetype !=A  && random <=50 && p2bodydist x >=90
;---------------------------------------------------------------------------
[State -1, AI Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)>=1
trigger1 = stateno = 420 && movehit
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59)>0
trigger1 = statetype = A
trigger1 = stateno = 7001 ;&& time > 4
trigger1 = p2bodydist x <=30
trigger1 = p2bodydist y >=-25
trigger1 = p2movetype= H
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Jump lk]
type = ChangeState
value = 630
triggerall = var(59)>0
trigger1 = statetype = A
;trigger1 = ctrl
trigger1 = stateno = 600 && movehit
 ;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Jump mp]
type = ChangeState
value = 610
triggerall = var(59)>0
trigger1 = statetype = A
;trigger1 = ctrl
trigger1 = stateno = 630 && movehit
 ;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Jump mk]
type = ChangeState
value = 640
triggerall = var(59)>0
trigger1 = statetype = A
;trigger1 = ctrl
trigger1 = stateno = 610 && movehit && random <=300
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, AI Jump hp]
type = ChangeState
value = 620
triggerall = var(59)>0
triggerall = random <=300
trigger1 = statetype = A
;trigger1 = ctrl
trigger1 = stateno = 640 && movehit
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, AI Jump Heavy kick]
type = ChangeState
value = 650
triggerall = var(59)>0
triggerall = random <=300
trigger1 = statetype = A
;trigger1 = ctrl
trigger1 = stateno = 640 && movehit && random <=500
;------------------------------AI---------------------------------
; Stand Light Punch
[State -1, AI Crouch LK]
type = ChangeState
value = 430
triggerall = var(59)>=1  && random <=500
triggerall = statetype != A
triggerall = p2statetype != A
trigger1 = p2bodydist x <=30
trigger1 = ctrl
;------------------------------AI---------------------------------
; Stand Light Punch
[State -1, AI Crouch hk]
type = ChangeState
value = 450
triggerall = var(59)>=1  ;&& random <=500
triggerall = statetype != A
trigger1 = (stateno = 430) && movehit
;trigger2 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59)<1
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = ( stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch+F]
type = ChangeState
value = 300
triggerall = var(59)<1
triggerall = command = "holdfwd" && command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
 ;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = var(59)<1
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = var(59)<1
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440|| stateno = 200|| stateno = 400||stateno = 230|| stateno = 430)  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Medium Kick+f]
type = ChangeState
value = 310
triggerall = var(59)<1
triggerall = command = "holdfwd" && command ="b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59)<1
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = ( stateno = 200 || stateno = 400 || stateno = 430)  && movecontact
;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = var(59)<1
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = var(59)<1
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440|| stateno = 200|| stateno = 400||stateno = 230|| stateno = 430)  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59)<1
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = ( stateno = 230 || stateno = 200 || stateno = 430)  && movecontact
;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = var(59)<1
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = var(59)<1
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440|| stateno = 200|| stateno = 400||stateno = 230|| stateno = 430)  && movecontact;  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59)<1
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = ( stateno = 230 || stateno = 400 || stateno = 200)  && movecontact
;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = var(59)<1
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = var(59)<1
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440|| stateno = 200|| stateno = 400||stateno = 230|| stateno = 430)  && movecontact; && movecontact
ignorehitpause=1
;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59)<1
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = var(59)<1
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600 || stateno = 630)  && movecontact
;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = var(59)<1
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 610 || stateno = 640 ||stateno = 600 || stateno = 630)  && movecontact
;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59)<1
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600  && movecontact
;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = var(59)<1
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 630 || stateno = 600|| stateno = 610)  && movecontact
;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = var(59)<1
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 610 || stateno = 640 ||stateno = 600 || stateno = 630)  && movecontact
;----------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 1000
triggerall = numhelper(1000)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A
;-----------------------------------------------------------------------------
;------------------------------AI---------------------------------
[State -1, AI Teleport fwd1]
type = ChangeState
value = 1610
triggerall = statetype != A
triggerall = ctrl = 1
triggerall = var(59)>=1
trigger1 = p2bodydist x > 19 && p2bodydist x < 135 && random <= 60
;------------------------------AI---------------------------------
[State -1, AI Teleport fwd2]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = ctrl = 1
triggerall = var(59)>=1
trigger1 = p2bodydist x > 135 && random <= 60
trigger2 = p2bodydist x > 135 && random <=60
;------------------------------AI---------------------------------
[State -1, AI Teleport bak1]
type = ChangeState
value = 1630
triggerall = statetype != A
triggerall = ctrl = 1
triggerall = var(59)>=1
trigger1 = p2bodydist x <= 30 && p2movetype = A && random <=60;> 19 && p2bodydist x < 135 && random <= 80
;------------------------------AI---------------------------------
[State -1, AI Teleport bak2]
type = ChangeState
value = 1620
triggerall = statetype != A
triggerall = ctrl = 1
triggerall = var(59)>=1
trigger1 = p2bodydist x <= 30 && p2movetype = A && random <= 60;&& random <= 80> 19 && p2bodydist x < 135 && random <= 80
;----------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 1100
triggerall = numhelper(1000)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A

