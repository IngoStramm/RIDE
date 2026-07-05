local ADDON_NAME = ...

local RIDE = CreateFrame("Frame", "RIDEFrame")
_G.RIDE = RIDE

BINDING_HEADER_RIDE = "RIDE"
_G["BINDING_NAME_RIDE_SMART_TRAVEL"] = "Smart Travel"
_G["BINDING_NAME_CLICK RIDEButton:LeftButton"] = "Smart Travel"

local LOCALE = GetLocale and GetLocale() or "enUS"

local LOCALES = {
    enUS = {
        LOADED = "loaded. Use /ride to open options.",
        HELP_HEADER = "RIDE commands:",
        HELP_OPEN = "/ride - open options",
        HELP_STATUS = "/ride status - show current setup",
        HELP_GROUND = "/ride ground <item link or name> - set ground mount",
        HELP_FLYING = "/ride flying <item link or name> - set flying mount",
        HELP_CURSOR = "/ride ground or /ride flying while holding a mount item - set from cursor",
        HELP_CLEAR = "/ride clear ground|flying - clear a mount",
        HELP_DRUID = "/ride druid - toggle Druid travel forms",
        HELP_BIND = "/ride bind <key> - bind Smart Travel, e.g. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - clear the Smart Travel keybind",
        HELP_UPDATE = "/ride update - rebuild the secure action",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Ground mount",
        FLYING_MOUNT = "Flying mount",
        MOUNT_HINT = "Drag a mount item from your bag onto a slot, or pick it up and click the slot.",
        SLOT_EMPTY = "+",
        CLEAR = "Clear",
        DRUID_FORMS = "Use Druid travel forms",
        DRUID_AQUATIC = "Use Aquatic Form while swimming",
        DRUID_FLIGHT = "Use Flight Form in flyable areas",
        DRUID_TRAVEL = "Use Travel Form on ground",
        PREVENT_FLYING_DISMOUNT = "Prevent dismount while flying",
        SET_BINDING = "Set key",
        CLEAR_BINDING = "Clear key",
        REFRESH = "Refresh",
        STATUS = "Status",
        KEYBIND = "Keybind",
        KEYBIND_CAPTURE = "Press a key for RIDE Smart Travel. Press Esc to cancel.",
        CURRENT_ACTION = "Current action",
        FLYABLE_AREA = "Flyable area",
        YES = "yes",
        NO = "no",
        NOT_SET = "not set",
        MISSING = "missing from bags",
        PRESENT = "in bags",
        UNUSABLE = "not usable",
        SLOT_HINT = "Right-click a slot to clear it.",
        WRONG_GROUND_SLOT = "That looks like a flying mount. Put it in the flying slot.",
        WRONG_FLYING_SLOT = "That does not look like a flying mount.",
        SET_GROUND = "Ground mount set to %s.",
        SET_FLYING = "Flying mount set to %s.",
        CLEARED_GROUND = "Ground mount cleared.",
        CLEARED_FLYING = "Flying mount cleared.",
        NO_CURSOR_ITEM = "Hold a mount item on the cursor first.",
        DRUID_ON = "Druid travel forms enabled.",
        DRUID_OFF = "Druid travel forms disabled.",
        BINDING_SET = "Smart Travel bound to %s.",
        BINDING_CLEARED = "Smart Travel keybind cleared.",
        BINDING_CANCELLED = "Keybind capture cancelled.",
        BINDING_FAILED = "Could not set keybind.",
        BINDING_COMBAT = "Cannot change keybinds in combat.",
        UPDATED = "Secure travel action updated.",
        UPDATE_DEFERRED = "In combat; secure action will update after combat.",
        NO_ACTION = "No travel action is configured for this situation.",
    },
    ptBR = {
        LOADED = "carregado. Use /ride para abrir as opcoes.",
        HELP_HEADER = "Comandos do RIDE:",
        HELP_OPEN = "/ride - abrir opcoes",
        HELP_STATUS = "/ride status - mostrar configuracao atual",
        HELP_GROUND = "/ride ground <link ou nome do item> - definir montaria terrestre",
        HELP_FLYING = "/ride flying <link ou nome do item> - definir montaria voadora",
        HELP_CURSOR = "/ride ground ou /ride flying segurando um item no cursor - definir pelo cursor",
        HELP_CLEAR = "/ride clear ground|flying - limpar uma montaria",
        HELP_DRUID = "/ride druid - alternar formas de viagem do druida",
        HELP_BIND = "/ride bind <tecla> - definir a tecla, ex: /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - limpar a tecla do Smart Travel",
        HELP_UPDATE = "/ride update - reconstruir a acao segura",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Montaria terrestre",
        FLYING_MOUNT = "Montaria voadora",
        MOUNT_HINT = "Arraste o item da montaria da bag para um slot, ou pegue o item e clique no slot.",
        SLOT_EMPTY = "+",
        CLEAR = "Limpar",
        DRUID_FORMS = "Usar formas de viagem do druida",
        DRUID_AQUATIC = "Usar Forma Aquatica ao nadar",
        DRUID_FLIGHT = "Usar Forma de Voo em areas voaveis",
        DRUID_TRAVEL = "Usar Forma de Viagem em terra",
        PREVENT_FLYING_DISMOUNT = "Prevenir desmontar enquanto voa",
        SET_BINDING = "Definir tecla",
        CLEAR_BINDING = "Limpar tecla",
        REFRESH = "Atualizar",
        STATUS = "Status",
        KEYBIND = "Tecla",
        KEYBIND_CAPTURE = "Pressione uma tecla para o Smart Travel do RIDE. Pressione Esc para cancelar.",
        CURRENT_ACTION = "Acao atual",
        FLYABLE_AREA = "Area voavel",
        YES = "sim",
        NO = "nao",
        NOT_SET = "nao definido",
        MISSING = "fora das bags",
        PRESENT = "nas bags",
        UNUSABLE = "nao usavel",
        SLOT_HINT = "Clique direito em um slot para limpar.",
        WRONG_GROUND_SLOT = "Isso parece uma montaria voadora. Coloque no slot voador.",
        WRONG_FLYING_SLOT = "Isso nao parece uma montaria voadora.",
        SET_GROUND = "Montaria terrestre definida: %s.",
        SET_FLYING = "Montaria voadora definida: %s.",
        CLEARED_GROUND = "Montaria terrestre limpa.",
        CLEARED_FLYING = "Montaria voadora limpa.",
        NO_CURSOR_ITEM = "Segure um item de montaria no cursor primeiro.",
        DRUID_ON = "Formas de viagem do druida ativadas.",
        DRUID_OFF = "Formas de viagem do druida desativadas.",
        BINDING_SET = "Smart Travel definido em %s.",
        BINDING_CLEARED = "Tecla do Smart Travel limpa.",
        BINDING_CANCELLED = "Captura de tecla cancelada.",
        BINDING_FAILED = "Nao foi possivel definir a tecla.",
        BINDING_COMBAT = "Nao e possivel alterar keybinds em combate.",
        UPDATED = "Acao segura de viagem atualizada.",
        UPDATE_DEFERRED = "Em combate; a acao segura sera atualizada depois do combate.",
        NO_ACTION = "Nenhuma acao de viagem configurada para esta situacao.",
    },
}

