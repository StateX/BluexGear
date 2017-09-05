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
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.


command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
;---------------------------------------------------------------------------------------------
[Command]
name = "undizzy"
command = ~B, F, B, F, B, F, B, F
time = 35

[Command]
name = "undizzy"
command = ~D, U, D, U, D, U, D, U
time = 35


[command]
name = "Limit"
command = D,D,s
time = 15

[command]
name = "Restriction"
command = D,DF,F,s
time = 15

[command]
name = "Limit1"
command = D,D,x+y
time = 15

[command]
name = "Unlimited"
command = a,y
time = 15

command.buffer.time = 1


[Command]
name = "Tag Counter"
command = ~B, DB, D, c+z
time = 20

[Command]
name = "Dual Hyper"
command = ~D, DF, F, c+z
time = 20

[Command]
name="bdx"
command= B,DB,D,x
time=20

[Command]
name = "guardpush"
command = a+c
time = 5




[command]
name = "Air Dash"
command = F,F
time = 15


;Super Jump
[Command]
name = "SJ"
command = $D, $U

[Command]
name = "Super_Jump"
command = ~D, U

[command]
name = "Taunt"
command = s
time = 15



;-| Super Motions |--------------------------------------------------------
[command]
name = "Blood Kain"
command = D,DF,F,a+b
time = 15

;-| Super Motions |--------------------------------------------------------
[command]
name = "Blood_Kain"
command = D,D,c
time = 15

[command]
name = "Carnage"
command = D,DF,F,x+y
time = 15

[command]
name = "Black Onslaught"
command = D,DF,F,y+z
time = 15
;-| Special Motions |------------------------------------------------------

[command]
name = "Gadget finger"
command = D,D,b
time = 15

[command]
name = "Death Spike"
command = D,DF,F,y
time = 15

[command]
name = "Gauntlet Hades"
command = D,DF,F,x
time = 15


[command]
name = "Hell's fang"
command = D,DF,F,b
time = 15

[command]
name = "Inferno Definer"
command = D,DF,F,c
time = 15

[command]
name = "counter"
command = F,D,DF,x
time = 15

[command]
name = "razor"
command = D,DF,F,b
time = 15

[command]
name = "scythe"
command = D,DB,B,b
time = 15

[command]
name = "EX slam slash"
command = D,DB,B,a
time = 15

[command]
name = "Gadget finger"
command = D,D,b
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
;--[ AI ]----------------------------------------------------------------------------
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
; -| CPU Commands |------

[Command]
name = "CPU1"
command = D, D, U, U, D, U
time = 1

[Command]
name = "CPU2"
command = D, U, U, D, D, U
time = 1

[Command]
name = "CPU3"
command = U, D, D, U, U, D
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

[State -1, Jump Cansel]
type = ChangeState
value = 40
triggerall = command = "holdup"
trigger1 = statetype = S && ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 610 && movecontact > 1
trigger4 = stateno = 600 && movecontact > 1
trigger5 = stateno = 620 && movecontact > 1
trigger6 = stateno = 630 && movecontact > 1
trigger7 = stateno = 640 && movecontact > 1
trigger8 = stateno = 650 && movecontact > 1
ignorehitpause = 1



[State -1, Second Jump]
type       = ChangeState
value      = 45
triggerall = var(30) <= 0
triggerall = command = "holdup"
trigger1 = stateno = 610 && movecontact > 1
trigger2 = stateno = 600 && movecontact > 1
trigger3 = stateno = 620 && movecontact > 1
trigger4 = stateno = 630 && movecontact > 1
trigger5 = stateno = 640 && movecontact > 1
trigger6 = stateno = 650 && movecontact > 1
trigger1   = statetype = A
trigger1   = ctrl

;�K�W�F�b�g
[State -1, ]
type = ChangeState
value = 1040
triggerall = command = "Gadget finger"
triggerall = statetype != A
trigger1 = (enemy,statetype = L) && ctrl
trigger2 = (enemy,movetype = H) && ctrl
trigger2 = (enemy,pos y < 0)
trigger2 = (enemy,vel y >= 0)
trigger3 = (enemy,movetype = H)
trigger3 = (enemy,stateno = [5100,5150])
trigger4 = (enemy,statetype = L)

