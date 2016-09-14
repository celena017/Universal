--supports up to 5 stops and mart, leave unused stops blank--
city = "" -- Name of City --
pokecenter = "Pokecenter Lilycove City" -- Name Of Pokecenter --
stop1 = "" -- Name of First Stop e.g. Cinnabar Mansion 1 -- 
stop2 = "" -- Name of Second Stop e.g. Cinnabar Mansion 2 --
stop3 = ""
stop4 = ""
stop5 = ""
endLocation = "" -- Where are you training at? e.g. Cinnabar Mansion 3 --
martLocation = ""

-- Bot stop timer --
stopBotByTime = false
stopTime = 0

-- Bot stop encounter --
stopBotByEnc = false
stopCount = 0

-- Settings for Sorting --
-- Asc/Desc leave blank if unused --
sorting = "Asc"

--EV Training Settings--
evTraining = 0 --0. Off, 1. Training Single EV, Other value. Training Multi EV --
trainEv = 0 -- 1 Atk, 2 Def, 3 Speed, 4 Sp Atk, 5 Sp Def, 6 HP, any other value = Off --
trainEv2 = 0 -- 1 Atk, 2 Def, 3 Speed, 4 Sp Atk, 5 Sp Def, 6 HP, any other value = Off --
trainEvOf = "Absol"
trainEvTill = 252
item = "Macho Brace"
equipItem = true -- Wears the above item if true --
removeItem = true -- Remove item when ev reached trainEvTill value --

-- Settings for Power Leveling weaker pokemon aka ExpShare --
--Set to 0 if not using powerLevel--
powerLevel = 0 -- Set between 1-5 depending no. of pokemons you are using to powerLevel the weaker pokemon --
stopAtLevel = 50
powerLevelingPokemon = "Kadabra"

--Buy features wont work on some maps because the npc is on a different cell / location--
--Settings for auto purchase--
autoRefill = false
MinMoney = 900000
refillItem = "Ultra Ball"
MinAmt = 10
buyAmt = 1

-- Settings for escape rope --
-- NOTE: Only work on those maps that are able to use it --
useEscapeRope = false

--Declare which mount u use / leave blank if no mount--
mount = "Latios Mount"
surfMount = "S Margikarp Mount"

--Settings for training spot--
lookFor = 0 -- 0.Grass, 1.Water, 2.Fishing, Other Numbers = Rectangle --

-- Fishing Settings --
rod = "Super Rod"
-- No of fishing spot used between 1 - 5 --
noOfFishingSpot = 5
-- Fishing Spot 1 --
fishingSpotX = 62
fishingSpotY = 25
-- Fishing Spot 2 --
fishingSpotX2 = 20
fishingSpotY2 = 20
-- Fishing Spot 3 --
fishingSpotX3 = 25
fishingSpotY3 = 25
-- Fishing Spot 4 --
fishingSpotX4 = 35
fishingSpotY4 = 35
-- Fishing Spot 5 --
fishingSpotX5 = 40
fishingSpotY5 = 40

--If is not Grass,Water,Fishing , what rectangle do you want to walk within at your endLocation?--
--You can set an infinite number of patterns to walk in, this makes you appear more like an actual human!--
--just add a set of coordinates, and make sure its name is different from the rest, like the examples below--
usePattern = 10 -- Between 1-10 depending how many patterns u want the bot to move in--
-- Pattern 1 --
rectX1 = 33
rectX2 = 36
rectY1 = 9
rectY2 = 11
-- Pattern 2 --
rectXB1 = 31
rectXB2 = 34
rectYB1 = 9
rectYB2 = 12
-- Pattern 3 --
rectXC1 = 31
rectXC2 = 34
rectYC1 = 12
rectYC2 = 15
-- Pattern 4 --
rectXD1 = 25
rectXD2 = 29
rectYD1 = 9
rectYD2 = 12
-- Pattern 5 --
rectXE1 = 33
rectXE2 = 37
rectYE1 = 10
rectYE2 = 13
-- Pattern 6 --
rectXF1 = 33
rectXF2 = 37
rectYF1 = 11
rectYF2 = 15
-- Pattern 7 --
rectXG1 = 29
rectXG2 = 31
rectYG1 = 8
rectYG2 = 10
-- Pattern 8 --
rectXH1 = 23
rectXH2 = 27
rectYH1 = 8
rectYH2 = 10
-- Pattern 9 --
rectXI1 = 33
rectXI2 = 37
rectYI1 = 9
rectYI2 = 12
-- Pattern 10 --
rectXJ1 = 35
rectXJ2 = 42
rectYJ1 = 10
rectYJ2 = 14

--Do you want to catch shineys and uncaught pokemon?--
catchShineys = true

catchNotCaught = true

--Do you only want to catch pokemon, and not level?--
onlyCatch = false

--Advance Catching Settings--
--NOTE: Turn onlyCatch for best experience--
advanceCatching = false
syncName = "Xatu"
moveUserIndex = 6 -- The index of the pokemon that use the move below --
moveName = "False Swipe"

--Advance Catch without Sync for catching e.g. Abra--
--NOTE: Turn onlyCatch on for best experience --
useMoveOnly = false
useMovePokemon = "Gengar"
usingMove = "Mean Look"

--the below will be the percentage of your opponent's health we'll start throwing balls at--
--DEFAULT: 30--
percentToStartThrowing = 10
--DEFAULT: 50--
percentToStartThrowingIfShiny = 25

--the below is case-sensitive, add more moves by adding commas. ex : onlyCatchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
catchThesePokemon = {"Riolu", "Trapinch", "Gothita", "Pupitar", "Larvitar", "Gastly", "Squirtle", "Bulbasaur", "Charmander", "Dratini", "Dragonair"}

--the below will be the percentage of your last alive poke's health that we'll stop fighting at--
--DEFAULT: 50--
healthToRunAt = 35

--Level to stop levelling mons, set to a value over 100 if you are just catching and have a lvl 100 team--
levelPokesTo = 100

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
movesNotToForget = {"Sleep Powder", "Covet", "Shadow Ball", "Shadow Claw", "Blaze Kick", "Dragon Claw", "Psychic", "Night Slash", "X-Scissor", "Flame Burst", "Razor Wind", "Mean Look", "Earthquake", "Ice Beam", "Megahorn", "Wild charge", "Crunch", "Hyper Beam", "Dragon Dance", "Hydro Pump", "Air Slash", "FlameThrower", "Poison Jab", "Double-Edge", "Ice Fang", "Thunder Fang", "Fire Fang", "Play Rough", "Bite", "Covet", "Low Kick", "Quick Attack", "Ice Punch", "Thunder Punch", "Fire Punch", "Sky Uppercut", "Thunderbolt", "Thunder", "Thrash", "Horn Attack", "Nuzzle", "HeadButt", "False Swipe", "Fire Blast"}