local L = LOCALES[LOCALE] or LOCALES.enUS

local DEFAULT_DB = {
    version = 1,
    ground = {
        name = "",
        itemID = nil,
        link = "",
        icon = nil,
    },
    flying = {
        name = "",
        itemID = nil,
        link = "",
        icon = nil,
    },
    useDruidForms = true,
    useDruidAquatic = true,
    useDruidFlight = true,
    useDruidTravel = true,
    dismount = false,
    preventDismountFlying = true,
}

local DRUID_SPELLS = {
    aquatic = 1066,
    travel = 783,
    flight = 33943,
    swiftFlight = 40120,
}

local ICONS = {
    preventDismount = "Interface\\Icons\\Ability_Mount_Gryphon_01",
}

local OUTLAND_MAPS = {
    [100] = true, -- Hellfire Peninsula
    [101] = true, -- Outland on some clients
    [102] = true, -- Zangarmarsh
    [104] = true, -- Shadowmoon Valley
    [105] = true, -- Blade's Edge Mountains
    [107] = true, -- Nagrand
    [108] = true, -- Terokkar Forest
    [109] = true, -- Netherstorm
    [111] = true, -- Shattrath City
    [1945] = true, -- Outland on Anniversary clients
}

local db
local optionsPanel
local settingsCategory
local statusLines = {}
local pendingSecureUpdate
local pendingBindingOverride
local lastActionText = ""
local lastMacroText = ""
local bindingCaptureFrame

local playerClass
local isDruid

local BINDING_COMMAND = "CLICK RIDEButton:LeftButton"
local VISIBLE_BINDING_COMMAND = "RIDE_SMART_TRAVEL"
local CreateText
local CreateButton

local function CopyDefaults(source)
    local copy = {}
    for key, value in pairs(source) do
        if type(value) == "table" then
            copy[key] = CopyDefaults(value)
        else
            copy[key] = value
        end
    end
    return copy
end

local function MergeDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if type(value) == "table" then
            if type(target[key]) ~= "table" then
                target[key] = CopyDefaults(value)
            else
                MergeDefaults(target[key], value)
            end
        elseif type(target[key]) ~= type(value) then
            target[key] = value
        end
    end
end

local function EnsureDb()
    if type(RIDEDB) ~= "table" then
        RIDEDB = CopyDefaults(DEFAULT_DB)
    else
        MergeDefaults(RIDEDB, DEFAULT_DB)
    end
    db = RIDEDB
end

local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff66ccffRIDE:|r " .. tostring(message))
end

local function Trim(text)
    text = tostring(text or "")
    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    return text
end

local function ExtractItemID(link)
    if type(link) ~= "string" then
        return nil
    end
    return tonumber(link:match("item:(%d+)"))
end

local function ExtractItemName(text)
    if type(text) ~= "string" then
        return ""
    end
    return text:match("|Hitem:.-|h%[(.-)%]|h") or text:match("%[(.-)%]") or text
end

local function NormalizeMountInput(text)
    text = Trim(text)
    if text == "" then
        return "", nil, ""
    end

    local link = text:match("(|c%x+|Hitem:.-|h%[.-%]|h|r)") or text:match("(|Hitem:.-|h%[.-%]|h)")
    local itemID = ExtractItemID(link or text)
    local name = ""

    if link and GetItemInfo then
        name = GetItemInfo(link) or ExtractItemName(link)
    else
        name = ExtractItemName(text)
    end

    return Trim(name), itemID, link or ""
end

local function GetItemTextureFromMount(name, itemID, link)
    if GetItemIcon and (itemID or link or name) then
        return GetItemIcon(itemID or link or name)
    end

    if GetItemInfo then
        return select(10, GetItemInfo(link or itemID or name))
    end

    return nil
end

local StoreMount

local scanTooltip
local scanTooltipLines = {}

local function EnsureScanTooltip()
    if scanTooltip then
        return scanTooltip
    end

    local tooltipName = "RIDEScanTooltip"
    scanTooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
    scanTooltip:SetOwner(UIParent, "ANCHOR_NONE")

    for i = 1, 12 do
        scanTooltipLines[i] = _G[tooltipName .. "TextLeft" .. i]
    end

    return scanTooltip
end

local function ScanTooltipText(itemRef)
    if not itemRef then
        return ""
    end

    local tooltip = EnsureScanTooltip()
    tooltip:ClearLines()
    if type(itemRef) == "string" and itemRef:find("item:") then
        tooltip:SetHyperlink(itemRef)
    elseif tooltip.SetItemByID then
        tooltip:SetItemByID(itemRef)
    else
        tooltip:SetHyperlink("item:" .. tostring(itemRef))
    end

    local text = ""
    for i = 1, #scanTooltipLines do
        local line = scanTooltipLines[i]
        if line and line:GetText() then
            text = text .. "\n" .. line:GetText()
        end
    end

    return text:lower()
end

local function IsFlyingMountItem(itemRef, itemName)
    local tooltipText = ScanTooltipText(itemRef)
    if tooltipText ~= "" then
        if tooltipText:find("300") or tooltipText:find("225")
            or tooltipText:find("expert riding")
            or tooltipText:find("artisan riding")
            or tooltipText:find("perito")
            or tooltipText:find("artes") then
            return true
        end

        if tooltipText:find("150") or tooltipText:find("75") then
            return false
        end
    end

    itemName = (itemName or ""):lower()
    if itemName:find("gryphon") or itemName:find("wind rider") or itemName:find("nether")
        or itemName:find("ray") or itemName:find("hippogryph") or itemName:find("phoenix")
        or itemName:find("gyrocopter") or itemName:find("flying") then
        return true
    end

    return false
end

