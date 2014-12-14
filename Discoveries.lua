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
local L = _G.LibStub("AceLocale-3.0"):GetLocale(addon.constants.addon_name)

local BN = constants.BOSS_NAMES
local Z = constants.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function module:InitializeDiscoveries()
	local function AddDiscovery(identifier, location, coordX, coordY, faction)
		addon.AcquireTypes.Discovery:AddEntity(module, {
			coord_x = coordX,
			coord_y = coordY,
			faction = faction,
			identifier = identifier,
			location = location,
			name = L[identifier],
		})
	end

	AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")
	AddDiscovery("DISCOVERY_ALCH_POTION")
	AddDiscovery("DISCOVERY_ALCH_PROT")
	AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")
	AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")
	AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")
	AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	self.InitializeDiscoveries = nil
end
