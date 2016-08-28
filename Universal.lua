--Start Script--
dofile "config.lua"

name = "Universal"
author = "Zymu edited by ToothBrush and Royal for providing the base framework"
description = "Training at " .. endLocation .. " and healing at " .. pokecenter .. "." .. " Leveling all pokemon in teams to " .. levelPokesTo .. "." .. " Flee @ " .. healthToRunAt.. "% HP."
stops = 0

function onStart()
	randTime = math.floor(os.clock())
	randomnizer = math.random(1,5)
	shinyCounter = 0
	wildCounter = 0
	pokecenterCounter = 0
	martvisitCounter = 0
	ballsBought = 0
	ropeBought = 0
	startMoney = getMoney()
	startPokeballCount = getItemQuantity("Pokeball")
	startGreatballCount = getItemQuantity("Great Ball")
	startUltraballCount = getItemQuantity("Ultra Ball")
	Catch = 0
	trapped = false
	get_usingMove = false
	if getTeamSize() == 1 then
    startLevel1 = getPokemonLevel(1)
	startExp1 = getPokemonTotalExperience(1)
	elseif getTeamSize() == 2 then
	startLevel1 = getPokemonLevel(1)
	startExp1 = getPokemonTotalExperience(1)
	startLevel2 = getPokemonLevel(2)
	startExp2 = getPokemonTotalExperience(2)
	elseif getTeamSize() == 3 then
	startLevel1 = getPokemonLevel(1)
	startExp1 = getPokemonTotalExperience(1)
	startLevel2 = getPokemonLevel(2)
	startExp2 = getPokemonTotalExperience(2)
	startLevel3 = getPokemonLevel(3)
	startExp3 = getPokemonTotalExperience(3)
	elseif getTeamSize() == 4 then
	startLevel1 = getPokemonLevel(1)
	startExp1 = getPokemonTotalExperience(1)
	startLevel2 = getPokemonLevel(2)
	startExp2 = getPokemonTotalExperience(2)
	startLevel3 = getPokemonLevel(3)
	startExp3 = getPokemonTotalExperience(3)
	startLevel4 = getPokemonLevel(4)
	startExp4 = getPokemonTotalExperience(4)
	elseif getTeamSize() == 5 then
	startLevel1 = getPokemonLevel(1)
	startExp1 = getPokemonTotalExperience(1)
	startLevel2 = getPokemonLevel(2)
	startExp2 = getPokemonTotalExperience(2)
	startLevel3 = getPokemonLevel(3)
	startExp3 = getPokemonTotalExperience(3)
	startLevel4 = getPokemonLevel(4)
	startExp4 = getPokemonTotalExperience(4)
	startLevel5 = getPokemonLevel(5)
	startExp5 = getPokemonTotalExperience(5)
	elseif getTeamSize() == 6 then
	startLevel1 = getPokemonLevel(1)
	startExp1 = getPokemonTotalExperience(1)
	startLevel2 = getPokemonLevel(2)
	startExp2 = getPokemonTotalExperience(2)
	startLevel3 = getPokemonLevel(3)
	startExp3 = getPokemonTotalExperience(3)
	startLevel4 = getPokemonLevel(4)
	startExp4 = getPokemonTotalExperience(4)
	startLevel5 = getPokemonLevel(5)
	startExp5 = getPokemonTotalExperience(5)
	startLevel6 = getPokemonLevel(6)
	startExp6 = getPokemonTotalExperience(6)
	end
--always leave this on 1! this helps determine which pattern to walk in!-- 
    Pattern = 1
	if stop1 ~= "" then
	stops = stops + 1
	end
	if stop2 ~= "" then
	stops = stops + 1
	end
	if stop3 ~= "" then
	stops = stops + 1
	end
	if stop4 ~= "" then
	stops = stops + 1
	end
	if stop5 ~= "" then
	stops = stops + 1
	end
	if onlyCatch then
	log("Info | onlyCatch is on!")
	log("Info | Bot will only catch pokemons")
	end
	if advanceCatching then
	log("Info | AdvanceCatching is on!")
	elseif useMoveOnly then
	advanceCatching = false
	log("Info| AdvanceCatching is on w/o Synchronize!")
	end
	if catchNotCaught then
	log("Info | catchNotCaught is on!")
	log("Info | Bot will catch pokemons that are uncaught")
	end
	if buyBalls == true and getMoney() < MinMoney then
	log("Info | You got less than the required amount " .. MinMoney .. " Turning off Auto-Buying")
	buyBalls = false
	elseif buyBalls == true then
	log("Info | Auto-Buy Balls is on!")
	end
	if useEscapeRope then 
	log("Info | Use Escape Rope is on!")
	end
	if autoRefill then
	log("Info | AutoRefill Escape Rope is on!")
	end
	if powerLevel == true then
	log("Info | Power Level mode is on!")
	log("Info | The Pokemon that gets Power Level is: " .. powerLevelingPokemon)
	log("Info | It will be Power-Leveled by " .. getPokemonName(powerLevelerIndex))
	log("Info | Until it reaches Level " .. stopAtLevel .. " then it will level on its own")
	end
