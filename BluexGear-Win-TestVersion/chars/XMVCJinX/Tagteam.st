;***********************************************************************;
;************************* TAG System V. 2.0 ***************************;
;***********************************************************************;

; ----------------------------------------------------------------------;
; CREDITS:
; Main tag code implementation and depelovement:
; - R.o.q.u.e.
; Slightly modified by:
; - AeroGP
; PLEASE GIVE CREDIT IF MODIFYING THIS!!!
; ----------------------------------------------------------------------;

;***********************************************************************;
;***********************************************************************;

;------------------------------------------------------------------------
;TagIn
;------------------------------------------------------------------------
;Changes the state number of the player, and that of the player's partner.
;
;Required arguments:
;  stateno = state_no (int)
;    state_no is the number of the state to change to.
;  partnerstateno = state_no (int)
;    state_no is the number of the state to change the partner to.
;  ctrl = ctrl_flag (int)
;    Set to nonzero to have control, or 0 to disable control.
;
;Optional arguments:
;  none
;
;Example:
;  none
;
;Notes:
;  Crashes if triggered without a partner being present.
;
;------------------------------------------------------------------------
;TagIn Implementation
;------------------------------------------------------------------------
; - Number of vars used: 1
; - Assigned var: var(30)
; - Values:
;   *var(30) = 0 --- Tag Disabled
;   *var(30) = 1 --- Tag Enabled
;   *var(30) = 2 --- Dual Hyper Combo performed
;   *var(30) = 3 --- Assist attack performed (alpha assist)
;   *var(30) = 4 --- Assist attack performed (beta assist)
;   *var(30) = 5 --- Assist attack performed (gamma assist)

;***********************************************************************;
;***********************************************************************;

;                   ********************************
;                   *********  TAG states  *********
;                   ********************************

;***********************************************************************;
;***********************************************************************;

; Entering the screen
;--------------------

