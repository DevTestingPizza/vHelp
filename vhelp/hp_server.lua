
-- NAME:	SIMPLE /HELP SCRIPT
-- BY:  	VESPURA
-- VERSION:	1.2

-- CONFIGURATION VARIABLES
-- Must change the filePath to your help.lua's file location!
local helpFilePath = 'C:\\FXserver\\server\\resources\\vhelp\\help.lua'
local rulesFilePath = 'C:\\FXserver\\server\\resources\\vhelp\\rules.lua'
local sortFile = false		--default: false
local messagePrefix = '^3' -- default: '^3'
local helpCommand = 'help'
local rulesCommand = 'rules'










-- CODE // NO NEED TO TOUCH THIS IF YOU CONFIGURE THE VARIABLES ABOVE.
RegisterCommand(helpCommand, function(source)
	if source == 0 then
		CancelEvent()
	else
        TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, '^0-----------------------------------------------------------------------------------------')
		TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, '^1Information:')
		io.input(helpFilePath)
		local lines = {}
		for line in io.lines() do
			table.insert(lines, line)
		end
		if sortFile then
			table.sort(lines)
		end
		for i, l in ipairs(lines) do TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, messagePrefix .. l) end
        TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, '^0-----------------------------------------------------------------------------------------')
	end
end)
RegisterCommand(rulesCommand, function(source)
	if source == 0 then
		CancelEvent()
	else
		TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, '^0-----------------------------------------------------------------------------------------')
		TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, '^1Rules:')
		io.input(rulesFilePath)
		local lines = {}
		for line in io.lines() do
			table.insert(lines, line)
		end
		if sortFile then
			table.sort(lines)
		end
		for i, l in ipairs(lines) do TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, messagePrefix .. l) end
        TriggerClientEvent('chatMessage', source , '', { 255, 255, 255 }, '^0-----------------------------------------------------------------------------------------')
	end
end)