end


--Show bot running time--
function RunningTime()
	RunTime = math.floor(os.clock())
	if (RunTime / 60) < 60 then -- is less than 1 hr
		return log("Run Time: " .. math.floor(RunTime / 60) .. " Minutes.")
	else --more than 1 hr
		local hr = math.floor((RunTime / 60) / 60)
		return log("Run Time: " .. hr .. " Hours " .. (math.floor(RunTime / 60) - (hr * 60)) .. " Minutes.")
	end
end

--after we encounter a pokemon, change the set pattern so we walk like a human,--
--to different spots instead of the same one over and over, when we reach the last pattern,restart! --

function onBattleMessage(wild)
    if stringContains(wild, "A Wild SHINY ") then
        shinyCounter = shinyCounter + 1
		wildCounter = wildCounter + 1
		recentMoney = getMoney()
		recentPBall = getItemQuantity("Pokeball")
		recentGBall = getItemQuantity("Great Ball")
		recentUBall = getItemQuantity("Ultra Ball")
		if getTeamSize() == 1 then
		recentExp1 = getPokemonTotalExperience(1)
		elseif getTeamSize() == 2 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		elseif getTeamSize() == 3 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		elseif getTeamSize() == 4 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		elseif getTeamSize() == 5 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		recentExp5 = getPokemonTotalExperience(5)
		elseif getTeamSize() == 6 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		recentExp5 = getPokemonTotalExperience(5)
		recentExp6 = getPokemonTotalExperience(6)
		end
        if (randTime / 25) < 25 then
		if Pattern == 1 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = 1
		log("Pattern " .. Pattern)
		end
		elseif (randTime / 25) > 25 and (randTime / 60) < 60 then
		if Pattern == 1 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern - 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = 1
		log("Pattern " .. Pattern)
		end
		elseif (randTime / 60) > 60 and (randTime / 90) < 90 then
		if Pattern == 1 then
		Pattern = Pattern + 4
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern - 2
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern - 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = Pattern - 3
		log("Pattern " .. Pattern)
		end
		else
		if randomnizer == 1 then
		Pattern = 1
		log("Pattern " .. Pattern)	
		elseif randomnizer == 2 then
		Pattern = 2
		log("Pattern " .. Pattern)	
		elseif randomnizer == 3 then
		Pattern = 3
		log("Pattern " .. Pattern)	
		elseif randomnizer == 4 then
		Pattern = 4
		log("Pattern " .. Pattern)
		elseif randomnizer == 5 then
		Pattern = 5
		log("Pattern " .. Pattern)
		end
		end
        log("Battle Log")
		log("=======================================")
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon(s) encountered: " .. wildCounter .. " and Catched " ..Catch.. " Pokemon(s).")
	    log("Info | Total Earning: $" .. tostring(recentMoney - startMoney).." (" .. string.format("$%.1f", (recentMoney - startMoney)/wildCounter) .." average)")
	    log("Info | PokeDollars/Hour: $" .. tostring(recentMoney - startMoney) / math.floor(os.clock() / 3600))
		if getTeamSize() == 1 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 2 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 3 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 4 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 5 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 6 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) + (recentExp6 - startExp6) / math.floor(os.clock() / 3600))
		end
		log("Info | Balls remaining: " .. recentPBall .. " Pokeballs " .. recentGBall .. " Great Balls " .. recentUBall .. " Ultra Balls")
		if useEscapeRope then
		log("Info | Escape Ropes Remaining " .. getItemQuantity("Escape Rope"))
		end
		log("Info | Balls used: " .. startPokeballCount - recentPBall .. " Pokeballs " .. startGreatballCount - recentGBall .. " Great Balls " .. startUltraballCount - recentUBall .. " Ultra Balls")
	    log("=======================================")
	elseif stringContains(wild, "A Wild ") then
        wildCounter = wildCounter + 1
		recentMoney = getMoney()
		recentPBall = getItemQuantity("Pokeball")
		recentGBall = getItemQuantity("Great Ball")
		recentUBall = getItemQuantity("Ultra Ball")
		if getTeamSize() == 1 then
		recentExp1 = getPokemonTotalExperience(1)
		elseif getTeamSize() == 2 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		elseif getTeamSize() == 3 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		elseif getTeamSize() == 4 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		elseif getTeamSize() == 5 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		recentExp5 = getPokemonTotalExperience(5)
		elseif getTeamSize() == 6 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		recentExp5 = getPokemonTotalExperience(5)
		recentExp6 = getPokemonTotalExperience(6)
		end
	    if (randTime / 25) < 25 then
		if Pattern == 1 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = 1
		log("Pattern " .. Pattern)
		end
		elseif (randTime / 25) > 25 and (randTime / 60) < 60 then
		if Pattern == 1 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern - 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = 1
		log("Pattern " .. Pattern)
		end
		elseif (randTime / 60) > 60 and (randTime / 90) < 90 then
		if Pattern == 1 then
		Pattern = Pattern + 4
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern - 2
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern - 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = Pattern - 3
		log("Pattern " .. Pattern)
		end
		else
		if randomnizer == 1 then
		Pattern = 1
		log("Pattern " .. Pattern)	
		elseif randomnizer == 2 then
		Pattern = 2
		log("Pattern " .. Pattern)	
		elseif randomnizer == 3 then
		Pattern = 3
		log("Pattern " .. Pattern)	
		elseif randomnizer == 4 then
		Pattern = 4
		log("Pattern " .. Pattern)
		elseif randomnizer == 5 then
		Pattern = 5
		log("Pattern " .. Pattern)
		end
		end
		log("Battle Log")
		log("=======================================")
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon(s) encountered: " .. wildCounter .. " and Catched " ..Catch.. " Pokemon(s).")
	    log("Info | Total Earning: $" .. tostring(recentMoney - startMoney).." (" .. string.format("$%.1f", (recentMoney - startMoney)/wildCounter) .." average)")
	    log("Info | PokeDollars/Hour: $" .. tostring(recentMoney - startMoney) / math.floor(os.clock() / 3600))
		if getTeamSize() == 1 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 2 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 3 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 4 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 5 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 6 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) + (recentExp6 - startExp6) / math.floor(os.clock() / 3600))
		end
		log("Info | Balls remaining: " .. recentPBall .. " Pokeballs " .. recentGBall .. " Great Balls " .. recentUBall .. " Ultra Balls")
		if useEscapeRope then
		log("Info | Escape Ropes Remaining " .. getItemQuantity("Escape Rope"))
		end
		log("Info | Balls used: " .. startPokeballCount - recentPBall .. " Pokeballs " .. startGreatballCount - recentGBall .. " Great Balls " .. startUltraballCount - recentUBall .. " Ultra Balls")
	    log("=======================================")
	elseif stringContains(wild, "wrapped") or stringContains(wild, "You can not switch this Pokemon!") or stringContains(wild, "You failed to run away!") or stringContains(wild, "You can not run away!")  then
	trapped = true
	log("Info | Anti-Trap mode activated")
	elseif stringContains(wild, "caught ") then
        Catch = Catch + 1
		recentMoney = getMoney()
	    recentPBall = getItemQuantity("Pokeball")
		recentGBall = getItemQuantity("Great Ball")
		recentUBall = getItemQuantity("Ultra Ball")
		if getTeamSize() == 1 then
		recentExp1 = getPokemonTotalExperience(1)
		elseif getTeamSize() == 2 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		elseif getTeamSize() == 3 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		elseif getTeamSize() == 4 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		elseif getTeamSize() == 5 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		recentExp5 = getPokemonTotalExperience(5)
		elseif getTeamSize() == 6 then
		recentExp1 = getPokemonTotalExperience(1)
		recentExp2 = getPokemonTotalExperience(2)
		recentExp3 = getPokemonTotalExperience(3)
		recentExp4 = getPokemonTotalExperience(4)
		recentExp5 = getPokemonTotalExperience(5)
		recentExp6 = getPokemonTotalExperience(6)
		end
        if (randTime / 25) < 25 then
		if Pattern == 1 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = 1
		log("Pattern " .. Pattern)
		end
		elseif (randTime / 25) > 25 and (randTime / 60) < 60 then
		if Pattern == 1 then
		Pattern = Pattern + 1
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern - 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = 1
		log("Pattern " .. Pattern)
		end
		elseif (randTime / 60) > 60 and (randTime / 90) < 90 then
		if Pattern == 1 then
		Pattern = Pattern + 4
		log("Pattern " .. Pattern)
		elseif Pattern == 2 then
		Pattern = Pattern + 2
		log("Pattern " .. Pattern)
		elseif Pattern == 3 then
		Pattern = Pattern - 2
		log("Pattern " .. Pattern)
		elseif Pattern == 4 then
		Pattern = Pattern - 1
		log("Pattern " .. Pattern)
		elseif Pattern == 5 then
		Pattern = Pattern - 3
		log("Pattern " .. Pattern)
		end
		else
		if randomnizer == 1 then
		Pattern = 1
		log("Pattern " .. Pattern)	
		elseif randomnizer == 2 then
		Pattern = 2
		log("Pattern " .. Pattern)	
		elseif randomnizer == 3 then
		Pattern = 3
		log("Pattern " .. Pattern)	
		elseif randomnizer == 4 then
		Pattern = 4
		log("Pattern " .. Pattern)
		elseif randomnizer == 5 then
		Pattern = 5
		log("Pattern " .. Pattern)
		end
		end
	    log("Battle Log")
		log("=======================================")
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon(s) encountered: " .. wildCounter .. " and Catched " ..Catch.. " Pokemon(s).")
	    log("Info | Total Earning: $" .. tostring(recentMoney - startMoney).." (" .. string.format("$%.1f", (recentMoney - startMoney)/wildCounter) .." average)")
	    log("Info | PokeDollars/Hour: $" .. tostring(recentMoney - startMoney) / math.floor(os.clock() / 3600))
		if getTeamSize() == 1 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 2 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 3 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 4 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 5 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 6 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) + (recentExp6 - startExp6) / math.floor(os.clock() / 3600))
		end
		log("Info | Balls remaining: " .. recentPBall .. " Pokeballs " .. recentGBall .. " Great Balls " .. recentUBall .. " Ultra Balls")
		if useEscapeRope then
		log("Info | Escape Ropes Remaining " .. getItemQuantity("Escape Rope"))
		end
		log("Info | Balls used: " .. startPokeballCount - recentPBall .. " Pokeballs " .. startGreatballCount - recentGBall .. " Great Balls " .. startUltraballCount - recentUBall .. " Ultra Balls")
	    log("=======================================")
	end