local function ValidateMountForSlot(kind, itemRef, itemName)
    local isFlyingMount = IsFlyingMountItem(itemRef, itemName)

    if kind == "flying" and not isFlyingMount then
        Print(L.WRONG_FLYING_SLOT)
        return false
    end

    if kind == "ground" and isFlyingMount then
        Print(L.WRONG_GROUND_SLOT)
        return false
    end

    return true
end

local function ClearInvalidSlotMounts()
    if not db then
        return
    end

    if db.ground and db.ground.name and db.ground.name ~= ""
        and IsFlyingMountItem(db.ground.link ~= "" and db.ground.link or db.ground.itemID or db.ground.name, db.ground.name) then
        StoreMount("ground", "", nil, "")
    end

    if db.flying and db.flying.name and db.flying.name ~= ""
        and not IsFlyingMountItem(db.flying.link ~= "" and db.flying.link or db.flying.itemID or db.flying.name, db.flying.name) then
        StoreMount("flying", "", nil, "")
    end
end

function StoreMount(kind, name, itemID, link)
    db[kind].name = name or ""
    db[kind].itemID = itemID
    db[kind].link = link or ""
    db[kind].icon = GetItemTextureFromMount(name, itemID, link)
end

local function GetContainerSlotLink(bag, slot)
    if C_Container and C_Container.GetContainerItemLink then
        return C_Container.GetContainerItemLink(bag, slot)
    end
    if GetContainerItemLink then
        return GetContainerItemLink(bag, slot)
    end
    return nil
end

local function GetContainerSlots(bag)
    if C_Container and C_Container.GetContainerNumSlots then
        return C_Container.GetContainerNumSlots(bag) or 0
    end
    if GetContainerNumSlots then
        return GetContainerNumSlots(bag) or 0
    end
    return 0
end

local function IsMountInBags(mount)
    if type(mount) ~= "table" or not mount.name or mount.name == "" then
        return false
    end

    for bag = 0, NUM_BAG_SLOTS or 4 do
        for slot = 1, GetContainerSlots(bag) do
            local link = GetContainerSlotLink(bag, slot)
            if link then
                local itemID = ExtractItemID(link)
                if mount.itemID and itemID == mount.itemID then
                    return true
                end
                local itemName = GetItemInfo and GetItemInfo(link)
                if itemName and itemName == mount.name then
                    return true
                end
            end
        end
    end

    return false
end

local function GetMountItemRef(mount)
    if type(mount) ~= "table" then
        return nil
    end
    return mount.itemID or mount.name
end

local function IsMountUsable(mount)
    if type(mount) ~= "table" or not mount.name or mount.name == "" then
        return false, L.NOT_SET
    end

    if not IsMountInBags(mount) then
        return false, L.MISSING
    end

    if IsUsableItem then
        local usable = IsUsableItem(GetMountItemRef(mount))
        if usable == false then
            return false, L.UNUSABLE
        end
    end

    return true, L.PRESENT
end

local function IsMountConfiguredAndInBags(mount)
    return type(mount) == "table"
        and mount.name
        and mount.name ~= ""
        and IsMountInBags(mount)
end

local function IsSpellKnownByID(spellID)
    if not spellID then
        return false
    end

    if IsSpellKnown and IsSpellKnown(spellID) then
        return true
    end

    if IsPlayerSpell and IsPlayerSpell(spellID) then
        return true
    end

    local spellName = GetSpellInfo and GetSpellInfo(spellID)
    if not spellName or not GetNumSpellTabs or not GetSpellTabInfo or not GetSpellBookItemName then
        return false
    end

    for tab = 1, GetNumSpellTabs() do
        local _, _, offset, numSlots = GetSpellTabInfo(tab)
        for index = (offset or 0) + 1, (offset or 0) + (numSlots or 0) do
            local bookName = GetSpellBookItemName(index, BOOKTYPE_SPELL)
            if bookName == spellName then
                return true
            end
        end
    end

    return false
end

local function GetKnownSpellName(spellID)
    if IsSpellKnownByID(spellID) and GetSpellInfo then
        return GetSpellInfo(spellID)
    end
    return nil
end

local function GetBestFlightForm()
    return GetKnownSpellName(DRUID_SPELLS.swiftFlight) or GetKnownSpellName(DRUID_SPELLS.flight)
end

local function IsInRestrictedInstance()
    if IsInInstance then
        local inInstance, instanceType = IsInInstance()
        if inInstance and instanceType and instanceType ~= "none" then
            return true
        end
    end

    if GetInstanceInfo then
        local _, instanceType = GetInstanceInfo()
        if instanceType and instanceType ~= "none" then
            return true
        end
    end

    return false
end

local function GetInstanceMapID()
    if not GetInstanceInfo then
        return nil
    end
    local _, _, _, _, _, _, _, mapID = GetInstanceInfo()
    return mapID
end

function RIDE:IsFlyableArea()
    if IsInRestrictedInstance() then
        return false
    end

    local instanceMapID = GetInstanceMapID()
    if instanceMapID == 530 then
        return true
    end

    if C_Map and C_Map.GetBestMapForUnit then
        local mapID = C_Map.GetBestMapForUnit("player")
        local safety = 0

        while mapID and safety < 12 do
            if OUTLAND_MAPS[mapID] then
                return true
            end

            if not C_Map.GetMapInfo then
                break
            end

            local info = C_Map.GetMapInfo(mapID)
            mapID = info and info.parentMapID
            safety = safety + 1
        end
    end

    if GetCurrentMapContinent then
        local continent = GetCurrentMapContinent()
        if continent == 3 then
            return true
        end
    end

    return false
end