;Limit1
[State -1, Limit1]
type = ChangeState
value = 30101
triggerall = command = "Restriction"
triggerall = power >= 3000
triggerall = !var(59) && !var(50)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(51) = 1


;Limit1
[State -1, Limit1]
type = ChangeState
value = 3600
triggerall = command = "Limit1"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,499]) && movecontact
triggerall = power >= 2000
triggerall = numhelper(26)

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 3600
triggerall = numhelper(26)
triggerall = power >= 2000
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A


;�K�W�F�b�g
[State -1, ]
type = ChangeState
value = 1040
triggerall = command = "Gadget finger"
triggerall = statetype != A
trigger1 = (enemy,statetype = L) && ctrl
trigger2 = (enemy,movetype = H) && ctrl
trigger2 = (enemy,pos y < 0)
trigger2 = (enemy,vel y >= 0)
trigger3 = (enemy,movetype = H)
trigger3 = (enemy,stateno = [5100,5150])
trigger4 = (enemy,statetype = L)

[State -1]
type = ChangeState
value = 2640
triggerall = command = "Limit"
triggerall = numhelper(26)=0
triggerall = statetype != A
triggerall = ctrl && pos y = 0
trigger1 = power >= 1000

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 2640
triggerall = numhelper(26)=0 && random <=100
triggerall = power >= 1000
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A

;Devoured By Darkness
[State -1, Devoured By Darkness]
type = ChangeState
value = 3600
triggerall = power >= 2000
triggerall = numhelper(26)
triggerall = command = "Limit1"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100


;Unlimited
[State -1, Unlimited]
type = ChangeState
value = 3500
triggerall = command = "Unlimited"
trigger1 = (statetype = s) && ctrl
triggerall = power >=2000
trigger2=(stateno=[200,499]) && movecontact



;EX slam slash
[State -1, EX slam slash]
type = ChangeState
value = 1060
triggerall = command = "EX slam slash"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,499]) && movecontact

; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 1060
triggerall = numhelper(1000)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A


;AI Throw A
[State -1, AI Throw A]
type = ChangeState
value = 800
triggerall = var(59) = 1
triggerall = statetype = S
triggerall = ctrl
triggerall = (abs(var(58)) != [800,899])|| (Random < 100)
triggerall = (var(58) != [200,499]) || (Random < 100)
triggerall = (var(58) != [1000,3999]) || (Random < 150)
trigger1 = p2bodydist X = [0,5]
trigger1 = random < 750
trigger1 = p2statetype != A
trigger1 = p2movetype != H

;---------------------------------------------------------------------------
;AI Air Throw
[State -1, AI Air Throw]
type = ChangeState
value = 840
triggerall = var(59) = 1
triggerall = statetype = A
triggerall = ctrl
trigger1 = p2bodydist X = [0,5]
trigger1 = p2statetype = A
trigger1 = p2movetype != H


;---------------------------------------------------------------------------
;Air Throw P

[State -1, Air Throw P]
type = ChangeState
value = 840
triggerall = (Command = "z") || (Command = "y")
triggerall = (P2StateType = A) && (StateType = A) && (Ctrl = 1) && (P2MoveType != H)
triggerall = (P2BodyDist X < 10) && (P2BodyDist Y = [-40,30])
trigger1 = (Command = "holdfwd") || (Command = "holdback")

;razor
[State -1, razor]
type = ChangeState
value = 10500
triggerall = command = "scythe"
trigger1 = (statetype = a) && ctrl
trigger2=(stateno=[600,650]) && movecontact

;razor
[State -1, razor]
type = ChangeState
value = 1050
triggerall = command = "scythe"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,299]) && movecontact
;razor
[State -1, razor]
type = ChangeState
value = 1501
triggerall = command = "razor"
trigger1 = (statetype = a) && ctrl
trigger2=(stateno=[600,650]) && movecontact