end

function onDialogMessage(pokecenter)
    if stringContains(pokecenter, "Would you like me to heal your Pokemon?") then
        pokecenterCounter = pokecenterCounter + 1
		log("Info | Times in Pokecenter: " .. pokecenterCounter)
	elseif stringContains(pokecenter, "What would you like to buy today?") or stringContains(pokecenter, "What are you intrested in buying today?") then
		martvisitCounter = martvisitCounter + 1
		log("Info | Times in Pokemart: " .. martvisitCounter)
    end
end

function onPause()
	log("=======================================")
	log("Info | Shineys encountered: " .. shinyCounter)
	log("Info | Pokemon(s) encountered: " .. wildCounter .. " and Catched " ..Catch.. " Pokemon(s).")
	log("Info | Total Earning: $" .. tostring(recentMoney - startMoney).." (" .. string.format("$%.1f", (recentMoney - startMoney)/wildCounter) .." average)")
    log("Info | PokeDollars/Hour: $" .. tostring(recentMoney - startMoney) / math.floor(os.clock() / 3600))
	if getTeamSize() == 1 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 2 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 3 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 4 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 5 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 6 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) + (recentExp6 - startExp6) / math.floor(os.clock() / 3600))
		end
	log("Info | Balls remaining: " .. recentPBall .. " Pokeballs " .. recentGBall .. " Great Balls " .. recentUBall .. " Ultra Balls")
    if useEscapeRope then
	    log("Info | Escape Ropes Remaining " .. getItemQuantity("Escape Rope"))
	    end
	log("Info | Balls used: " .. startPokeballCount - recentPBall .. " Pokeballs " .. startGreatballCount - recentGBall .. " Great Balls " .. startUltraballCount - recentUBall .. " Ultra Balls")
	log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
	if getTeamSize() == 1 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	elseif getTeamSize() == 2 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	elseif getTeamSize() == 3 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
	elseif getTeamSize() == 4 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
    log("Info | Your Fourth Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
		elseif getTeamSize() == 5 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
    log("Info | Your Fourth Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
	log("Info | Your Fifth Pokemon, ".. getPokemonName(5) ..", has gained ".. (getPokemonLevel(5) - startLevel5) .." levels!")
	elseif getTeamSize() == 6 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
    log("Info | Your Fourth Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
	log("Info | Your Fifth Pokemon, ".. getPokemonName(5) ..", has gained ".. (getPokemonLevel(5) - startLevel5) .." levels!")
	log("Info | Your Sixth Pokemon, ".. getPokemonName(6) ..", has gained ".. (getPokemonLevel(6) - startLevel6) .." levels!")
		end
		RunningTime()
	log("=======================================")
end
	
function onResume()
	log("=======================================")
	RunningTime()
	log("=======================================")
end

function onStop()
	log("=======================================")
	log("Info | Shineys encountered: " .. shinyCounter)
	log("Info | Pokemon(s) encountered: " .. wildCounter .. " and Catched " ..Catch.. " Pokemon(s).")
	log("Info | Total Earning: $" .. tostring(recentMoney - startMoney).." (" .. string.format("$%.1f", (recentMoney - startMoney)/wildCounter) .." average)")
	log("Info | PokeDollars/Hour: $" .. tostring(recentMoney - startMoney) / math.floor(os.clock() / 3600))
	if getTeamSize() == 1 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 2 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 3 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 4 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 5 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) / math.floor(os.clock() / 3600))
		elseif getTeamSize() == 6 then
		log("Info | Exp/Hour " .. (recentExp1 - startExp1) + (recentExp2 - startExp2) + (recentExp3 - startExp3) + (recentExp4 - startExp4) + (recentExp5 - startExp5) + (recentExp6 - startExp6) / math.floor(os.clock() / 3600))
		end
	log("Info | Balls remaining: " .. recentPBall .. " Pokeballs " .. recentGBall .. " Great Balls " .. recentUBall .. " Ultra Balls")
    if useEscapeRope then
		log("Info | Escape Ropes Remaining " .. getItemQuantity("Escape Rope"))
		end
	log("Info | Balls used: " .. startPokeballCount - recentPBall .. " Pokeballs " .. startGreatballCount - recentGBall .. " Great Balls " .. startUltraballCount - recentUBall .. " Ultra Balls")
	log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		if getTeamSize() == 1 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	elseif getTeamSize() == 2 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	elseif getTeamSize() == 3 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
	elseif getTeamSize() == 4 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
    log("Info | Your Fourth Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
		elseif getTeamSize() == 5 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
    log("Info | Your Fourth Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
	log("Info | Your Fifth Pokemon, ".. getPokemonName(5) ..", has gained ".. (getPokemonLevel(5) - startLevel5) .." levels!")
	elseif getTeamSize() == 6 then
	log("Info | Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
	log("Info | Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
	log("Info | Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
    log("Info | Your Fourth Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
	log("Info | Your Fifth Pokemon, ".. getPokemonName(5) ..", has gained ".. (getPokemonLevel(5) - startLevel5) .." levels!")
	log("Info | Your Sixth Pokemon, ".. getPokemonName(6) ..", has gained ".. (getPokemonLevel(6) - startLevel6) .." levels!")
		end
		RunningTime()
	log("=======================================")
end

function IsSorted()
	if getTeamSize() == 1 then
		return true
	elseif getTeamSize() == 2 then
		if getPokemonLevel(1) <= getPokemonLevel(2) then
			return true
		else
			return false
		end
	elseif getTeamSize() == 3 then
		if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) then
			return true
		else
			return false
		end
	elseif getTeamSize() == 4 then
		if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) and getPokemonLevel(3) <= getPokemonLevel(4) then
			return true
		else
			return false
		end
	elseif getTeamSize() == 5 then
		if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) and getPokemonLevel(3) <= getPokemonLevel(4) and getPokemonLevel(4) <= getPokemonLevel(5) then
			return true
		else
			return false
		end
	elseif getTeamSize() == 6 then
		if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) and getPokemonLevel(3) <= getPokemonLevel(4) and getPokemonLevel(4) <= getPokemonLevel(5) and getPokemonLevel(5) <= getPokemonLevel(6) then
			return true
		else
			return false
		end
	end
end

function ReturnHighestIndexUnderLevel()
	result = 0
	for i = 1, getTeamSize(), 1 do
		if getPokemonLevel(i) < levelPokesTo then
			result = i
		end
	end
	return result
end

function IsPokemonOnCaptureList()
	result = false
	if catchThesePokemon[1] ~= "" then
	for i = 1, TableLength(catchThesePokemon), 1 do
		if getOpponentName() == catchThesePokemon[i] then
			result = true
			break
		end
	end
	end
	return result
end

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- below is the part of code in which you actually move, for how many patterns there are, just add another--
-- statement for said number! remember, this is just one of code blocks to change, change them all if you add more patterns--


function onPathAction()
get_usingMove = false
if getUsablePokemonCount() >= 1 and getPokemonHealthPercent(getTeamSize()) >= healthToRunAt and isPokemonUsable(ReturnHighestIndexUnderLevel()) then
	
	if not onlyCatch and not IsSorted() and not powerLevel and not advanceCatching and not useMoveOnly then
		sortTeamByLevelAscending()
        log("Sorting Pokemon in-progress")
		
    elseif powerLevel and getPokemonName(1) != powerLevelingPokemon then
	    swapPokemonWithLeader(powerLevelingPokemon)
	   	log("Swapping " .. powerLevelingPokemon .. " to first index to be Power-Leveled!")      		
	
    elseif advanceCatching and getPokemonName(1) != syncName then
	    swapPokemonWithLeader(syncName)
		log("Swapping " .. syncName .. " to first index for Synchronize!")
			
    elseif useMoveOnly and getPokemonName(1) != useMovePokemon then
        swapPokemonWithLeader(useMovePokemon)
        log("Swapping " .. useMovePokemon .. " to first index for Advance catching w/o Synchronize!")		
	
	elseif not isMounted() and hasItem(mount) and not isSurfing() and isOutside() and not string.find(getMapName(), "Pokecenter") and not string.find(getMapName(), "Mart") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Pokemart") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") then
		useItem(mount)
		log("Getting on " .. mount)
		
	elseif advanceCatching and stops == 0 and pokecenterOnRoute and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif advanceCatching and stops == 0 and not pokecenterOnRoute and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif advanceCatching and stops == 1 and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
        if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif advanceCatching and stops == 2 and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif advanceCatching and stops == 3 and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif advanceCatching and stops == 4 and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop4)
		elseif getMapName() == stop4 then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif advanceCatching and stops == 5 and (not isPokemonUsable(1) or not isPokemonUsable(moveUserIndex) or getRemainingPowerPoints(moveUserIndex, moveName) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop5)
		elseif getMapName() == stop5 then
		moveToMap(stop4)
		elseif getMapName() == stop4 then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 0 and pokecenterOnRoute and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 0 and not pokecenterOnRoute and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 1 and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 2 and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 3 and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 4 and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop4)
		elseif getMapName() == stop4 then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif useMoveOnly and stops == 5 and (not isPokemonUsable(1) or getRemainingPowerPoints(1, usingMove) == 0) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop5)
		elseif getMapName() == stop5 then
		moveToMap(stop4)
		elseif getMapName() == stop4 then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
	elseif powerLevel == true and stops == 0 and pokecenterOnRoute and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif powerLevel == true and stops == 0 and not pokecenterOnRoute and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif powerLevel == true and stops == 1 and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
	elseif powerLevel == true and stops == 2 and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
	elseif powerLevel == true and stops == 3 and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
	elseif powerLevel == true and stops == 4 and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop4)
		elseif getMapName() == stop4 then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
		elseif powerLevel == true and stops == 5 and (not isPokemonUsable(1) or not isPokemonUsable(powerLevelerIndex)) then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
		moveToMap(stop5)
		elseif getMapName() == stop5 then
		moveToMap(stop4)
		elseif getMapName() == stop4 then
		moveToMap(stop3)
		elseif getMapName() == stop3 then
		moveToMap(stop2)
		elseif getMapName() == stop2 then
		moveToMap(stop1)
		elseif getMapName() == stop1 then
		moveToMap(city)
		elseif getMapName() == city then
		moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif stops == 0 and pokecenterOnRoute then
		if getMapName() == pokecenter then
		moveToMap(endLocation)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(martLocation)				
		elseif buyBalls == true and getMapName() == martLocation and getMapName() != "Indigo Plateau Center" and not isShopOpen() then
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
			    elseif lookForWater then
				return moveToWater() or useItem(surfMount)
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
	
	elseif stops == 0 and not pokecenterOnRoute then
	if getMapName() == pokecenter then
		moveToMap(city)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(city)				
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == city then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		elseif getMapName() == city then
			moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
				elseif lookForWater then
			    return moveToWater() or useItem(surfMount)
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
	
	elseif stops == 1 then
		if getMapName() == pokecenter then
		moveToMap(city)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(stop1)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop1 then
		moveToMap(city)				
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == city then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		elseif getMapName() == city then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
				elseif lookForWater then
				return moveToWater() or useItem(surfMount)
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
		
	elseif stops == 2 then	
		if getMapName() == pokecenter then
		moveToMap(city)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(stop2)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop2 then
		moveToMap(stop1)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop1 then
		moveToMap(city)				
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == city then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		elseif getMapName() == city then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
				elseif lookForWater then
				return moveToWater() or useItem(surfMount)  		
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
	
	elseif stops == 3 then
		if getMapName() == pokecenter then
		moveToMap(city)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(stop3)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop3 then
		moveToMap(stop2)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop2 then
		moveToMap(stop1)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop1 then
		moveToMap(city)				
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == city then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		elseif getMapName() == city then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop3)
		elseif getMapName() == stop3 then
			moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
				elseif lookForWater then
				return moveToWater() or useItem(surfMount)
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
	
	elseif stops == 4 then
		if getMapName() == pokecenter then
		moveToMap(city)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(stop4)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop4 then
		moveToMap(stop3)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop3 then
		moveToMap(stop2)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop2 then
		moveToMap(stop1)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop1 then
		moveToMap(city)				
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == city then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		elseif getMapName() == city then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop3)
		elseif getMapName() == stop3 then
			moveToMap(stop4)
		elseif getMapName() == stop4 then
			moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
				elseif lookForWater then
				return moveToWater() or useItem(surfMount)
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
		
	elseif stops == 5 then
		if getMapName() == pokecenter then
		moveToMap(city)	
		elseif buyBalls == true and onlyCatch == true and getMoney() < MinMoney then
		log("You got less than the required amount $"..MinMoney .. " Turning off Auto-Buying ")
		buyBalls = false
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == endLocation then
		moveToMap(stop5)
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop5 then
		moveToMap(stop4)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop4 then
		moveToMap(stop3)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop3 then
		moveToMap(stop2)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop2 then
		moveToMap(stop1)
	    elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == stop1 then
		moveToMap(city)				
		elseif buyBalls == true and onlyCatch == true and getItemQuantity(buyBallType) < MinBalls and getMoney() >= MinMoney and getMapName() == city then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		elseif getMapName() == city then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop3)
		elseif getMapName() == stop3 then
			moveToMap(stop4)
		elseif getMapName() == stop4 then
			moveToMap(stop5)
		elseif getMapName() == stop5 then
			moveToMap(endLocation)
		elseif getMapName() == endLocation then
			if lookForGrass then
				moveToGrass()
				elseif lookForWater then
				return moveToWater() or useItem(surfMount)
			else
				if Pattern == 1 then
		                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
		                elseif Pattern == 2 then
		                moveToRectangle(rectXB1, rectYB1, rectXB2, rectYB2)
		                elseif Pattern == 3 then
		                moveToRectangle(rectXC1, rectYC1, rectXC2, rectYC2)
		                elseif Pattern == 4 then
		                moveToRectangle(rectXD1, rectYD1, rectXD2, rectYD2)
		                elseif Pattern == 5 then
		                moveToRectangle(rectXE1, rectYE1, rectXE2, rectYE2)
                                end
			end
		end
	end
		
		