local function AddLine(lines, line)
    if line and line ~= "" then
        lines[#lines + 1] = line
    end
end

local function EscapeMacroArg(text)
    return tostring(text or ""):gsub("\n", " ")
end

local function BuildMacro()
    local lines = {}
    local actionText = L.NO_ACTION

    if db.preventDismountFlying then
        AddLine(lines, "/stopmacro [flying]")
    end
    AddLine(lines, "/dismount [mounted]")

    if isDruid and db.useDruidAquatic then
        local aquaticName = GetKnownSpellName(DRUID_SPELLS.aquatic)
        if aquaticName then
            AddLine(lines, "/cast [swimming] " .. aquaticName)
            AddLine(lines, "/stopmacro [swimming]")
        end
    end

    if RIDE:IsFlyableArea() then
        if isDruid and db.useDruidFlight then
            local travelName = db.useDruidTravel and GetKnownSpellName(DRUID_SPELLS.travel)
            if travelName then
                AddLine(lines, "/cast [combat,outdoors] " .. travelName)
                AddLine(lines, "/stopmacro [combat]")
            end

            local flightName = GetBestFlightForm()
            if flightName then
                AddLine(lines, "/cast [outdoors,nomounted] " .. flightName)
                actionText = flightName
                return table.concat(lines, "\n"), actionText
            end
        end

        if IsMountConfiguredAndInBags(db.flying) then
            AddLine(lines, "/use [nomounted] " .. EscapeMacroArg(db.flying.name))
            actionText = db.flying.name
            return table.concat(lines, "\n"), actionText
        end
    end

    if isDruid and db.useDruidTravel then
        local travelName = GetKnownSpellName(DRUID_SPELLS.travel)
        if travelName then
            AddLine(lines, "/cast [outdoors,nomounted] " .. travelName)
            actionText = travelName
            return table.concat(lines, "\n"), actionText
        end
    end

    if IsMountConfiguredAndInBags(db.ground) then
        AddLine(lines, "/use [nomounted] " .. EscapeMacroArg(db.ground.name))
        actionText = db.ground.name
        return table.concat(lines, "\n"), actionText
    end

    AddLine(lines, "/run RIDE:NoActionFeedback()")
    return table.concat(lines, "\n"), actionText
end

local secureButton = CreateFrame("Button", "RIDEButton", UIParent, "SecureActionButtonTemplate")
secureButton:SetSize(1, 1)
secureButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -20, 20)
secureButton:SetAlpha(0)
secureButton:RegisterForClicks("AnyUp", "AnyDown")
secureButton:SetAttribute("type", "macro")
secureButton:SetAttribute("macrotext", "")
secureButton:Show()

function RIDE:NoActionFeedback()
    Print(L.NO_ACTION)
end

local function GetBindingSet()
    if GetCurrentBindingSet then
        return GetCurrentBindingSet()
    end
    return 2
end

local function GetSmartTravelKey()
    if GetBindingKey then
        local key1, key2 = GetBindingKey(BINDING_COMMAND)
        if key1 or key2 then
            return key1, key2
        end
        return GetBindingKey(VISIBLE_BINDING_COMMAND)
    end
    return nil
end

local function SaveBindingSet()
    if SaveBindings then
        SaveBindings(GetBindingSet())
    end
end

local function NormalizeKey(key)
    key = Trim(key):upper()
    key = key:gsub("%s+", "")
    key = key:gsub("MIDDLEBUTTON", "BUTTON3")
    key = key:gsub("BUTTON3", "BUTTON3")
    key = key:gsub("BUTTON4", "BUTTON4")
    key = key:gsub("BUTTON5", "BUTTON5")
    key = key:gsub("MOUSEWHEELUP", "MOUSEWHEELUP")
    key = key:gsub("MOUSEWHEELDOWN", "MOUSEWHEELDOWN")
    key = key:gsub("CTRL%-", "CTRL-")
    key = key:gsub("CONTROL%-", "CTRL-")
    key = key:gsub("SHIFT%-", "SHIFT-")
    key = key:gsub("ALT%-", "ALT-")
    return key
end

local BUTTON_BINDINGS = {
    LeftButton = "BUTTON1",
    RightButton = "BUTTON2",
    MiddleButton = "BUTTON3",
    Button4 = "BUTTON4",
    Button5 = "BUTTON5",
}

local function BuildKeyFromInput(key)
    key = tostring(key or "")
    if key == "" then
        return ""
    end

    key = BUTTON_BINDINGS[key] or key
    local upper = key:upper()
    if upper == "LSHIFT" or upper == "RSHIFT" or upper == "LCTRL" or upper == "RCTRL"
        or upper == "LALT" or upper == "RALT" or upper == "UNKNOWN" then
        return ""
    end

    local prefix = ""
    if IsControlKeyDown and IsControlKeyDown() then
        prefix = prefix .. "CTRL-"
    end
    if IsAltKeyDown and IsAltKeyDown() then
        prefix = prefix .. "ALT-"
    end
    if IsShiftKeyDown and IsShiftKeyDown() then
        prefix = prefix .. "SHIFT-"
    end

    return NormalizeKey(prefix .. upper)
end

function RIDE:SetSmartTravelBinding(key)
    if InCombatLockdown and InCombatLockdown() then
        Print(L.BINDING_COMBAT)
        return false
    end

    key = NormalizeKey(key)
    if key == "" then
        return false
    end

    if SetBinding then
        SetBinding(key)
    end

    if SetBindingClick and SetBindingClick(key, "RIDEButton", "LeftButton") then
        SaveBindingSet()
        Print(string.format(L.BINDING_SET, key))
        self:RefreshOptions()
        return true
    end

    Print(L.BINDING_FAILED)
    return false
end

function RIDE:ClearSmartTravelBinding()
    if InCombatLockdown and InCombatLockdown() then
        Print(L.BINDING_COMBAT)
        return false
    end

    local key1, key2 = GetSmartTravelKey()
    if key1 and SetBinding then
        SetBinding(key1)
    end
    if key2 and SetBinding then
        SetBinding(key2)
    end
    key1, key2 = GetBindingKey and GetBindingKey(VISIBLE_BINDING_COMMAND)
    if key1 and SetBinding then
        SetBinding(key1)
    end
    if key2 and SetBinding then
        SetBinding(key2)
    end
    SaveBindingSet()
    if ClearOverrideBindings then
        ClearOverrideBindings(self)
    end
    Print(L.BINDING_CLEARED)
    self:RefreshOptions()
    return true
end

function RIDE:ApplyVisibleBindingOverride()
    if InCombatLockdown and InCombatLockdown() then
        pendingBindingOverride = true
        return
    end

    pendingBindingOverride = nil

    if not ClearOverrideBindings or not SetOverrideBindingClick or not GetBindingKey then
        return
    end

    ClearOverrideBindings(self)

    local key1, key2 = GetBindingKey(VISIBLE_BINDING_COMMAND)
    if key1 then
        SetOverrideBindingClick(self, false, key1, "RIDEButton", "LeftButton")
    end
    if key2 then
        SetOverrideBindingClick(self, false, key2, "RIDEButton", "LeftButton")
    end

    self:RefreshOptions()
end

function RIDE:StopBindingCapture(cancelled)
    if bindingCaptureFrame then
        bindingCaptureFrame:Hide()
    end
    if cancelled then
        Print(L.BINDING_CANCELLED)
    end
end