; Stand Light Punch
[State -1, AI AIR Hadouken]
type = ChangeState
value = 1501
triggerall= numhelper(1000)=0
triggerall = var(59)>=1
triggerall = statetype = A
triggerall = pos y <=-20
trigger1 = stateno = 610 && movehit && p2statetype !=A && random <=300
trigger2 = (p2bodydist x >= 180) && (random <=300) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype =A) && (p2movetype = A) && ctrl && (random <=300)




[State -1, Tag Counter]
type = ChangeState
value = 4800
triggerall = command = "Tag Counter"
triggerall = var(30) = 1
triggerall = var(20) = 0
triggerall = partner, life > 0
triggerall = power >= 1000
triggerall = StateType != A
triggerall = partner, stateno = 4512
trigger1 = stateno = [150, 152]
ignorehitpause = 1

[State -1, Dual Hyper Attack]
type = ChangeState
value = 4600
triggerall = command = "Dual Hyper"
triggerall = var(30) = 1
triggerall = partner, life > 0
triggerall = var(20) = 0
triggerall = power >= 2000
triggerall = StateType != A
triggerall = partner, stateno = 4512
trigger1 = ctrl
trigger2 = (stateno = [200, 299]) && MoveContact
trigger3 = (stateno = [400, 499]) && MoveContact

[State -1, Partner Assist]
type = ChangeState
value = 4700
triggerall = command = "y" && command = "b"
triggerall = var(30) = 1
triggerall = var(20) = 0
triggerall = partner, life > 0
triggerall = StateType != A
triggerall = partner, stateno = 4512
trigger1 = ctrl

[State -1, Partner Change]
type = ChangeState
value = 4510
triggerall = command = "c" && command = "z"
triggerall = var(30) = 1
triggerall = var(20) = 0
triggerall = partner, life > 0
triggerall = StateType != A
triggerall = partner, stateno = 4512
trigger1 = ctrl
trigger2 = var(20)
trigger2 = Life = 200





;===========================================================================
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
v = 59
value = 1


;====================================
;AI Standing Parry
[State -2]
type = HitOverride
triggerall = var(20) = 20
triggerall = statetype != A
triggerall = stateno != [40,50]
trigger1 = (ctrl||((stateno = [4000,701])&&time>5)) && random < 250
trigger2 = (stateno = [4000,701]) && time<=5
trigger3 = (stateno = [150,153]) && random < 250
slot = 0
attr = SA,NA,SA,HA
stateno = 4000
time = 1
;====================================
;AI Standing Parry
[State -2]
type = HitOverride
triggerall = var(20) = 20
triggerall = statetype != A
trigger1 = (ctrl||((stateno = [4000,701])&&time>5))&& random < 350
trigger2 = (stateno = [4000,701]) && time<=5
trigger3 = (stateno = [150,153])&& random < 350
slot = 1
attr = SA,NP,SP
stateno = 4000
time = 1
;====================================
;AI Crouching Parry
[State -2]
type = HitOverride
triggerall = var(20) = 20
triggerall = statetype != A
trigger1 = (ctrl||((stateno = [4000,701])&&time>5))&& random < 150
trigger2 = (stateno = [4000,701]) && time<=5
trigger3 = (stateno = [150,153])&& random < 150
slot = 2
attr = C, NA, SA, HA
stateno = 701
time = 1
;====================================
;AI Aerial Parry
[State -2]
type = HitOverride
triggerall = var(20) = 20
triggerall = statetype = A
trigger1 = (ctrl||stateno=4200&&time>5)&& random <= 300
trigger2 = (stateno = 4200) && time<=5
trigger3 = (stateno = [154,155])&& random <= 300
slot = 3
attr = SCA, AA
stateno = 4200
time = 1


; Run Fwd
[State -1, Air Dash]
type = ChangeState
value = 107
triggerall = var(59)<1
triggerall = stateno != [100,107]
trigger1 = command = "Air Dash"
trigger1 = statetype = A
trigger1 = ctrl

