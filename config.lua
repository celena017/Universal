--supports up to 5 stops and mart, leave unused stops blank--
city = "Fortree City" -- Name of City --
pokecenter = "Pokecenter Fortree City" -- Name Of Pokecenter --
stop1 = "" -- Name of First Stop e.g. Cinnabar Mansion 1 -- 
stop2 = "" -- Name of Second Stop e.g. Cinnabar Mansion 2 --
stop3 = ""
stop4 = ""
stop5 = ""
endLocation = "Route 120" -- Where are you training at? e.g. Cinnabar Mansion 3 --
martLocation = "Fortree Mart"

-- Settings for Sorting --
-- Asc/Desc leave blank if unused --
sorting = "Asc"

--EV Training Settings--
evTraining = 0 --0. Off, 1. Training Single EV, Other value. Training Multi EV --
trainEv = 0 -- 1 Atk, 2 Def, 3 Speed, 4 Sp Atk, 5 Sp Def, 6 HP, any other value = Off --
trainEv2 = 0 -- 1 Atk, 2 Def, 3 Speed, 4 Sp Atk, 5 Sp Def, 6 HP, any other value = Off --
trainEvOf = "Gengar"
trainEvTill = 252
item = "Macho Brace"
equipItem = false -- Wears the above item if true --
removeItem = false -- Remove item when ev reached trainEvTill value --

-- Settings for Power Leveling weaker pokemon aka ExpShare --
--Set to 0 if not using powerLevel--
powerLevel = 0 -- Set between 1-5 depending no. of pokemons you are using to powerLevel the weaker pokemon --
stopAtLevel = 80
powerLevelingPokemon = "Rattata"

--Buy features wont work on some maps because the npc is on a different cell / location--
--Settings for auto purchase--
autoRefill = false
MinMoney = 700000
refillItem = "Ultra Ball"
MinAmt = 20
buyAmt = 1

-- Settings for escape rope --
-- NOTE: Only work on those maps that are able to use it --
useEscapeRope = false

--Declare which mount u use / leave blank if no mount--
mount = "S Absol Mount"
surfMount = "S Lapras Mount"

--Settings for training spot--
lookFor = 0 -- 0.Grass, 1.Water, 2.Fishing, Other Numbers = Rectangle --

-- Fishing Settings --
rod = "Super Rod"
fishingSpotX = 30
fishingSpotY = 30

--If is not Grass,Water,Fishing , what rectangle do you want to walk within at your endLocation?--
--You can set an infinite number of patterns to walk in, this makes you appear more like an actual human!--
--just add a set of coordinates, and make sure its name is different from the rest, like the examples below--

-- Pattern 1 --
rectX1 = 20
rectX2 = 20
rectY1 = 21
rectY2 = 24
-- Pattern 2 --
rectXB1 = 22
rectXB2 = 17
rectYB1 = 17
rectYB2 = 22
-- Pattern 3 --
rectXC1 = 20
rectXC2 = 20
rectYC1 = 17
rectYC2 = 21
-- Pattern 4 --
rectXD1 = 18
rectXD2 = 21
rectYD1 = 20
rectYD2 = 20
-- Pattern 5 --
rectXE1 = 18
rectXE2 = 22
rectYE1 = 21
rectYE2 = 21
-- Pattern 6 --
rectXF1 = 20
rectXF2 = 23
rectYF1 = 19
rectYF2 = 19
-- Pattern 7 --
rectXG1 = 19
rectXG2 = 17
rectYG1 = 20
rectYG2 = 20
-- Pattern 8 --
rectXH1 = 21
rectXH2 = 21
rectYH1 = 19
rectYH2 = 17
-- Pattern 9 --
rectXI1 = 18
rectXI2 = 18
rectYI1 = 22
rectYI2 = 17
-- Pattern 10 --
rectXJ1 = 20
rectXJ2 = 20
rectYJ1 = 20
rectYJ2 = 17

--Do you want to catch shineys and uncaught pokemon?--
catchShineys = true

catchNotCaught = true

--Do you only want to catch pokemon, and not level?--
onlyCatch = false

--Advance Catching Settings--
--NOTE: Turn onlyCatch for best experience--
advanceCatching = false
syncName = "Xatu"
moveUserIndex = 2 -- The index of the pokemon that use the move below --
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

--the below is case-sensitive, add more moves by adding commas. ex : onlyCatchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
catchThesePokemon = {"Absol", "Pupitar", "Larvitar", "Gastly", "Squirtle", "Bulbasaur", "Charmander", "Dratini", "Dragonair"}

--the below will be the percentage of your last alive poke's health that we'll stop fighting at--
--DEFAULT: 50--
healthToRunAt = 50

--Level to stop levelling mons, set to a value over 100 if you are just catching and have a lvl 100 team--
levelPokesTo = 100

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
movesNotToForget = {"Covet", "Shadow Ball", "Shadow Claw", "Blaze Kick", "Dragon Claw", "Psychic", "Night Slash", "X-Scissor", "Flame Burst", "Razor Wind", "Mean Look", "Earthquake", "Ice Beam", "Megahorn", "Wild charge", "Crunch", "Hyper Beam", "Dragon Dance", "Hydro Pump", "Air Slash", "FlameThrower", "Poison Jab", "Double-Edge", "Ice Fang", "Thunder Fang", "Fire Fang", "Play Rough", "Bite", "Covet", "Low Kick", "Quick Attack", "Ice Punch", "Thunder Punch", "Fire Punch", "Sky Uppercut", "Thunderbolt", "Thunder", "Thrash", "Horn Attack", "Nuzzle", "HeadButt", "False Swipe", "Fire Blast"}
