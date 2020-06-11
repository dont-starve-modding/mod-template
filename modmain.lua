-- debug

function DumpComponent( comp )
	for name,value in pairs(comp) do
		if type(value) == "function" then
			-- local info = debug.getinfo(value,"LnS")
			-- print(string.format("      %s = function - %s", name, info.source..":"..tostring(info.linedefined)))
		else
			if value and type(value) == "table" and value.IsValid and type(value.IsValid) == "function" then
			   print(string.format("      %s = %s (valid:%s)", name, tostring(value),tostring(value:IsValid())))
			else
		   		print(string.format("      %s = %s", name, tostring(value)))
			end
		end
	end
end

function DumpEntity(ent)
	print("============================================ Dumping entity ",ent,"============================================")
	print(ent.entity:GetDebugString())
	print("--------------------------------------------------------------------------------------------------------------------")
	for name,value in pairs(ent) do
		if type(value) == "function" then
			-- local info = debug.getinfo(value,"LnS")
			-- print(string.format("   %s = function - %s", name, info.source..":"..tostring(info.linedefined)))
		else
			if value and type(value) == "table" and value.IsValid and type(value.IsValid) == "function" then
			   print(string.format("   %s = %s (valid:%s)", name, tostring(value),tostring(value:IsValid())))
			else
			   print(string.format("   %s = %s", name, tostring(value)))
			end
		end
	end
	print("--------------------------------------------------------------------------------------------------------------------")
	for i,v in pairs(ent.components) do
		print("   Dumping component",i)
		DumpComponent(v)
	end
	print("====================================================================================================================================")
end

-- debug end

PrefabFiles = {
}

Assets = {
    -- Asset("SOUND", "sound/rabbit.fsb"),
    -- Asset("SOUND", "sound/mole.fsb"),
}

STRINGS = GLOBAL.STRINGS

function TableMerge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                TableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

NEWSTRINGS = GLOBAL.require("my-mod-name-strings")
GLOBAL.STRINGS = TableMerge(GLOBAL.STRINGS, NEWSTRINGS)

-- constants

TUNING.WHATEVER = 42

-- configuration

if (GetModConfigData("property") == "low") then
    TUNING.WHATEVER = 41
end
if (GetModConfigData("property") == "high") then
    TUNING.WHATEVER = 43
end

local function do(act) 

end

-- new GLOBAL Action "DO"
AddAction('DO', 'Do', do)

-- DO Action takes some time
-- AddStategraphActionHandler('wilson_client', GLOBAL.ActionHandler(GLOBAL.ACTIONS.DO, "dolongaction"))
-- AddStategraphActionHandler('wilson', GLOBAL.ActionHandler(GLOBAL.ACTIONS.DO, "dolongaction"))

-- what to do when player is trying to use an item with chiller component
-- mostly a check whether to provide the CHILL action or not based hovered item
function componentpostinit(inst, doer, target, actions, right)
    -- print("using item with component perishable on something " .. tostring(right))
end

-- every prefab with the perishable component
AddComponentAction("USEITEM", "perishable", componentpostinit)

-- code below this statement is only executed on servers and not on clients
if not GLOBAL.TheNet:GetIsServer() then
    return
end

-- ice adjustments: ----------------

-- all ice prefabs have the chiller component
function dosomething(inst)
    -- inst:AddComponent("weapon")
end

AddPrefabPostInit("ice", dosomething)

-- other miscellaneous adjustments for specific items:  ------

local function overwrite_hambat_damage(inst)
--     -- overwrite damage
--     if inst.components.weapon ~= nil then
--         local old_setdamage = inst.components.weapon.SetDamage
--         inst.components.weapon.SetDamage = function(self, dmg)
--             local new_dmg = dmg

--             new_dmg = new_dmg * 1.1

--             old_setdamage(self, new_dmg)
--         end
--     end
end

AddPrefabPostInit("hambat", overwrite_hambat_damage)