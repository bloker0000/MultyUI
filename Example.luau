local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloker0000/MultyUI/refs/heads/main/MultyUI.luau"))()

local window = library:window({
    name = "My Script",
    suffix = "UI",
    gameInfo = "Game Name Here"
})

window:seperator({name = "Main"})

local main, settings = window:tab({
    name = "Combat",
    tabs = {"Main", "Settings"}
})

local column = main:column({})
local section = column:section({
    name = "Aimbot",
    default = true
})

section:toggle({
    name = "Enabled",
    flag = "aimbot_enabled",
    default = false,
    seperator = true,
    callback = function(value)
        print("Aimbot:", value)
    end
})

section:slider({
    name = "FOV",
    flag = "aimbot_fov",
    min = 50,
    max = 500,
    default = 150,
    seperator = true,
    callback = function(value)
        print("FOV set to:", value)
    end
})

section:dropdown({
    name = "Target Part",
    flag = "aimbot_part",
    items = {"Head", "Torso", "Random"},
    default = "Head",
    seperator = true,
    callback = function(value)
        print("Target part:", value)
    end
})

section:keybind({
    name = "Aimbot Key",
    flag = "aimbot_key",
    default = Enum.UserInputType.MouseButton2,
    mode = "hold",
    callback = function(active)
        print("Aimbot active:", active)
    end
})

local column2 = main:column({})
local section2 = column2:section({
    name = "Visuals",
    default = true
})

section2:toggle({
    name = "ESP Enabled",
    flag = "esp_enabled",
    default = false,
    seperator = true,
    callback = function(value)
        print("ESP:", value)
    end
}):colorpicker({
    flag = "esp_color",
    color = Color3.fromRGB(255, 0, 0),
    callback = function(color, alpha)
        print("ESP color changed")
    end
})

section2:toggle({
    name = "Show Names",
    flag = "show_names",
    default = true,
    seperator = true
})

section2:textbox({
    name = "Prefix",
    flag = "name_prefix",
    default = "",
    seperator = true,
    callback = function(text)
        print("Prefix:", text)
    end
})

section2:button({
    name = "Reset All",
    callback = function()
        print("Reset button clicked!")
    end
})

local settingsColumn = settings:column({})
local settingsSection = settingsColumn:section({
    name = "Config",
    default = true
})

settingsSection:label({
    name = "Configuration",
    info = "Save and load your settings here."
})

library:init_config(window)