;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "Taunt"
trigger1 = (statetype = s) && ctrl


;---------------------------------------------------------------------------
;Recovery Roll Variable Set 2
[State -1,Recovery roll]
type = VarSet
trigger1 = Lose = 1
var(22) = 0

;Begin the Recovery Roll
[State -1,AI Recovery roll]
type = VarSet
triggerall = var(59)>=1 && random <=100
triggerall = roundstate = 2
triggerall = statetype !=  A
;triggerall = (Stateno != 5100) && (Stateno != 5110)
trigger1 = (HitFall)
var(22) = 1
;---------------------------------------------------------------------------
;Begin the Recovery Roll
[State -1,AI Recovery roll]
type = VarSet
triggerall = var(59)>=1 && random <=100
triggerall = roundstate = 2
triggerall = statetype !=  A
;triggerall = (Stateno != 5100) && (Stateno != 5110)
trigger1 = (HitFall)
var(22) = 2

;---------------------------------------------------------------------------
;Begin the Recovery Roll
[State -1,Recovery roll]
type = VarSet
triggerall = var(59)<1
triggerall = roundstate = 2
;triggerall = (Stateno != 5100) && (Stateno != 5110)
trigger1 = (HitFall) && (command = "FF")
var(22) = 1
;---------------------------------------------------------------------------
;Begin the Recovery Roll
[State -1,Recovery roll]
type = VarSet
triggerall = var(59)<1
triggerall = roundstate = 2
;triggerall = (Stateno != 5100) && (Stateno != 5110)
trigger1 = (HitFall) && (command = "BB")
var(22) = 2

;Black Onslaught
[State -1, Black Onslaught]
type = ChangeState
value = 3030
triggerall = command = "Black Onslaught"
trigger1 = (statetype = s) && ctrl
triggerall = power >=3000
trigger2=(stateno=[200,499]) && movecontact

;-------------------------------------------------------------------------------
;Blood Kain
[State -1, Blood Kain]
type = ChangeState
value = 30200
triggerall = power >= 1000
triggerall = numhelper(27) = 0
triggerall = command = "Blood_Kain"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 30200
triggerall = numhelper(27)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A

;-------------------------------------------------------------------------------
;Devoured By Darkness
[State -1, Devoured By Darkness]
type = ChangeState
value = 3020
triggerall = power >= 1000
triggerall = numhelper(27)
triggerall = command = "Blood Kain"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100

;-------------------------------------------------------------------------------
;Devoured By Darkness
[State -1, Devoured By Darkness]
type = ChangeState
value = 3020
triggerall = power >= 1000
triggerall = numhelper(26)
triggerall = command = "Blood Kain"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;-------------------------------------------------------------------------------
;Devoured By Darkness
[State -1, Devoured By Darkness]
type = ChangeState
value = 3020
triggerall = power >= 1000
triggerall = var(50) = 1
triggerall = command = "Blood Kain"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100

;Blood Kain
[State -1, Blood Kain]
type = ChangeState
value = 3020
triggerall = numhelper(27)
triggerall = var(50)
triggerall = command = "Blood Kain"
trigger1 = (statetype = s) && ctrl
triggerall = power >=1000
trigger2=(stateno=[200,499]) && movecontact

[State -1, AI Shun Goku Satsu]
type = ChangeState
value = 3020
triggerall = var(50)
triggerall = var(59)>0 && random <=400
triggerall = Statetype != A
triggerall = p2Statetype != A
triggerall = power >=1000
trigger1=stateno=210 && movehit
trigger2=stateno=400 && movehit
trigger3=stateno=430 && movehit
ignorehitpause = 1



[State -1, AI Shun Goku Satsu]
type = ChangeState
value = 3020
triggerall = numhelper(27)
triggerall = var(59)>0 && random <=400
triggerall = Statetype != A
triggerall = p2Statetype != A
triggerall = power >=1000
trigger1=stateno=210 && movehit
trigger2=stateno=400 && movehit
trigger3=stateno=430 && movehit
ignorehitpause = 1

