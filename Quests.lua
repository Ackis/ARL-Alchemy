-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-------------------------------------------------------------------------------
-- Module namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local addon = private.addon
if not addon then
	return
end

local constants = addon.constants
local module = addon:GetModule(private.module_name)

local Z = constants.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function module:InitializeQuests()
	local function AddQuest(questID, zoneName, coordX, coordY, faction)
		addon.AcquireTypes.Quest:AddEntity(module, {
			coord_x = coordX,
			coord_y = coordY,
			faction = faction,
			identifier = questID,
			item_list = {},
			locationName = zoneName,
			name = nil, -- Handled by memoizing table in the core.
		})
	end

	AddQuest(14151,	Z.DALARAN_NORTHREND,			42.5,	32.1,	"Neutral")
	AddQuest(41657,	Z.AZSUNA,				46.8,	41.1,	"Neutral")
	AddQuest(41658,	Z.VALSHARAH,				54.6,	73.2,	"Neutral")
	AddQuest(41659,	Z.THUNDER_TOTEM,			38.4,	46.0,	"Neutral")
	AddQuest(41661,	Z.SURAMAR,				36.4,	46.8,	"Neutral")
	AddQuest(41662,	Z.DALARAN_BROKENISLES,			33.4,	47.8,	"Neutral")

	self.InitializeQuests = nil
end
