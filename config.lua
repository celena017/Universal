--supports up to 5 stops and mart, leave unused stops blank--
city = ""
pokecenter = ""
stop1 = ""
stop2 = ""
stop3 = ""
stop4 = ""
stop5 = ""
endLocation = ""
martLocation = ""

-- Settings for Power Leveling weaker pokemon aka ExpShare --
--Turn this off if you want to use advanceCatching / onlyCatch--
powerLevel = false
stopAtLevel = 70
powerLevelingPokemon = "Charmander"
powerLevelerIndex = 3

--Buy features wont work on some maps because the npc is on a different cell / location--
--Settings for auto purchase--
buyBalls = true
MinMoney = 330000
buyBallType = "Ultra Ball"
MinBalls = 42
buyAmt = 1

-- Settings for escape rope --
-- NOTE: Only work on those maps that are able to use it --
-- NOTE: Might not work when buyBalls is turn on --
useEscapeRope = true
autoRefill = true
minRopeAmt = 5
buyRopeAmt = 1

--Declare which mount u use / leave blank if no mount--
mount = "Arcanine Mount"
surfMount = ""

--if no city, and pokecenter is on route, change this to true, and leave city blank--
pokecenterOnRoute = false

--Leave this true unless you are not fighting/catching in grass/water--
--Please set only one of the below to true if u want to look in grass or water then turn the other to false--
lookForGrass = false
lookForWater = true

--If the above is false, what rectangle do you want to walk within at your endLocation?--
--You can set an infinite number of patterns to walk in, this makes you appear more like an actual human!--
--just add a set of coordinates, and make sure its name is different from the rest, like the examples below--

rectX1 = 46
rectX2 = 46
rectY1 = 14
rectY2 = 19

rectXB1 = 45
rectXB2 = 48
rectYB1 = 19
rectYB2 = 19

rectXC1 = 46
rectXC2 = 46
rectYC1 = 19
rectYC2 = 22

rectXD1 = 47
rectXD2 = 47
rectYD1 = 19
rectYD2 = 22

rectXE1 = 45
rectXE2 = 47
rectYE1 = 15
rectYE2 = 15

--Do you want to catch shineys and uncaught pokemon?--
catchShineys = true

catchNotCaught = true

--Do you only want to catch pokemon, and not level?--
onlyCatch = false

--Advance Catching Settings--
--NOTE: Turn onlyCatch for best experience--
advanceCatching = false
syncName = "Kadabra"
moveUserIndex = 4
moveName = "False Swipe"

--Advance Catch without Sync for catching e.g. Abra--
--NOTE: Turn onlyCatch on for best experience --
useMoveOnly = false
useMovePokemon = "Golbat"
usingMove = "Mean Look"

--the below will be the percentage of your opponent's health we'll start throwing balls at--
--DEFAULT: 30--
percentToStartThrowing = 1
--DEFAULT: 50--
percentToStartThrowingIfShiny = 25

-- Currently In Progress --
useRod = false
rodType = "Old Rod"

--the below is case-sensitive, add more moves by adding commas. ex : onlyCatchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
catchThesePokemon = {"Kingdra", "Gyarados", "Abra", "Squirtle", "Bulbasaur", "Charmander", "Dratini", "Dragonair"}


--the below will be the percentage of your last alive poke's health that we'll stop fighting at--
--DEFAULT: 50--
healthToRunAt = 45

--Level to stop levelling mons, set to a value over 100 if you are just catching and have a lvl 100 team--
levelPokesTo = 100

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
movesNotToForget = {"Dragon Claw", "Psychic", "Night Slash", "X-Scissor", "Flame Burst", "Razor Wind", "Mean Look", "Earthquake", "Ice Beam", "Megahorn", "Wild charge", "Crunch", "Hyper Beam", "Dragon Dance", "Hydro Pump", "Air Slash", "FlameThrower", "Poison Jab", "Double-Edge", "Ice Fang", "Thunder Fang", "Fire Fang", "Play Rough", "Bite", "Covet", "Low Kick", "Quick Attack", "Ice Punch", "Thunder Punch", "Fire Punch", "Sky Uppercut", "Thunderbolt", "Thunder", "Thrash", "Horn Attack", "Nuzzle", "HeadButt", "False Swipe", "Fire Blast"}