function RIDE:StartBindingCapture()
    if InCombatLockdown and InCombatLockdown() then
        Print(L.BINDING_COMBAT)
        return
    end

    if not bindingCaptureFrame then
        local ok, frame = pcall(CreateFrame, "Frame", "RIDEBindingCaptureFrame", UIParent, "BackdropTemplate")
        if not ok or not frame then
            ok, frame = pcall(CreateFrame, "Frame", "RIDEBindingCaptureFrame", UIParent, "BasicFrameTemplateWithInset")
        end
        if not ok or not frame then
            frame = CreateFrame("Frame", "RIDEBindingCaptureFrame", UIParent)
        end

        frame:SetSize(470, 130)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("FULLSCREEN_DIALOG")
        frame:SetFrameLevel(900)
        frame:SetToplevel(true)
        frame:EnableMouse(true)
        frame:EnableKeyboard(true)
        if frame.EnableMouseWheel then
            frame:EnableMouseWheel(true)
        end
        if frame.SetPropagateKeyboardInput then
            frame:SetPropagateKeyboardInput(false)
        end

        if frame.SetBackdrop then
            frame:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 32,
                insets = { left = 11, right = 12, top = 12, bottom = 11 },
            })
            frame:SetBackdropColor(0, 0, 0, 0.94)
            frame:SetBackdropBorderColor(0.65, 0.55, 0.35, 1)
        end

        local title = CreateText(frame, L.SET_BINDING, "GameFontNormal")
        title:SetPoint("TOP", frame, "TOP", 0, -20)
        title:SetJustifyH("CENTER")
        frame.title = title

        local text = CreateText(frame, L.KEYBIND_CAPTURE, "GameFontHighlight")
        text:SetPoint("TOP", frame, "TOP", 0, -48)
        text:SetWidth(410)
        text:SetJustifyH("CENTER")
        frame.text = text

        local cancel = CreateButton(frame, CANCEL or "Cancel", 90)
        cancel:SetPoint("BOTTOM", frame, "BOTTOM", 0, 20)
        cancel:SetScript("OnClick", function()
            RIDE:StopBindingCapture(true)
        end)

        frame:SetScript("OnKeyDown", function(_, key)
            if key == "ESCAPE" then
                RIDE:StopBindingCapture(true)
                return
            end

            local binding = BuildKeyFromInput(key)
            if binding ~= "" then
                RIDE:SetSmartTravelBinding(binding)
                RIDE:StopBindingCapture(false)
            end
        end)

        frame:SetScript("OnMouseDown", function(_, button)
            local binding = BuildKeyFromInput(button)
            if binding ~= "" then
                RIDE:SetSmartTravelBinding(binding)
                RIDE:StopBindingCapture(false)
            end
        end)

        frame:SetScript("OnMouseWheel", function(_, delta)
            local binding = BuildKeyFromInput(delta and delta > 0 and "MOUSEWHEELUP" or "MOUSEWHEELDOWN")
            if binding ~= "" then
                RIDE:SetSmartTravelBinding(binding)
                RIDE:StopBindingCapture(false)
            end
        end)

        bindingCaptureFrame = frame
    end

    if bindingCaptureFrame.text then
        bindingCaptureFrame.text:SetText(L.KEYBIND_CAPTURE)
    end
    bindingCaptureFrame:Show()
end

function RIDE:UpdateSecureAction(silent)
    if InCombatLockdown and InCombatLockdown() then
        pendingSecureUpdate = true
        if not silent then
            Print(L.UPDATE_DEFERRED)
        end
        return
    end

    ClearInvalidSlotMounts()

    local macroText, actionText = BuildMacro()
    secureButton:SetAttribute("type", "macro")
    secureButton:SetAttribute("macrotext", macroText)
    lastMacroText = macroText
    lastActionText = actionText
    pendingSecureUpdate = nil

    self:RefreshOptions()

    if not silent then
        Print(L.UPDATED)
    end
end

function RIDE:ActivateFromBinding()
    secureButton:Click("LeftButton")
end

function RIDE:SetMount(kind, input)
    local name, itemID, link = NormalizeMountInput(input)
    if name == "" then
        return false
    end

    if not ValidateMountForSlot(kind, link or itemID or name, name) then
        return false
    end

    StoreMount(kind, name, itemID, link)
    self:UpdateSecureAction()

    if kind == "ground" then
        Print(string.format(L.SET_GROUND, name))
    else
        Print(string.format(L.SET_FLYING, name))
    end

    self:RefreshOptions()
    return true
end

function RIDE:SetMountFromCursor(kind)
    local cursorType, value1, value2 = GetCursorInfo()
    if cursorType ~= "item" then
        Print(L.NO_CURSOR_ITEM)
        return
    end

    local link = type(value1) == "string" and value1 or type(value2) == "string" and value2 or nil
    local itemID = tonumber(value1) or tonumber(value2) or ExtractItemID(link)
    local itemRef = link or itemID
    local name = GetItemInfo and GetItemInfo(itemRef) or ExtractItemName(link)
    if not name or name == "" then
        Print(L.NO_CURSOR_ITEM)
        return
    end

    if not ValidateMountForSlot(kind, itemRef, name) then
        return
    end

    StoreMount(kind, name, itemID, link or "")
    ClearCursor()
    self:UpdateSecureAction()

    if kind == "ground" then
        Print(string.format(L.SET_GROUND, name))
    else
        Print(string.format(L.SET_FLYING, name))
    end

    self:RefreshOptions()
end

function RIDE:ClearMount(kind)
    StoreMount(kind, "", nil, "")
    self:UpdateSecureAction()

    if kind == "ground" then
        Print(L.CLEARED_GROUND)
    else
        Print(L.CLEARED_FLYING)
    end

    self:RefreshOptions()
end

local function FormatMountStatus(mount)
    if not mount or not mount.name or mount.name == "" then
        return L.NOT_SET
    end

    local _, bagStatus = IsMountUsable(mount)
    return mount.name .. " (" .. bagStatus .. ")"
end