[State -1, AI Shun Goku Satsu]
type = ChangeState
value = 3020
triggerall = numhelper(26)
triggerall = var(59)>0 && random <=400
triggerall = Statetype != A
triggerall = p2Statetype != A
triggerall = power >=1000
trigger1=stateno=210 && movehit
trigger2=stateno=400 && movehit
trigger3=stateno=430 && movehit
ignorehitpause = 1

;Carnage
[State -1, Carnage]
type = ChangeState
value = 3000
triggerall = command = "Carnage"
trigger1 = (statetype = s) && ctrl
triggerall = power >=1000
trigger2=(stateno=[200,499]) && movecontact

;Hell Fang 2
[State -1, Hell Fang 2]
type = ChangeState
value = 1033
triggerall = command = "Inferno Definer"
trigger1 = (statetype = a) && ctrl
trigger2=(stateno=[600,650]) && movecontact

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1033 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
trigger1 = movehit = 1
value = 1035

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1035 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
value = 1036

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1035&& (command = "c" || command = "hold_c")
trigger1 = movecontact || time = [30,50]
value = 1037

; Stand Light Punch
[State -1, AI AIR Hadouken]
type = ChangeState
value = 1033
triggerall = numhelper(1000)=0
triggerall = var(59)>=1
triggerall = statetype = A
triggerall = pos y <=-20
trigger1 = stateno = 610 && movehit && p2statetype !=A && random <=300
trigger2 = (p2bodydist x >= 180) && (random <=300) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype =A) && (p2movetype = A) && ctrl && (random <=300)

;Hell Fang 2
[State -1, Hell Fang 2]
type = ChangeState
value = 1030
triggerall = command = "Inferno Definer"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1031 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
trigger1 = movehit = 1
value = 1035

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1035 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
value = 1036

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1035&& (command = "c" || command = "hold_c")
trigger1 = movecontact || time = [30,50]
value = 1037


; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 1030
triggerall = numhelper(1000)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A



[State -1, AI Shun Goku Satsu]
type = ChangeState
value = 3030
triggerall = var(59)>0 && random <=400
triggerall = Statetype != A
triggerall = p2Statetype != A
triggerall = power >=3000
trigger1=stateno=210 && movehit
trigger2=stateno=400 && movehit
trigger3=stateno=430 && movehit
ignorehitpause = 1




[State -1, AI Shun Goku Satsu]
type = ChangeState
value = 3000
triggerall = var(59)>0 && random <=400
triggerall = Statetype != A
triggerall = p2Statetype != A
triggerall = power >=1000
trigger1=stateno=210 && movehit
trigger2=stateno=400 && movehit
trigger3=stateno=430 && movehit
ignorehitpause = 1

;Hell's fang
[State -1, Hell's fang]
type = ChangeState
value = 1020
triggerall = command = "Hell's fang"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1020 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
value = 1021



; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 1020
triggerall = numhelper(1000)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A

;Death Spike
[State -1, Death Spike]
type = ChangeState
value = 1000
triggerall = command = "Death Spike"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1000 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
value = 1021



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

;Gauntlet Hades
[State -1, Gauntlet Hades]
type = ChangeState
value = 1010
triggerall = command = "Gauntlet Hades"
trigger1 = (statetype = s) && ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1,SLASH COMBO 2]
type = Changestate
triggerall = roundstate = 2 && alive
triggerall = stateno = 1010 && (command = "b" || command = "hold_b")
trigger1 = movecontact || time = [30,50]
value = 1011

; Stand Light Punch
[State -1, AI Hadouken]
type = ChangeState
value = 1010
triggerall = numhelper(1000)=0 && random <=100
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 210 && movehit && p2statetype !=A
trigger2 = (p2bodydist x >= 100) && (random <=100) && ctrl
trigger3 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
trigger4 = stateno = 400 && movehit && p2statetype !=A



;===========================================================================
;===========================================================================
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