else
		
	if buyBalls == true and getMapName() == city and getItemQuantity(buyBallType) == 0 and getMoney()>= MinMoney then
        moveToMap(martLocation)
		elseif buyBalls == true and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif buyBalls == true and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif buyBalls == true and getMapName() == martLocation and (getMapName() != "Indigo Plateau Center" or getMapName() != "Blackthorn City Pokemart") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif buyBalls and isShopOpen() and getItemQuantity(buyBallType) < MinBalls then
		buyItem(buyBallType, buyAmt)
		ballsBought = ballsBought + buyAmt
		if buyBallType == "Pokeball" then
		startPokeballCount = startPokeballCount + buyAmt
		elseif buyBallType == "Great Ball" then
		startGreatballCount = startGreatballCount + buyAmt
		elseif buyBallType == "Ultra Ball" then
		startUltraballCount = startUltraballCount + buyAmt
		end
		log("Info | Bought " .. ballsBought .. " " .. buyBallType  .. "(s).")
		elseif buyBalls and getItemQuantity(buyBallType) >= MinBalls and getMapName() == martLocation then
		moveToMap(city)
		
	elseif autoRefill and getMapName() == city and getItemQuantity("Escape Rope") == 0 and getMoney()>= MinMoney then
        moveToMap(martLocation)
		elseif autoRefill and getMapName() == "Indigo Plateau Center" and not isShopOpen() then
		talkToNpcOnCell(16, 22)
		elseif autoRefill and getMapName() == "Blackthorn City Pokemart" and not isShopOpen() then
		talkToNpcOnCell(3, 4)
		elseif autoRefill and getMapName() == martLocation and (getMapName() != "Blackthorn City Pokemart" or getMapName() != "Indigo Plateau Center") and not isShopOpen() then
		talkToNpcOnCell(3, 5)
		elseif isShopOpen() and getItemQuantity("Escape Rope") < minRopeAmt then
		buyItem("Escape Rope", buyRopeAmt)
		ropeBought = ropeBought + buyRopeAmt
		log("Info | Bought " .. ropeBought .. " Escape Rope(s).")
		elseif autoRefill and getItemQuantity("Escape Rope") >= minRopeAmt and getMapName() == martLocation then
		moveToMap(city)
		
	elseif stops == 0 and pokecenterOnRoute then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end	
		
		elseif not isMounted() and hasItem(mount) and not isSurfing() and isOutside() and not string.find(getMapName(), "Pokecenter") and not string.find(getMapName(), "Mart") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Pokemart") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") then
		useItem(mount)
		log("Getting on " .. mount)
	   							
	    elseif stops == 0 and not pokecenterOnRoute then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(city)
		elseif getMapName() == city then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif stops == 1 then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(city)
		elseif getMapName() == city then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
	elseif stops == 2 then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(city)
		elseif getMapName() == city then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif stops == 3 then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(stop3)
		elseif getMapName() == stop3 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(city)
		elseif getMapName() == city then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	
	elseif stops == 4 then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(stop4)
		elseif getMapName() == stop4 then
			moveToMap(stop3)
		elseif getMapName() == stop3 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(city)
		elseif getMapName() == city then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
		
	elseif stops == 5 then
	    if getMapName() == endLocation and useEscapeRope and hasItem("Escape Rope") and getItemQuantity("Escape Rope") >= 1 then
		useItem("Escape Rope")
		elseif getMapName() == endLocation then
			moveToMap(stop5)
		elseif getMapName() == stop5 then
			moveToMap(stop4)
		elseif getMapName() == stop4 then
			moveToMap(stop3)
		elseif getMapName() == stop3 then
			moveToMap(stop2)
		elseif getMapName() == stop2 then
			moveToMap(stop1)
		elseif getMapName() == stop1 then
			moveToMap(city)
		elseif getMapName() == city then
			moveToMap(pokecenter)
		elseif getMapName() == pokecenter then
		if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)
		else
		usePokecenter()
		end
	end
	end