function RIDE:GetStatusText()
    local flyable = self:IsFlyableArea() and L.YES or L.NO
    local lines = {
        L.FLYABLE_AREA .. ": " .. flyable,
        L.KEYBIND .. ": " .. (GetSmartTravelKey() or L.NOT_SET),
        L.GROUND_MOUNT .. ": " .. FormatMountStatus(db.ground),
        L.FLYING_MOUNT .. ": " .. FormatMountStatus(db.flying),
        L.CURRENT_ACTION .. ": " .. (lastActionText or L.NO_ACTION),
    }

    if isDruid then
        lines[#lines + 1] = L.DRUID_AQUATIC .. ": " .. (db.useDruidAquatic and L.YES or L.NO)
        lines[#lines + 1] = L.DRUID_FLIGHT .. ": " .. (db.useDruidFlight and L.YES or L.NO)
        lines[#lines + 1] = L.DRUID_TRAVEL .. ": " .. (db.useDruidTravel and L.YES or L.NO)
    end

    return table.concat(lines, "\n")
end

function RIDE:PrintStatus()
    Print(L.STATUS)
    for line in string.gmatch(self:GetStatusText(), "[^\n]+") do
        Print(line)
    end
end

function CreateText(parent, text, template)
    local label = parent:CreateFontString(nil, "ARTWORK", template or "GameFontHighlight")
    label:SetText(text)
    label:SetJustifyH("LEFT")
    return label
end

function CreateButton(parent, text, width)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetSize(width or 120, 24)
    button:SetText(text)
    return button
end

local optionCheckIndex = 0

local function CreateCheckbox(parent, text, tooltip, getter, setter, icon)
    optionCheckIndex = optionCheckIndex + 1
    local check = CreateFrame("CheckButton", "RIDEOptionCheck" .. optionCheckIndex, parent, "InterfaceOptionsCheckButtonTemplate")
    local label = check.Text or _G[check:GetName() .. "Text"]
    if label then
        label:SetText(text)
        check.label = label
        if icon then
            label:ClearAllPoints()
            label:SetPoint("LEFT", check, "RIGHT", 24, 0)
        end
    end

    if icon then
        local texture = check:CreateTexture(nil, "ARTWORK")
        texture:SetSize(18, 18)
        texture:SetPoint("LEFT", check, "RIGHT", 3, 0)
        texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        texture:SetTexture(icon)
        check.icon = texture
    end

    check.tooltipText = tooltip or text
    check:SetScript("OnClick", function(self)
        setter(self:GetChecked() and true or false)
        RIDE:UpdateSecureAction(true)
        RIDE:RefreshOptions()
    end)
    check.Refresh = function(self)
        self:SetChecked(getter() and true or false)
    end
    return check
end

local function SetSlotBackdrop(frame, filled)
    if not frame.SetBackdrop then
        return
    end

    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    frame:SetBackdropColor(0, 0, 0, filled and 0.82 or 0.42)
    frame:SetBackdropBorderColor(filled and 0.85 or 0.45, filled and 0.72 or 0.45, filled and 0.35 or 0.45, 1)
end

local function RefreshMountSlot(slot)
    if not slot or not db then
        return
    end

    local mount = db[slot.rideMountKind]
    local hasMount = mount and mount.name and mount.name ~= ""
    local icon = hasMount and (mount.icon or GetItemTextureFromMount(mount.name, mount.itemID, mount.link))

    if hasMount and icon then
        slot.icon:SetTexture(icon)
        slot.icon:Show()
        slot.emptyText:Hide()
    else
        slot.icon:SetTexture(nil)
        slot.icon:Hide()
        slot.emptyText:Show()
    end

    SetSlotBackdrop(slot, hasMount)
end

local function CreateMountSlot(parent, kind)
    local ok, slot = pcall(CreateFrame, "Button", nil, parent, "BackdropTemplate")
    if not ok or not slot then
        slot = CreateFrame("Button", nil, parent)
    end

    slot.rideMountKind = kind
    slot:SetSize(54, 54)
    slot:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    slot:EnableMouse(true)

    local icon = slot:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", slot, "TOPLEFT", 5, -5)
    icon:SetPoint("BOTTOMRIGHT", slot, "BOTTOMRIGHT", -5, 5)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    slot.icon = icon

    local emptyText = slot:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    emptyText:SetPoint("CENTER", slot, "CENTER", 0, 0)
    emptyText:SetWidth(46)
    emptyText:SetJustifyH("CENTER")
    emptyText:SetText(L.SLOT_EMPTY)
    slot.emptyText = emptyText

    slot:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            RIDE:ClearMount(self.rideMountKind)
            return
        end

        local cursorType = GetCursorInfo and GetCursorInfo()
        if cursorType == "item" then
            RIDE:SetMountFromCursor(self.rideMountKind)
        end
    end)

    slot:SetScript("OnReceiveDrag", function(self)
        RIDE:SetMountFromCursor(self.rideMountKind)
    end)

    slot:SetScript("OnEnter", function(self)
        local mount = db and db[self.rideMountKind]
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if mount and mount.link and mount.link ~= "" then
            GameTooltip:SetHyperlink(mount.link)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(L.SLOT_HINT, 0.8, 0.8, 0.8, true)
        elseif mount and mount.name and mount.name ~= "" then
            GameTooltip:SetText(mount.name)
            GameTooltip:AddLine(L.SLOT_HINT, 0.8, 0.8, 0.8, true)
        else
            GameTooltip:SetText(L.SLOT_EMPTY)
            GameTooltip:AddLine(L.MOUNT_HINT, 0.8, 0.8, 0.8, true)
        end
        GameTooltip:Show()
    end)

    slot:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    RefreshMountSlot(slot)
    return slot
end

local function RefreshMountSlots()
    if not optionsPanel then
        return
    end

    RefreshMountSlot(optionsPanel.groundSlot)
    RefreshMountSlot(optionsPanel.flyingSlot)
end

local function CreateOptionsPanel()
    if optionsPanel then
        return optionsPanel
    end

    local panel = CreateFrame("Frame", "RIDEOptionsPanel", UIParent)
    panel.name = L.OPTIONS_TITLE

    local title = CreateText(panel, L.OPTIONS_TITLE, "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)

    local desc = CreateText(panel, L.OPTIONS_DESC, "GameFontHighlightSmall")
    desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

    local hint = CreateText(panel, L.MOUNT_HINT, "GameFontHighlightSmall")
    hint:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -14)
    hint:SetWidth(560)

    local slotHint = CreateText(panel, L.SLOT_HINT, "GameFontHighlightSmall")
    slotHint:SetPoint("TOPLEFT", hint, "BOTTOMLEFT", 0, -4)
    slotHint:SetWidth(560)

    local y = -104

    local groundLabel = CreateText(panel, L.GROUND_MOUNT, "GameFontNormal")
    groundLabel:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, y)

    local groundSlot = CreateMountSlot(panel, "ground")
    groundSlot:SetPoint("TOPLEFT", groundLabel, "BOTTOMLEFT", 0, -8)
    panel.groundSlot = groundSlot

    local flyingLabel = CreateText(panel, L.FLYING_MOUNT, "GameFontNormal")
    flyingLabel:SetPoint("TOPLEFT", groundLabel, "TOPLEFT", 110, 0)

    local flyingSlot = CreateMountSlot(panel, "flying")
    flyingSlot:SetPoint("TOPLEFT", flyingLabel, "BOTTOMLEFT", 0, -8)
    panel.flyingSlot = flyingSlot

    y = y - 88

    panel.druidAquatic = CreateCheckbox(panel, L.DRUID_AQUATIC, nil,
        function() return db.useDruidAquatic end,
        function(value) db.useDruidAquatic = value end,
        select(3, GetSpellInfo(DRUID_SPELLS.aquatic)))
    panel.druidAquatic:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, y)

    panel.druidFlight = CreateCheckbox(panel, L.DRUID_FLIGHT, nil,
        function() return db.useDruidFlight end,
        function(value) db.useDruidFlight = value end,
        select(3, GetSpellInfo(DRUID_SPELLS.flight)))
    panel.druidFlight:SetPoint("TOPLEFT", panel.druidAquatic, "BOTTOMLEFT", 0, -8)

    panel.druidTravel = CreateCheckbox(panel, L.DRUID_TRAVEL, nil,
        function() return db.useDruidTravel end,
        function(value) db.useDruidTravel = value end,
        select(3, GetSpellInfo(DRUID_SPELLS.travel)))
    panel.druidTravel:SetPoint("TOPLEFT", panel.druidFlight, "BOTTOMLEFT", 0, -8)

    panel.preventDismountFlying = CreateCheckbox(panel, L.PREVENT_FLYING_DISMOUNT, nil,
        function() return db.preventDismountFlying end,
        function(value) db.preventDismountFlying = value end,
        ICONS.preventDismount)
    panel.preventDismountFlying:SetPoint("TOPLEFT", panel.druidTravel, "BOTTOMLEFT", 0, -8)

    local bindingsButton = CreateButton(panel, L.SET_BINDING, 150)
    bindingsButton:SetPoint("TOPLEFT", panel.preventDismountFlying, "BOTTOMLEFT", 0, -20)
    bindingsButton:SetScript("OnClick", function()
        RIDE:StartBindingCapture()
    end)

    local clearBindingButton = CreateButton(panel, L.CLEAR_BINDING, 110)
    clearBindingButton:SetPoint("LEFT", bindingsButton, "RIGHT", 8, 0)
    clearBindingButton:SetScript("OnClick", function()
        RIDE:ClearSmartTravelBinding()
    end)

    local refreshButton = CreateButton(panel, L.REFRESH, 100)
    refreshButton:SetPoint("LEFT", clearBindingButton, "RIGHT", 8, 0)
    refreshButton:SetScript("OnClick", function()
        RIDE:UpdateSecureAction()
    end)

    local statusLabel = CreateText(panel, L.STATUS, "GameFontNormal")
    statusLabel:SetPoint("TOPLEFT", bindingsButton, "BOTTOMLEFT", 0, -24)

    local statusPanel = CreateFrame("Frame", nil, panel)
    statusPanel:SetPoint("TOPLEFT", statusLabel, "BOTTOMLEFT", 0, -8)
    statusPanel:SetSize(560, 160)
    panel.statusPanel = statusPanel

    for i = 1, 10 do
        local line = CreateText(statusPanel, "", "GameFontHighlight")
        line:SetPoint("TOPLEFT", statusPanel, "TOPLEFT", 0, -((i - 1) * 18))
        line:SetWidth(560)
        line:SetHeight(17)
        local font, _, flags = GameFontHighlight:GetFont()
        line:SetFont(font, 12, flags)
        statusLines[i] = line
    end

    optionsPanel = panel
    panel:SetScript("OnShow", function()
        RIDE:RefreshOptions()
    end)
    RIDE:RefreshOptions()
    return optionsPanel