;---------------------------------------------------------------------------
;--|-AI Defense-|-----------------------------------------------------------
[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 250) && (random <= 799)
value = 130

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 250) && (random <= 799)
value = 131

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 250) && (random <= 799)
value = 132

;-|-AI Combo Attempt-|----------------------------------------------
[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 20) && (random <= 750)
value = 200

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 20) && (random <= 750)
value = 210

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 220

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 7) && (random <= 750)
value = 230

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 231

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 240

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 250

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 400

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 410


[State -1] ;Superjump from launcher
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
trigger1 = (stateno = 420) && (movehit = 1); && (random <= 750)
value = 7000

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 430

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 440

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 450

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 600

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 610

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 620

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 630

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 640

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 750)
value = 650

[State -1];Followup jump attack with crouch hard kick
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = H) ;opponent has been hit
trigger1 = (p2bodydist X <= 25) ;close to opponent
trigger1 = Prevstateno = 1400 ;falling from attack (which means the previous hit must have been an air attack)
trigger1 = (random <= 750) ;This will happen 75% of the time that the other triggers are true
value = 450

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

;SuperJump
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = command = "Super_Jump"
trigger1 = (statetype = s) && ctrl
triggerall = Command = "holdup"
triggerall = var(59)<1
trigger2 = stateno = 250 && movehit
;---------------------------------------------------------------------------
[State -1, AI Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)>=1
trigger1 = stateno = 420 && movehit && movecontact
;---------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)<1
triggerall = Command = "holdup"
trigger1 = stateno = 420 && movehit
;---------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)<1
triggerall = Command = "holdup"
trigger1 = stateno = 420 && movehit
;-----------------------------------------------------------------
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
triggerall = var(59)>=1  ;&& random <=500
triggerall = statetype != A
trigger1 = stateno = 400 && movehit && p2statetype !=A
;trigger2 = ctrl && p2statetype !=A  && random <=50 && p2bodydist x >=90
;---------------------------------------------------------------------------
[State -1, AI Super Jump]
type = ChangeState
value = 7000
triggerall = var(59)>=1
trigger1 = stateno = 420 && movehit && movecontact
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59)>0
trigger1 = statetype = A
trigger1 = stateno = 90 ;&& time > 4
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
[State -1, AI Grab]
type = ChangeState
value = 800;ifelse(random <= 500,800,830)
triggerall = var(59)>=1
triggerall = P2statetype = C
triggerall = statetype != A
triggerall = p2stateno = [120,162]
;triggerall = stateno != [902,904]
trigger1 = p2bodydist x <= 30; p2 is close enough for stand light punch
trigger1 = p2bodydist y = [-5,10]
trigger1 = ctrl  ;&& random <=500
;trigger2 = ctrl
;trigger2 = p2bodydist x = [-22,13]
;trigger2 = p2bodydist y = [-14,-10]
;----------------------------------------------------------
;-----------------------------------------------------------------------------
; Stand Light Punch
[State -1, AI Crouch hk]
type = ChangeState
value = 450
triggerall = var(59)>=1  ;&& random <=500
triggerall = statetype != A
trigger1 = (stateno = 430) && movehit
;trigger2 = (p2bodydist x = [31,179]) && (p2statetype !=A) && (p2movetype = A) && ctrl && (random <=200) && ctrl
;------------------------------AI---------------------------------

;---------------------------------------------------------------------------
; Run Fwd
[State -1, AI Run Fwd]
type = ChangeState
value = 100
triggerall = var(59)>=1
triggerall = stateno !=[100,106]
triggerall = prevstateno !=[100,106]
trigger1 = statetype != A
trigger1 = p2movetype != A
trigger1 = ctrl
trigger1 = (p2bodydist x >= 180) && (random <=250)
;---------------------------------------------------------------------------
; Run Fwd
[State -1, AI Run Back]
type = ChangeState
value = 105
triggerall = var(59)>=1
triggerall = stateno !=[100,106]
triggerall = prevstateno !=[100,106]
trigger1 = p2movetype != A
trigger1 = statetype != A
trigger1 = stateno = 1000 && p2movetype = H && animtime = 0 && random <=200


