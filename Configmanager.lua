-- By H3xad3cimal
-- Edited Configuration Manager I made a year ago

-- ISync remeber this shit
-- Library:IfSetting(settingName: string)              # Checks if a setting exists
-- Library:SetSetting(settingName: string, value: any) # Creates a setting
-- Library:GetSetting(settingName: string)             # Gets a setting
-- Library:Write2Config(void)                          # Saves the config
local config_lib = {};

local httpService = game:GetService("HttpService");
local config_name = game.PlaceId .. ".sugma_hub.json";

if not isfolder("Sugma Hub JSDB") then
    makefolder("Sugma Hub JSDB");
end;

if isfile("Sugma Hub JSDB/" .. config_name) then
    config = httpService:JSONDecode(readfile("Sugma Hub JSDB/" .. config_name));
end;
if config == nil then config = {} end

function config_lib:IfSetting(sName)
    if config[sName] then
        return true;
    else
        return false;
    end
end;

function config_lib:Config2JSON()
    return httpService:JSONEncode(config);
end;

function config_lib:Write2Config()
    writefile("Sugma Hub JSDB/" .. config_name, config_lib:Config2JSON());
end;

function config_lib:SetSetting(sName, uValue)
    config[sName] = uValue;
end;

function config_lib:GetSetting(sName)
    return config[sName]
end;

return config_lib;