end

local function RegisterInterfaceOptions()
    local panel = CreateOptionsPanel()

    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        settingsCategory = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(settingsCategory)
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end

function RIDE:RefreshOptions()
    if not optionsPanel or not db then
        return
    end

    RefreshMountSlots()

    if optionsPanel.druidForms then
        optionsPanel.druidForms:Refresh()
    end

    if optionsPanel.druidAquatic then
        local hasAquatic = isDruid and IsSpellKnownByID(DRUID_SPELLS.aquatic)
        local hasFlight = isDruid and (IsSpellKnownByID(DRUID_SPELLS.flight) or IsSpellKnownByID(DRUID_SPELLS.swiftFlight))
        local hasTravel = isDruid and IsSpellKnownByID(DRUID_SPELLS.travel)

        optionsPanel.druidAquatic:Refresh()
        optionsPanel.druidFlight:Refresh()
        optionsPanel.druidTravel:Refresh()

        if isDruid then
            optionsPanel.druidAquatic:Show()
            optionsPanel.druidFlight:Show()
            optionsPanel.druidTravel:Show()
        else
            optionsPanel.druidAquatic:Hide()
            optionsPanel.druidFlight:Hide()
            optionsPanel.druidTravel:Hide()
        end
        optionsPanel.druidAquatic:SetEnabled(hasAquatic and true or false)
        optionsPanel.druidFlight:SetEnabled(hasFlight and true or false)
        optionsPanel.druidTravel:SetEnabled(hasTravel and true or false)
        if optionsPanel.druidAquatic.icon then
            optionsPanel.druidAquatic.icon:SetAlpha(hasAquatic and 1 or 0.35)
        end
        if optionsPanel.druidFlight.icon then
            optionsPanel.druidFlight.icon:SetAlpha(hasFlight and 1 or 0.35)
        end
        if optionsPanel.druidTravel.icon then
            optionsPanel.druidTravel.icon:SetAlpha(hasTravel and 1 or 0.35)
        end

        if optionsPanel.druidAquatic.label then
            optionsPanel.druidAquatic.label:SetTextColor(hasAquatic and 1 or 0.55, hasAquatic and 0.82 or 0.55, hasAquatic and 0 or 0.55)
        end
        if optionsPanel.druidFlight.label then
            optionsPanel.druidFlight.label:SetTextColor(hasFlight and 1 or 0.55, hasFlight and 0.82 or 0.55, hasFlight and 0 or 0.55)
        end
        if optionsPanel.druidTravel.label then
            optionsPanel.druidTravel.label:SetTextColor(hasTravel and 1 or 0.55, hasTravel and 0.82 or 0.55, hasTravel and 0 or 0.55)
        end
    end

    if optionsPanel.preventDismountFlying then
        optionsPanel.preventDismountFlying:ClearAllPoints()
        if isDruid then
            optionsPanel.preventDismountFlying:SetPoint("TOPLEFT", optionsPanel.druidTravel, "BOTTOMLEFT", 0, -8)
        else
            optionsPanel.preventDismountFlying:SetPoint("TOPLEFT", optionsPanel.groundSlot, "BOTTOMLEFT", 0, -24)
        end
        optionsPanel.preventDismountFlying:Refresh()
    end

    if statusLines[1] then
        local index = 1
        for line in string.gmatch(self:GetStatusText(), "[^\n]+") do
            if statusLines[index] then
                statusLines[index]:SetText(line)
                statusLines[index]:Show()
            end
            index = index + 1
        end

        while statusLines[index] do
            statusLines[index]:SetText("")
            statusLines[index]:Hide()
            index = index + 1
        end
    end