end --condition--
end --func--

function onBattleAction()
    if powerLevel and getActivePokemonNumber() == 1 and isPokemonUsable(powerLevelerIndex) and getPokemonLevel(1) < stopAtLevel then				
		return sendPokemon(powerLevelerIndex)
    end
	if getActivePokemonNumber() <= getTeamSize() then
		if isWildBattle() and ((isOpponentShiny() and catchShineys) or (catchNotCaught and not isAlreadyCaught())) or IsPokemonOnCaptureList() then
			if getPokemonHealthPercent(getTeamSize()) > healthToRunAt then
				if isPokemonUsable(getActivePokemonNumber()) then
					if advanceCatching and getActivePokemonNumber() != moveUserIndex and getOpponentHealthPercent() > percentToStartThrowing and not isOpponentShiny then
						return sendPokemon(moveUserIndex)
					elseif advanceCatching and getActivePokemonNumber() == moveUserIndex and getOpponentHealthPercent() > percentToStartThrowing and getRemainingPowerPoints(moveUserIndex, moveName) >= 1 then
						return useMove(moveName)
					elseif advanceCatching and getOpponentHealthPercent() <= percentToStartThrowing then
						return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
					elseif advanceCatching and getActivePokemonNumber() == moveUserIndex and getOpponentHealthPercent() > percentToStartThrowing and not isOpponentShiny and getRemainingPowerPoints(moveUserIndex, moveName) == 0 then
						return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or run()
					elseif useMoveOnly and getActivePokemonNumber() == 1 and getRemainingPowerPoints(1, usingMove) >= 1 and get_usingMove == false then
					    get_usingMove = true
						return useMove(usingMove)
					elseif useMoveOnly and get_usingMove == true then
					    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
					elseif useMoveOnly and getActivePokemonNumber() == 1 and getRemainingPowerPoints(1, usingMove) == 0 and get_usingMove == false then
					    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or run()
					elseif not advanceCatching and not useMoveOnly then
						if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
							return
						else
							return attack() or sendUsablePokemon() or run()
						end
					end
					if advanceCatching and getActivePokemonNumber() != moveUserIndex and getOpponentHealthPercent() > percentToStartThrowingIfShiny and isOpponentShiny then
						return sendPokemon(moveUserIndex)
					elseif advanceCatching and getActivePokemonNumber() == moveUserIndex and getOpponentHealthPercent() > percentToStartThrowingIfShiny and isOpponentShiny and getRemainingPowerPoints(moveUserIndex, moveName) >= 1 then
						return useMove(moveName)
					elseif advanceCatching and getOpponentHealthPercent() <= percentToStartThrowingIfShiny and isOpponentShiny then
						return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
					elseif advanceCatching and getActivePokemonNumber() == moveUserIndex and getOpponentHealthPercent() > percentToStartThrowingIfShiny and isOpponentShiny and getRemainingPowerPoints(moveUserIndex, moveName) == 0 then
						return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or run()
					elseif useMoveOnly and getActivePokemonNumber() == 1 and getRemainingPowerPoints(1, usingMove) >= 1 and get_usingMove == false then
					    get_usingMove = true
						return useMove(usingMove)
					elseif useMoveOnly and get_usingMove == true then
					    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
					elseif useMoveOnly and getActivePokemonNumber() == 1 and getRemainingPowerPoints(1, usingMove) == 0 and get_usingMove == false then
					    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or run()
					elseif not advanceCatching and not useMoveOnly then
						if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
							return
						else
							return attack() or sendUsablePokemon() or run()
						end
					end
				else
					return sendUsablePokemon()
				end
			else
				return run()
			end
		else
			if not trapped and (getPokemonHealthPercent(getTeamSize()) < healthToRunAt or onlyCatch) then
				return run()
			elseif trapped == true then
			   trapped = false
			    return attack() or sendUsablePokemon()
			else
				return attack() or sendUsablePokemon() or run()
				end
			end
		end
	end
	
function onLearningMove(moveName, pokemonIndex)
	log(getPokemonName(pokemonIndex) .. " is learning a new move " .. moveName)
	return forgetAnyMoveExcept(movesNotToForget)
end