[Statedef 4500]
type = A
movetype = I
physics = N
anim = 42	; <- Jumping In (Hey, I'm gonna kick your ass!!!!)
sprpriority = 2
ctrl = 0

; Starting position
[State 4500, 1]
type = PosSet
trigger1 = time = 0
x = -243*(facing)
y = -100

; Attack velocity
[State 4500, 2]
type = VelSet
trigger1 = Time = 0
x = 18
y = 5

[State 4500, 3a] ; the character cannot be hit until he has fully entered on the stage
type = NotHitBy
trigger1 = BackEdgeBodyDist <= 0
value = SCA
time = 2

[State 4500, 3b] ; if partner was KOed, appear being invincible
type = NotHitBy
trigger1 = Partner, Life <= 0
value = SCA
time = 6

[State 4500, 4] ; Prevents the camera from following the char
type = ScreenBound
trigger1 = 1
value = 0

[State 4500, 5a] ; the character attacks his opponent when :
type = ChangeState
triggerall = BackEdgeBodyDist >= 0	; he is on the stage
trigger1 = partner, life > 0		; and his partner is alive
;trigger1 = P2BodyDist X = [0, 100]     ; and his enemy is a bit close
trigger1 = !Win && !Lose
value = 4501

[State 4500, 6]
type = VelSet
triggerall = BackEdgeBodyDist >= 0
trigger1 = FrontEdgeBodyDist <= 0	; he has reached the other side of the screen
trigger2 = partner, life <= 0		; his partner has just died
trigger2 = (Time >= 50) || (P2BodyDist X = [-100, 100])
trigger3 = P2Dist X < 0                 ; his enemy is behind him
trigger4 = P2BodyDist X = [-100, 100]
trigger4 = Win
trigger5 = Win
trigger5 = Time >= 20
trigger6 = Pos Y >= 0                   ; he has landed
trigger6 = Vel Y >= 0
x = 0
y = 0

[State 4500, 7] ; the character does not attack his opponent if:
type = ChangeState
triggerall = BackEdgeBodyDist >= 0
trigger1 = FrontEdgeBodyDist <= 0	; he has reached the other side of the screen
trigger2 = Partner, Life <= 0           ; his partner has just died
trigger2 = (Time >= 50) || (P2BodyDist X = [-100, 100])
trigger3 = P2Dist X < 0                 ; his enemy is behind him
trigger4 = P2BodyDist X = [-100, 100]
trigger4 = Win
trigger5 = Win
trigger5 = Time >= 20
trigger6 = Pos Y >= 0                   ; he has landed
trigger6 = Vel Y >= 0
value = 52
ctrl = 1


; Tag attack (when partner is tagged in)
;---------------------------------------
[Statedef 4501]
type = A
movetype = A
physics = N
sprpriority = 2
ctrl = 0

; Tag in attack (basicaly a flying kick)
[State 4501, 1a]
type = ChangeAnim
triggerall = SelfAnimExist(4501)  ; <--- check if this anim exists
trigger1 = time = 0
value = 4501                      ; <--- then change into it!

; Alternate tag in attack
[State 4501, 1b]
type = ChangeAnim
triggerall = !SelfAnimExist(4501) ; <--- if this anim DOESN'T exist
trigger1 = SelfAnimExist(650)     ; <--- check if this anim exists
trigger1 = time = 0
value = 650                      ; <--- then change into it!

; This can be customized if you need
; different behaviors, alternate sounds,
; etc. ---------------------------------
[State 4501, 2]
type = HitDef
trigger1 = time = 0
attr = A, NA
hitflag = MAF
guardflag = MA
animtype = Up
priority = 4, Hit
damage = 30, 0
pausetime = 12, 12
sparkno = s8003
guard.sparkno = s8004
hitsound = s20,2
guardsound = s20,6
ground.type = High
ground.hittime = 15
air.hittime = 20
ground.velocity = 0, -14
air.velocity = 0, -10
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0


; This MUSN'T be changed unless you change it into a ground attack
[State 4501, 3]
type = PosSet
trigger1 = Pos Y >= 0
y = 0

; Finally, make a taunt when succesfull (or not XD)
[State 4501, 4]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y >= 0
value = ifelse(SelfAnimExist(196), 4502, 195) ; <--- Add your personal taunt here...
ctrl = 1

; Custom Tag in Taunt
[Statedef 4502]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0, 0
sprpriority = 2

; Tag in taunt
[State 4502, 1]
type = ChangeAnim
triggerall = SelfAnimExist(195)  ; <--- Tag in taunt anim
trigger1 = time = 0
value = 195                      ; <--- ...

; This can be customized depending on the char
; --------------------------------------------
[State 191, 2]
type = Playsnd
trigger1 = AnimElem = 5
persistent = 0
value = 0,0

[State 191, 3]
type = Playsnd
trigger1 = time = 14
persistent = 0
value = 1,0

[State 191, 4]
type = EnvShake
Trigger1 = AnimElem = 5,-1
persistent = 0
time = 20
ampl = -5
freq = 100
phase = 10

[State 4502, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Leaving Taunt
;--------------
[Statedef 4510] ; Define your own taunt here
type = S
movetype = I
physics = S
sprpriority = -2
velset = 0,0
ctrl = 0

; leaving taunt
[State 4510, 1a]
type = ChangeAnim
triggerall = SelfAnimExist(4510)  ; <--- check if this anim exists
trigger1 = time = 0
value = 4510                      ; <--- then change into it!

; leaving taunt (alt)
[State 4510, 1b]
type = ChangeAnim
triggerall = !SelfAnimExist(4510)  ; <--- this anim doesn't exist...
triggerall = SelfAnimExist(195)    ; <--- so check if this one exists
trigger1 = time = 0
value = 195                        ; <--- and change into it!

; Customize this according to the
; animation used ----------------
[State 191, 2]
type = Playsnd
trigger1 = AnimElem = 5
persistent = 0
value = 0,0

[State 191, 3]
type = Playsnd
trigger1 = time = 14
persistent = 0
value = 1,0

[State 191, 4]
type = EnvShake
Trigger1 = AnimElem = 5,-1
persistent = 0
time = 20
ampl = -5
freq = 100
phase = 10

[State 4510, 2] ; the character cannot be hit since he is leaving
type = NotHitBy
trigger1 = 1
value = SCA

[State 4510, 3] ; Prevents the camera from following the char
type = PlayerPush
trigger1 = 1
value = 0

[State 4510, 4]
type = ChangeState
trigger1 = animtime = 0
value = 4511

; Leave the stage
;----------------
[Statedef 4511]
type = S
movetype = I
physics = N
anim = 40	; <- Jump Start (see you later!!!!)
sprpriority = 2
ctrl = 0

; NEW !! Tag active definer
[State 4511, 1]
type = VarSet
trigger1 = time = [0,1]
var(30) = 1

[State 4511, 2] ; Jump Backwards
type = ChangeAnim
trigger1 = AnimTime = 0
value = 43

[State 4511, 3] ; StateTypeSet changes to aerial while jumping
type = StateTypeSet
trigger1 = Pos Y < 0
statetype = A

[State 4511, 4]
type = VelSet
trigger1 = Anim = 43
x = -12
y = -4

[State 4511, 5] ; Cannot be hurt if leaving
type = NotHitBy
trigger1 = 1
value = SCA

[State 4511, 6] ; Ghost
type = PlayerPush
trigger1 = 1
value = 0

[State 4511, 7] ; Camera shouldn't follow him
type = ScreenBound
trigger1 = 1
value = 0

[State 4500, 8]
type = VelSet
trigger1 = BackEdgeBodyDist < -30
x = 0
y = 0

[State 4511, 9]
type = ChangeState
trigger1 = BackEdgeDist < -30
trigger2 = Time >= 30
value = 4512

; Standby (offscreen)
;-----------------------
[Statedef 4512]
type = A
movetype = I
physics = N
anim = 0
velset = 0,0
ctrl = 0

[State 4512, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 4512, 2]
type = PlayerPush
trigger1 = 1
value = 0

[State 4512, 3] ; Prevents the camera from following the char
type = ScreenBound
trigger1 = 1
value = 0

[State 4512, 4] ; Gains life (optional)
type = LifeAdd
trigger1 = (gametime%10) = 0
value = 5

[State 4512, 5] ; always face the same direction as partner
type = turn
trigger1 = facing != partner,facing

[State 4512, 6] ; always stay behind and at the same distance of the char on the stage
type = posset
trigger1 = 1
x = (partner, pos x) - 1000*facing
y = -150

[State 4512, 7] ; prevent bugs when you win or lose by time over
type = ChangeState
triggerall = Alive
trigger1 = RoundState = 3
trigger1 = time >= 20
value = 4520



































;---------------------------------------------------------------------------
; Jumping in (when partner is KOed)
[Statedef 4520]
type = S
movetype = I
physics = N
anim = 42
sprpriority = 2
ctrl = 0

[State 4520, 0]
type = PosSet
trigger1 = time = 0;AnimElem = 2, < 0
x = -243*(facing)
y = -80;0

[State 4520, 1]
type = VelSet
trigger1 = time = 4;AnimElem = 2, = 0
x = 12;4
y = 5; -8.75

[State 4520, 2]
type = NotHitBy
trigger1 = 1
value = SCA
time = 6

[State 4520, 3]
type = ScreenBound
trigger1 = 1
value = 0

;[State 4520, 8]
;type = Gravity
;trigger1 = time >= 4

[State 4520, 9]
type = VelSet
trigger1 = Vel Y >= 0
trigger1 = Pos Y >= 0
;trigger1 = AnimElem = 2, >= 0
x = 0
y = 0

[State 4520, 10]
type = ChangeState
trigger1 = Vel Y >= 0
trigger1 = Pos Y >= 0
;trigger1 = AnimElem = 2, >= 0
value = 4521

;---------------------------------------------------------------------------
; Landing
[Statedef 4521]
type = S
movetype = I
physics = N
anim = 47
sprpriority = 2
ctrl = 0

[State 4520, 0]
type = PosSet
trigger1 = Time = 0
y = 0

[State 4520, 5]
type = NotHitBy
trigger1 = 1
value = SCA
time = 6

[State 4520, 10]
type = ChangeState
trigger1 = AnimTime >= 0
value = 0
ctrl = 1

; Leaving Taunt (for assist attacks)
;--------------
[Statedef 4530]
type = S
movetype = I
physics = S
anim = 195
sprpriority = -2
velset = 0,0
ctrl = 0


[State 191, 3]
type = Playsnd
trigger1 = time = 14
persistent = 0
value = 140,22


[State 4510, 1] ; Prevents the camera from following the char
type = PlayerPush
trigger1 = 1
value = 0

[State 4510, 2]
type = ChangeState
trigger1 = animtime = 0
value = 4511 ; Return to your place man!!!!


; =======================================================================
; Dual Hyper Attacks section
; If you have played MvC or MvC2, you should know how this works.
; Basically, you perform a Hyper Move, then your partner jumps and do
; the same, resulting on a Dual Attack. By now is intended to look
; like it is in MvC2.
; This section is customizable, so change it according to your needs.
; =======================================================================

; Standby onscreen for Dual Hyper Attack
;---------------------------------------
[Statedef 4600]
type = S
movetype = I
physics = S
sprpriority = -2
velset = 0,0
ctrl = 0

; NEW !! Tag active definer
[State 4600, 1]
type = VarSet
trigger1 = time = [0,1]
var(30) = 2

; --------------------------------------------------------------------
; This part is customizable, you can add what you need to be done here

[State 4600, 2] ; TEAM ATTACK :
type = ChangeAnim
trigger1 = time = 0
trigger1 = selfanimexist(3100)	  ; <--- find first Hyper type...
value = 3100			  ; <--- do hyper move!

; ---------------------------------------------------------------------

[State 4600, 4] ; the character cannot be hit since he is leaving
type = NotHitBy
trigger1 = 1
value = SCA




[State 1150, EnvColor]
type = EnvColor
trigger1 = time = 0
value = 0,0,0
time = 40
under = 1

[State 1531, 5]
type = PlaySnd
trigger1 = time = 0
value = s22,1

[State 4600, 5] ; Prevents the camera from following the char
type = PlayerPush
trigger1 = 1
value = 0

[State 4600, 6] ; Do the dual attack when partner reaches the floor
type = ChangeState
trigger1 = time = 40
value = 4612

; Landing on screen first (partner attack)
;-----------------------------------------
[Statedef 4601]
type = A
movetype = I
physics = N
anim = 42  ; <- Jumping In (Hey, I'm gonna kick your ass!!!!)
sprpriority = 2
ctrl = 0

[State 4601, 1] ; Prevents the camera from following the char
type = ScreenBound
trigger1 = 1
value = 0

; Starting position
[State 4601, 2]
type = PosSet
trigger1 = time = 0
x = (partner, pos x) - (200*(facing)) ; variable pos
y = -100

; Attack velocity
[State 4601, 3]
type = VelSet
trigger1 = Time = 0
x = 28
y = 14

[State 4601, 4]
type = PosSet
trigger1 = Pos Y >= 0
y = 0


[State 4601, 5]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y >= 0
value = 4602
ctrl = 0

; Dual Hyper Attack!!! (partner[Messatsu Gou Hadou && Messatsu Gou Shoryuu])
; ------------------------------
[Statedef 4602]
type = S
movetype = A
physics = S
sprpriority = 2
velset = 0, 0
ctrl = 0
poweradd = -1000



[State 4602, 1] ; HYPER ATTACK :
type = ChangeAnim
trigger1 = time = 0
trigger1 = selfanimexist(3100*(var(31)=0)) ; <--- custom Hyper Anim type...
value = 3100*(var(31)=0)   		      ; <--- do hyper anim!

[State 0, EnvColor]
type = EnvColor
trigger1 = time = 0
value = 0,0,0
time = 50
under = 1

[State 1531, 5]
type = PlaySnd
trigger1 = time = 0
value = s22,3



[State 4612,2]
type = ChangeState
triggerall = var(31)= 0
trigger1 = time = 50
value = 4603
ctrl = 0

; --------------------------------------------------------------------
; This part is customizable, you can add what you need to be done here
; Messatsu Gou Hadou

[Statedef 4603]
type = S
movetype = A
physics = S
sprpriority = 2
velset = 0, 0
ctrl = 0
poweradd = 0
anim = 3100

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S140,14
volume = 255
channel = -1



[State 3100, Super Charge Explod]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 8200
postype = Front
facing = ifelse(Facing = 1,1,-1)
pos = ifelse(Facing = 1,-126,126),222
ownpal = 1
sprpriority = 5
supermovetime = 58


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,14
volume = 0
channel = -1

[State 0, Explod]
type = Explod
trigger1 = animelem = 16
anim = 7023
ID = 7023
pos = 10,-0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 23
supermove
pausemove
scale = 0.7,0.7
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =




[State 3000, AssertSpecial]
type = AssertSpecial
trigger1 = (AnimElemTime(2) >= 0) && (AnimElemTime(26) < 0)
flag = NoBarDisplay


[State 3000, AfterImage]
type = AfterImage
trigger1 = AnimElemTime(26) = 0
time = 41
length = 12
framegap = 5
palcolor = 0
palcontrast = 200,255,255
palpostbright = 100,100,200
palmul = 0.7,0.7,1
trans = add1



[State 3100, 1]
type = AssertSpecial
trigger1 = 1
flag= noBG
flag2= nobardisplay

[State 0, 1]
type = Projectile
trigger1 = AnimElem = 17
projanim = 1091
projhitanim = 1095
guard.sparkno = S910
projpriority = 1
projheightbound = -240, 100
projedgebound = 100
projscreenbound = 100
projshadow = -1
offset = 47,-0
velocity = 15,0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFDP
pausetime = 7,20
hitsound   = S20,1
sparkxy = 500,500
guardsound = S100,29
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
air.fall = 1
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
palfx.time = 50
palfx.add = 5,0,72;72,-19,-204
palfx.mul = 338,389,256
;palfx.sinadd = 61,20,10,15
palfx.invertall = 1
palfx.color = 15

[State 1320, Fire Explod 1]
type = Explod
trigger1 = projhit = 1
anim = 31016
ID = 31016
postype = P2
pos = 0,0
ownpal = 1
bindtime = -1
ignorehitpause = 1
sprpriority = -1
removetime = 40
ontop = 1
scale = .3,.3

[State 1320, Fire Explod 1]
type = Explod
trigger1 = projhit = 1
anim = 31017
ID = 31017
postype = P2
pos = 0,0
ownpal = 1
bindtime = -1
ignorehitpause = 1
sprpriority = -1
removetime = 40
scale = .3,.3

;------------------------------------------------------------------------
; Hyper BG effects (Dual Hyper Combo Mode)
; Thanks to _nabeshin_ for the Hyper BG Sprites.
[State 3001]
type = Helper
trigger1 = Time = 0
stateno = 33122
ownpal = 1



[State 1000, 8]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------


; Dual Hyper Attack!!! (You [Messatsu Gou Hadou])
; ------------------------------
[Statedef 4612]
type = S
movetype = A
physics = S
sprpriority = 2
velset = 0, 0
ctrl = 0
poweradd = -1000

[State 4612, 1] ; HYPER ATTACK :
type = ChangeAnim
trigger1 = time = 0
trigger1 = selfanimexist(3100)	  ; <--- find first Hyper Anim type...
value = 3100				  ; <--- do hyper anim!

; --------------------------------------------------------------------
; This part is customizable, you can add what you need to be done here

; -----------------------
[State 1000, 2]
type = PlaySnd
trigger1 = AnimElem = 4,-2
value = 1,0

[State 1000, 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 30,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S140,14
volume = 255
channel = -1



[State 3100, Super Charge Explod]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 8200
postype = Front
facing = ifelse(Facing = 1,1,-1)
pos = ifelse(Facing = 1,-126,126),222
ownpal = 1
sprpriority = 5
supermovetime = 58


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,14
volume = 0
channel = -1

[State 0, Explod]
type = Explod
trigger1 = animelem = 16
anim = 7023
ID = 7023
pos = 10,-0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 23
supermove
pausemove
scale = 0.7,0.7
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =



[State 3000, AssertSpecial]
type = AssertSpecial
trigger1 = (AnimElemTime(2) >= 0) && (AnimElemTime(26) < 0)
flag = NoBarDisplay

[State 3000, Explod];dust
type = Explod
trigger1 = AnimElemTime(1) = 1
anim = 8205
id = 8205
postype = P1
pos = 8,-8
sprpriority = 3
ownpal = 1
supermovetime = 58

[State 0, Explod]
type = Explod
trigger1 = animelem = 18
anim = 8000
ID = 8000
pos = 0,-30
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 18
supermove
pausemove
scale = 0.4,0.4
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 3000, AfterImage]
type = AfterImage
trigger1 = AnimElemTime(26) = 0
time = 41
length = 12
framegap = 5
palcolor = 0
palcontrast = 200,255,255
palpostbright = 100,100,200
palmul = 0.7,0.7,1
trans = add1



[State 3100, 1]
type = AssertSpecial
trigger1 = 1
flag= noBG
flag2= nobardisplay

[State 0, 1]
type = Projectile
trigger1 = AnimElem = 17
projanim = 1091
projhitanim = 1095
guard.sparkno = S910
projpriority = 1
projheightbound = -240, 100
projedgebound = 100
projscreenbound = 100
projshadow = -1
offset = 47,-0
velocity = 15,0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFDP
pausetime = 7,20
hitsound   = S20,1
sparkxy = 500,500
guardsound = S100,29
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
air.fall = 1
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
palfx.time = 50
palfx.add = 5,0,72;72,-19,-204
palfx.mul = 338,389,256
;palfx.sinadd = 61,20,10,15
palfx.invertall = 1
palfx.color = 15

[State 1320, Fire Explod 1]
type = Explod
trigger1 = projhit = 1
anim = 31016
ID = 31016
postype = P2
pos = 0,0
ownpal = 1
bindtime = -1
ignorehitpause = 1
sprpriority = -1
removetime = 40
ontop = 1
scale = .3,.3

[State 1320, Fire Explod 1]
type = Explod
trigger1 = projhit = 1
anim = 31017
ID = 31017
postype = P2
pos = 0,0
ownpal = 1
bindtime = -1
ignorehitpause = 1
sprpriority = -1
removetime = 40
scale = .3,.3

[State 1000, 8]
type = ChangeState
trigger1 = animtime = 0
value = 4614
ctrl = 0

; Leaving Taunt (for assist attacks)
;--------------
[Statedef 4614]
type = S
movetype = I
physics = S
anim = 195
sprpriority = -2
velset = 0,0
ctrl = 0
poweradd = 200

[State 191, 2]
type = Playsnd
trigger1 = AnimElem = 5
persistent = 0
value = 0,0

[State 191, 3]
type = Playsnd
trigger1 = time = 14
persistent = 0
value = 1,0

[State 191, 4]
type = EnvShake
Trigger1 = AnimElem = 5,-1
persistent = 0
time = 20
ampl = -5
freq = 100
phase = 10

[State 4510, 1] ; Prevents the camera from following the char
type = PlayerPush
trigger1 = 1
value = 0

[State 4510, 2]
type = ChangeState
trigger1 = animtime = 0
value = 4511 ; Return to your place man!!!!

;---------------------------------------------------------------------------
;Messatsu Gou Shoryuu(1st Shoryuu,Begin)
[Statedef 4671]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 0
ctrl = 0
anim = 3100
velset = 12,0,0

[State 30071, AssertSpecial]
type = AssertSpecial
trigger1 = (AnimElemTime(2) >= 0) && (AnimElemTime(26) < 0)
flag = NoBarDisplay

[State 30071, Super Background Top]
type = Explod
trigger1 = (RoundState = 3) && (NumExplod(8210) < 1) && (P2Life <= 0) && (Alive = 1) && (MoveHit = 1)
ID = 8210
anim = 8210
postype = Back
pos = 160,120
sprpriority = -5
ownpal = 1
ignorehitpause = 1
bindtime = -1
removetime = -1

[State 30071, Super Background Bottom]
type = Explod
trigger1 = (RoundState = 3) && (NumExplod(8211) < 1) && (P2Life <= 0) && (Alive = 1) && (MoveHit = 1)
ID = 8211
anim = 8210
postype = Back
pos = 160,119
vfacing = -1
sprpriority = -5
ownpal = 1
ignorehitpause = 1
bindtime = -1
removetime = -1

[State 30060, 1]
type = Projectile
trigger1 = AnimElem = 26
projanim = 30069
projhitanim = 666
projpriority = 1
projheightbound = -240, 100
projedgebound = 100
projscreenbound = 100
projshadow = -1
projhits=10
pausetime=7,17
offset = 39, -72
velocity = 9
attr = S, SP
damage   = 30,10
animtype = heavy
guardflag = MA
hitflag = MAFDP
pausetime = 60,60
hitsound   = S20,2
sparkxy = 500,500
guardsound = S100, 29
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.type = High
air.velocity = -15,-7
air.hittime = 12
palfx.time = 12
palfx.color = 0
palfx.add = -180,0,100
palfx.sinadd = 20,20,40,10
envshake = 40
envshake.time = 13
fall = 1





[State 30071, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,66
volume = 255
channel = -1

[State 30071, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,66
volume = 255
channel = -1

[State 30071, PlaySnd]
type = PlaySnd
trigger1 = animelem = 25
value = S100,65
volume = 255
channel = -1

[State 30071, PlaySnd]
type = PlaySnd
trigger1 = animelem = 25
value = S100,65
volume = 255
channel = -1

[State 30071, PlaySnd]
type = PlaySnd
trigger1 = animelem=26
value = S100,32
volume = 255
channel = -1

[State 30071, PlaySnd]
type = PlaySnd
trigger1 = animelem=26
value = S100,32
volume = 255
channel = -1

[State 210, 3]
type = ChangeState
trigger1 = time = 6
value = 0
ctrl = 1

; =======================================================================
; Assist Attacks section
; As in MvC and MvC2, you can summon your partner to make an assist
; move, then he will taunt and leave, the basic difference between
; MvC2 version and this one is that your can use the alpha, beta or
; gamma assits if you hold a certain direction in the pad, so, the
; order of the attacks are:
; - Alpha Assist: y+b
; - Beta Assist: y+b + holding back
; - Gamma Assist: y+b + holding down.
; The only thing missing is the ability of calling out your partner
; when you are jumping (just normal jump, in super jump this is not
; posible).
; =======================================================================

; Standby onscreen for assist
;----------------------------
[Statedef 4700]
type = S
movetype = I
physics = S
sprpriority = -2
ctrl = 0
velset = 0, 0

; --------------------------------------------------------------------
; This part is customizable, you can add what you need to be done here

[State 4700, 1a] ; TAUNT A :
type = ChangeAnim
triggerall = time = 0
trigger1 = selfanimexist(4700)	  ; <--- find custom taunt anim...
value = 4700			  ; <--- do animation!

[State 4700, 1b] ; TAUNT B :
type = ChangeAnim
triggerall = time = 0
triggerall = !selfanimexist(4700) ; <--- if custom anim not found
trigger1 = selfanimexist(195)	  ; <--- find normal taunt...
value = 195			  ; <--- do animation!

[State 3000, s1]
type = PlaySnd
trigger1 = AnimElem = 2
value = s99,10

[State 4700, 2]
type = CtrlSet
trigger1 = time > 40
value = 1

[State 4700, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-----------------------------------
;----------------------------
[Statedef 4710]
type = A
physics = A
sprpriority = -2
ctrl = 0
velset = 0, 0

; --------------------------------------------------------------------
; This part is customizable, you can add what you need to be done here


[State 3000, s1]
type = PlaySnd
trigger1 = AnimElem = 2
value = s99,10

[State 4700, 2]
type = CtrlSet
trigger1 = time > 20
value = 1



[State ChangeS, 1]
type = ChangeState
trigger1 = animtime = 0
value = 50
ctrl = 1

; Jumping into the screen first (partner)
;----------------------------------------
[Statedef 4701]
type = A
movetype = I
physics = N
anim = 42  ; <- Jumping In (Hey, I'm gonna kick your ass!!!!)
sprpriority = 2
ctrl = 0

; NEW !! Tag active definers --------------------------------
[State 4701, 1a]
type = VarSet
trigger1 = time = [0,1]         ;Alpha, Beta & Gamma Assist
var(30) = ifelse(random < 700,3,4)

; -----------------------------------------------------------

[State 4701, 2] ; Prevents the camera from following the char
type = ScreenBound
trigger1 = 1
value = 0

; Starting position
[State 4701, 3]
type = PosSet
trigger1 = time = 0
x = (partner, pos x) - (200*(facing)) ; variable pos
y = -100

; Attack velocity
[State 4701, 4]
type = VelSet
trigger1 = Time = 0
x = 15
y = 7

[State 4701, 5]
type = PosSet
trigger1 = Pos Y >= 0
y = 0

; --------------------------------------------------------------------
; This part is customizable, you can add what you need to be done here

; Do assist attack depending on what dir is holding the partner


[State 4701, 6]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y >= 0
value = 4702
ctrl = 0

; Assist attacks (All attacks can be customized depending on the char)
;------------------------------------------------------------------------

; Alpha
; -------------
[Statedef 4702]
type = S
movetype = A
physics = S
sprpriority = 2
poweradd = 125
velset = 0, 0
ctrl = 0

[State 4601, 1b] ; ASSIST ATTACK :
type = ChangeAnim
triggerall = time = 0
trigger1 = selfanimexist(1000)	  ; <--- find assist attack...
value = 1000			  ; <--- do animation!

; Below code must be modified if you use another type of assist attack
; --------------------------------------------------------------------
[State 0, Explod] ;coffin
type = Explod
trigger1 = projhit = 1
anim = 31016
ID = 31016
pos = -21,0
facing = -1
postype = p2
removetime = 50
scale = .4,.3
bindtime = -1
sprpriority = 2
ownpal = 1

[State 0, Explod] ;coffin
type = Explod
trigger1 = projhit = 1
anim = 31017
ID = 31017
pos = -21,0
facing = -1
bindtime = -1
postype = p2
removetime = 50
scale = .35,.35
sprpriority = 2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 7023
ID = 7023
pos = 10,-0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 23
supermove
pausemove
scale = 0.7,0.7
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S140,13
volume = 255
channel = -1



[State 0, 1]
type = Projectile
trigger1 = AnimElem = 3
projanim = 1090
projhitanim = 1095
guard.sparkno = S910
projhits = 3
PROJSCALE = .5,.5
projpriority = 1
projheightbound = -240, 100
projedgebound = 100
projscreenbound = 100
projshadow = -1
offset = 47,-51
velocity = 2,0
attr = S, SP
damage   = 60,10
animtype = heavy
guardflag = MA
hitflag = MAFDP
pausetime = 15,20
hitsound   = S20,1
sparkxy = 500,500
guardsound = S100,29
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
air.fall = 1
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
palfx.time = 50
palfx.add = 5,0,72;72,-19,-204
palfx.mul = 338,389,256
;palfx.sinadd = 61,20,10,15
palfx.invertall = 1
palfx.color = 15
accel = 0.3



[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 4530

[State 210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S100,19
volume = 255
channel = -1

[State 200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S12,9
volume = 255
channel = -1





;--------------
[Statedef 4727]
type = S
movetype = I
physics = S
anim = 195
sprpriority = -2
velset = 0,0
ctrl = 0

[State 191, 2]
type = Playsnd
trigger1 = AnimElem = 5
persistent = 0
value = 0,0

[State 191, 3]
type = Playsnd
trigger1 = time = 14
persistent = 0
value = 1,0

[State 191, 4]
type = EnvShake
Trigger1 = AnimElem = 5,-1
persistent = 0
time = 20
ampl = -5
freq = 100
phase = 10

[State 4510, 1] ; Prevents the camera from following the char
type = PlayerPush
trigger1 = 1
value = 0

[State 4510, 2]
type = ChangeState
trigger1 = animtime = 0
value = 4511 ; Return to your place man!!!!

; =======================================================================
; Partner Counter Move
; This feature is already used in MvC, consists on changing your partner
; in the middle of guarding, this costs one stock, you can call it an
; emergency tag.
; This section is customizable, so change it according to your needs.
; =======================================================================

; Partner Counter Move (Going Out)
;---------------------------------------
[Statedef 4800]
type = S
movetype = I
physics = S
sprpriority = -2
anim = 40
velset = 0,0
ctrl = 0

; NEW !! Tag active definer
[State 4800, 1]
type = VarSet
trigger1 = time = [0,1]
var(30) = 2

[State 4800, 2]
type = SuperPause
trigger1 = time = 2
time = 20
anim = s9101
sound = s4, 11
pos = 30, -60
poweradd = -1000
unhittable = 1
ignorehitpause = 1

[State 4800, 3] ; the character cannot be hit since he is leaving
type = NotHitBy
trigger1 = 1
value = SCA

[State 4800, 4] ; Prevents the camera from following the char
type = PlayerPush
trigger1 = 1
value = 0

[State 4800, 5] ; Exit screen
type = ChangeState
trigger1 = time = 3
value = 4511

; Landing on screen first (partner)
;----------------------------------
[Statedef 4801]
type = A
movetype = I
physics = N
anim = 42  ; <- Jumping In (Hey, I'm gonna kick your ass!!!!)
sprpriority = 2
ctrl = 0

[State 4801, 1] ; Prevents the camera from following the char
type = ScreenBound
trigger1 = 1
value = 0

; Starting position
[State 4801, 2]
type = PosSet
trigger1 = time = 0
x = (partner, pos x) - (200*(facing)) ; variable pos
y = -120

; Attack velocity
[State 4801, 3]
type = VelSet
trigger1 = Time = 0
x = 22
y = 18

[State 4801, 4]
type = PosSet
trigger1 = Pos Y >= 0
y = 0

[State 4801, 5] ; the character cannot be hit since he is leaving
type = NotHitBy
trigger1 = 1
value = SCA

[State 4801, 6]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y >= 0
value = 4802
ctrl = 0

; Alpha Counter
; ---------------
[Statedef 4802]
type = S
movetype = A
physics = S
sprpriority = 2
poweradd = 125
velset = 0, 0
ctrl = 0

[State 4802, 1] ; COUNTER ATTACK :
type = ChangeAnim
triggerall = time = 0
trigger1 = selfanimexist(1000)	  ; <--- find counter attack...
value = 1000			  ; <--- do animation!

; Below code must be modified if you use another type of assist attack
; --------------------------------------------------------------------
[State 0, Explod] ;coffin
type = Explod
trigger1 = projhit = 1
anim = 31016
ID = 31016
pos = -21,0
facing = -1
postype = p2
removetime = 50
scale = .4,.3
bindtime = -1
sprpriority = 2
ownpal = 1

[State 0, Explod] ;coffin
type = Explod
trigger1 = projhit = 1
anim = 31017
ID = 31017
pos = -21,0
facing = -1
bindtime = -1
postype = p2
removetime = 50
scale = .35,.35
sprpriority = 2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 7023
ID = 7023
pos = 10,-0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 23
supermove
pausemove
scale = 0.7,0.7
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S140,13
volume = 255
channel = -1



[State 0, 1]
type = Projectile
trigger1 = AnimElem = 3
projanim = 1090
projhitanim = 1095
guard.sparkno = S910
projhits = 3
PROJSCALE = .5,.5
projpriority = 1
projheightbound = -240, 100
projedgebound = 100
projscreenbound = 100
projshadow = -1
offset = 47,-51
velocity = 2,0
attr = S, SP
damage   = 60,10
animtype = heavy
guardflag = MA
hitflag = MAFDP
pausetime = 15,20
hitsound   = S20,1
sparkxy = 500,500
guardsound = S100,29
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
air.fall = 1
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
palfx.time = 50
palfx.add = 5,0,72;72,-19,-204
palfx.mul = 338,389,256
;palfx.sinadd = 61,20,10,15
palfx.invertall = 1
palfx.color = 15
accel = 0.3



[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S100,19
volume = 255
channel = -1

[State 200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S12,9
volume = 255
channel = -1