end

function RIDE:OpenOptions()
    CreateOptionsPanel()
    self:RefreshOptions()

    if Settings and Settings.OpenToCategory and settingsCategory then
        local id = settingsCategory.GetID and settingsCategory:GetID() or settingsCategory.ID or settingsCategory
        Settings.OpenToCategory(id)
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(optionsPanel)
        InterfaceOptionsFrame_OpenToCategory(optionsPanel)
    else
        optionsPanel:SetParent(UIParent)
        optionsPanel:ClearAllPoints()
        optionsPanel:SetPoint("CENTER")
        optionsPanel:Show()
    end
end

local function PrintHelp()
    Print(L.HELP_HEADER)
    Print(L.HELP_OPEN)
    Print(L.HELP_STATUS)
    Print(L.HELP_GROUND)
    Print(L.HELP_FLYING)
    Print(L.HELP_CURSOR)
    Print(L.HELP_CLEAR)
    Print(L.HELP_DRUID)
    Print(L.HELP_BIND)
    Print(L.HELP_UNBIND)
    Print(L.HELP_UPDATE)
end

local function ParseCommand(msg)
    msg = Trim(msg)
    local command, rest = msg:match("^(%S+)%s*(.*)$")
    command = command and string.lower(command) or ""
    rest = Trim(rest)
    return command, rest
end

function RIDE:HandleSlash(msg)
    local command, rest = ParseCommand(msg)

    if command == "" or command == "config" or command == "options" then
        self:OpenOptions()
    elseif command == "help" then
        PrintHelp()
    elseif command == "status" then
        self:PrintStatus()
    elseif command == "ground" then
        if rest == "" then
            self:SetMountFromCursor("ground")
        else
            self:SetMount("ground", rest)
        end
    elseif command == "flying" or command == "fly" then
        if rest == "" then
            self:SetMountFromCursor("flying")
        else
            self:SetMount("flying", rest)
        end
    elseif command == "clear" then
        rest = string.lower(rest)
        if rest == "ground" then
            self:ClearMount("ground")
        elseif rest == "flying" or rest == "fly" then
            self:ClearMount("flying")
        else
            Print(L.HELP_CLEAR)
        end
    elseif command == "druid" then
        local enabled = not (db.useDruidAquatic or db.useDruidFlight or db.useDruidTravel)
        db.useDruidAquatic = enabled
        db.useDruidFlight = enabled
        db.useDruidTravel = enabled
        self:UpdateSecureAction()
        Print(enabled and L.DRUID_ON or L.DRUID_OFF)
    elseif command == "bind" then
        if rest == "" then
            self:StartBindingCapture()
        else
            self:SetSmartTravelBinding(rest)
        end
    elseif command == "unbind" then
        self:ClearSmartTravelBinding()
    elseif command == "update" or command == "refresh" then
        self:UpdateSecureAction()
    else
        PrintHelp()
    end
end

local function RegisterSlashCommands()
    SLASH_RIDE1 = "/ride"
    SlashCmdList.RIDE = function(msg)
        RIDE:HandleSlash(msg)
    end
end

RIDE:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        EnsureDb()
        ClearInvalidSlotMounts()
        _, playerClass = UnitClass("player")
        isDruid = playerClass == "DRUID"
        RegisterSlashCommands()
        RegisterInterfaceOptions()
        self:UpdateSecureAction(true)
        self:ApplyVisibleBindingOverride()
        Print(L.LOADED)
    elseif event == "PLAYER_LOGIN" then
        _, playerClass = UnitClass("player")
        isDruid = playerClass == "DRUID"
        self:UpdateSecureAction(true)
        self:ApplyVisibleBindingOverride()
    elseif event == "PLAYER_REGEN_ENABLED" then
        if pendingSecureUpdate then
            self:UpdateSecureAction(true)
        end
        if pendingBindingOverride then
            self:ApplyVisibleBindingOverride()
        end
    elseif event == "PLAYER_ENTERING_WORLD"
        or event == "ZONE_CHANGED"
        or event == "ZONE_CHANGED_NEW_AREA"
        or event == "ZONE_CHANGED_INDOORS"
        or event == "LEARNED_SPELL_IN_TAB"
        or event == "SPELLS_CHANGED"
        or event == "BAG_UPDATE_DELAYED" then
        self:UpdateSecureAction(true)
    elseif event == "UPDATE_BINDINGS" then
        self:ApplyVisibleBindingOverride()
        self:RefreshOptions()
    end
end)

local function RegisterEventIfValid(frame, event)
    if C_EventUtils and C_EventUtils.IsEventValid and not C_EventUtils.IsEventValid(event) then
        return
    end
    frame:RegisterEvent(event)
end

RegisterEventIfValid(RIDE, "ADDON_LOADED")
RegisterEventIfValid(RIDE, "PLAYER_LOGIN")
RegisterEventIfValid(RIDE, "PLAYER_ENTERING_WORLD")
RegisterEventIfValid(RIDE, "ZONE_CHANGED")
RegisterEventIfValid(RIDE, "ZONE_CHANGED_NEW_AREA")
RegisterEventIfValid(RIDE, "ZONE_CHANGED_INDOORS")
RegisterEventIfValid(RIDE, "PLAYER_REGEN_ENABLED")
RegisterEventIfValid(RIDE, "LEARNED_SPELL_IN_TAB")
RegisterEventIfValid(RIDE, "SPELLS_CHANGED")
RegisterEventIfValid(RIDE, "BAG_UPDATE_DELAYED")
RegisterEventIfValid(RIDE, "UPDATE_BINDINGS")