[State -1, AI Grab]
type = ChangeState
value = 800;ifelse(random <= 500,800,830)
triggerall = var(59)>=1
triggerall = P2statetype = C
triggerall = statetype != A
triggerall = p2stateno = [120,162]
;triggerall = stateno != [902,904]
trigger1 = p2bodydist x <= 30; p2 is close enough for stand light punch
trigger1 = p2bodydist y = [-5,10]
trigger1 = ctrl  ;&& random <=500
;trigger2 = ctrl
;trigger2 = p2bodydist x = [-22,13]
;trigger2 = p2bodydist y = [-14,-10]

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
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
value = 215
triggerall = var(59)<1
triggerall = command = "holdfwd" && command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch+F]
type = ChangeState
value = 245
triggerall = var(59)<1
triggerall = command = "holdfwd" && command = "b"
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
triggerall = var(59)>=1  ;&& random <=500
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
; Run Fwd
[State -1, AI Run Fwd]
type = ChangeState
value = 100
triggerall = var(59)>=1
triggerall = stateno !=[100,106]
triggerall = prevstateno !=[100,106]
trigger1 = statetype != A
trigger1 = p2movetype != A
trigger1 = ctrl
trigger1 = (p2bodydist x >= 180) && (random <=250)
;---------------------------------------------------------------------------
; Run Fwd
[State -1, AI Run Back]
type = ChangeState
value = 105
triggerall = var(59)>=1
triggerall = stateno !=[100,106]
triggerall = prevstateno !=[100,106]
trigger1 = p2movetype != A
trigger1 = statetype != A
trigger1 = stateno = 1000 && p2movetype = H && animtime = 0 && random <=200
;----------------------------------------------------------------------------
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
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[State -1,AI  Guard Push stand]
type = ChangeState
value = 160
triggerall = var(59)>=1
triggerall = statetype = S
triggerall = p2bodydist x =[0,40]
trigger1 = stateno = [150,153]

[State -1,AI  Guard Push crouch]
type = ChangeState
value = 161
triggerall = var(59)>=1
triggerall = statetype = C
triggerall = p2bodydist x =[0,40]
trigger1 = stateno = [150,153]

[State -1,AI  Guard Push aerial]
type = ChangeState
value = 162
triggerall = var(59)>=1
triggerall = statetype = A
triggerall = p2bodydist x =[0,40]
trigger1 = stateno = [154,155]

[State -1, Guard Push stand]
type = ChangeState
value = 160
triggerall = var(59)<1
triggerall = command = "guardpush" && statetype = S
trigger1 = stateno = [150,153]

[State -1, Guard Push crouch]
type = ChangeState
value = 161
triggerall = var(59)<1
triggerall = command = "guardpush" && statetype = C
trigger1 = stateno = [150,153]

[State -1, Guard Push aerial]
type = ChangeState
value = 162
triggerall = var(59)<1
triggerall = command = "guardpush" && statetype = A
trigger1 = stateno = [154,155]

;===========================================================================
[State -1, AI Zero counter]
type=changestate
value=750
triggerall = var(59)>=1 && random <= 100;&& command="bdx"
triggerall=p2dist x>0&&power>=1000&&statetype!=A
trigger1=stateno=150||stateno=152
;------------------------------AI---------------------------------
;===========================================================================
[State -1, AI Zero counter]
type=changestate
value=750
triggerall = var(59)>=1 ;&&roundstate=2;&& command="bdx"
triggerall=p2dist x>0&&power>=1000&&statetype!=A && random <=80
trigger1=stateno=150||stateno=152
trigger1=p2statetype !=A
trigger1=p2bodydist x <=20
;------------------------------AI---------------------------------
;===========================================================================
[State -1, Zero counter]
type=changestate
value=750
triggerall=var(59)<=0&&roundstate=2&& command="bdx"
triggerall=p2dist x>0&&power>=1000&&statetype!=A
trigger1=stateno=150||stateno=152
;---------------------------------------------------------------------------
