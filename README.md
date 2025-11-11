# Multy Library

A Roblox GUI library made by Multyply.

## What It Does

- Everything runs from one script file
- Works on all devices (PC, mobile, console)
- Includes toggles, sliders, dropdowns, color pickers, keybinds, buttons, text boxes, and more
- Built-in notification system
- Save and load your settings
- Change colors and themes on the fly
- Has a working demo to show you how everything works

## Getting Started

### Making A Window

```lua
local window = MultyLibrary:window({
    name = "Multy",
    suffix = "Library",
    gameInfo = "Your Game Name Here"
})
```

### Adding The Config Menu

After you build your UI, add the settings menu:

```lua
MultyLibrary:init_config(window)
```

This adds save/load buttons and theme controls.

## Quick Example

```lua
local overviewPage = window:tab({name = "Main", tabs = {"Overview"}})

local column = overviewPage:column({})
local section = column:section({name = "Controls", default = true})

section:toggle({
    name = "Enable Feature", 
    flag = "my_toggle",
    callback = function(enabled)
        print("Toggle is now:", enabled)
    end
})

section:slider({
    name = "Range", 
    min = 0, 
    max = 100, 
    suffix = " units",
    flag = "my_slider"
})

section:button({
    name = "Show Notification", 
    callback = function()
        MultyLibrary.notifications:create_notification({
            name = "Test", 
            info = "Button was clicked"
        })
    end
})
```

Check the bottom of `GUI.luau` for more examples.

## Creating Windows

### Creation Snippet

```lua
local window = MultyLibrary:window({
    name = "MyUI",
    suffix = "v1.0",
    gameInfo = "Game Name",
    size = UDim2.new(0, 700, 0, 565)
})
```

### Parameters

**name** : string
The main title of your window.

**suffix** : string NOT REQUIRED
Extra text shown next to the title.

**gameInfo** : string NOT REQUIRED
Game name or description shown at the bottom.

**size** : UDim2 NOT REQUIRED
Window size. Default is 700x565.

## Creating Tabs

### Creation Snippet

```lua
local tab1, tab2 = window:tab({
    name = "Players", 
    icon = "rbxassetid://12345678",
    tabs = {"Enemies", "Teammates"}
})
```

### Parameters

**name** : string
The text shown on the tab button.

**icon** : string NOT REQUIRED
Asset ID for an icon next to the tab name.

**tabs** : table
List of page names. Each name becomes its own page.

### Returns

Returns one value for each page you listed in the tabs table.

## Creating Sections

### Creation Snippet

```lua
local column = tab:column({})
local section = column:section({
    name = "Options",
    default = true,
    size = 1
})
```

### Parameters

**name** : string
The title of the section.

**default** : boolean NOT REQUIRED
Whether the section starts open. Default is false.

**side** : string NOT REQUIRED
Which side to place the section. Can be "left" or "right".

**size** : number NOT REQUIRED
How much space the section takes up. Default is 1 (full height).

**icon** : string NOT REQUIRED
Asset ID for a small icon next to the section name.

**fading** : boolean NOT REQUIRED
Whether the section can be collapsed by clicking.

## Creating Toggles

### Creation Snippet

```lua
local toggle = section:toggle({
    name = "Enable ESP",
    flag = "esp_enabled",
    default = false,
    callback = function(value)
        print("ESP is now:", value)
    end
})
```

### Parameters

**name** : string
The text shown next to the toggle.

**flag** : string NOT REQUIRED
Unique ID for saving this toggle's state.

**default** : boolean NOT REQUIRED
Starting value. Default is false.

**callback** : function NOT REQUIRED
Function that runs when the toggle changes.

Passed Parameters:
- **value** : boolean - The new state of the toggle.

**info** : string NOT REQUIRED
Tooltip text that shows when you hover over it.

**seperator** : boolean NOT REQUIRED
Whether to add a line below this toggle.

## Creating Sliders

### Creation Snippet

```lua
local slider = section:slider({
    name = "Speed",
    min = 0,
    max = 100,
    default = 50,
    suffix = "%",
    flag = "speed_value",
    callback = function(value)
        print("Speed set to:", value)
    end
})
```

### Parameters

**name** : string
The text shown next to the slider.

**min** : number
The lowest value the slider can be.

**max** : number
The highest value the slider can be.

**default** : number NOT REQUIRED
Starting value. Default is the minimum.

**interval** : number NOT REQUIRED
How much the value changes per step. Default is 1.

**suffix** : string NOT REQUIRED
Text shown after the number (like "%" or " studs").

**flag** : string NOT REQUIRED
Unique ID for saving this slider's state.

**callback** : function NOT REQUIRED
Function that runs when the slider moves.

Passed Parameters:
- **value** : number - The current value of the slider.

**seperator** : boolean NOT REQUIRED
Whether to add a line below this slider.

## Creating Dropdowns

### Creation Snippet

```lua
local dropdown = section:dropdown({
    name = "Select Mode",
    items = {"Option 1", "Option 2", "Option 3"},
    default = "Option 1",
    flag = "mode_select",
    callback = function(selected)
        print("Selected:", selected)
    end
})
```

### Parameters

**name** : string
The text shown next to the dropdown.

**items** : table
List of options to choose from.

**default** : string or table NOT REQUIRED
Starting selection. For multi-select, use a table.

**multi** : boolean NOT REQUIRED
Allow selecting multiple options. Default is false.

**flag** : string NOT REQUIRED
Unique ID for saving this dropdown's state.

**callback** : function NOT REQUIRED
Function that runs when selection changes.

Passed Parameters:
- **selected** : string or table - The currently selected option(s).

**seperator** : boolean NOT REQUIRED
Whether to add a line below this dropdown.

## Creating Color Pickers

### Creation Snippet

```lua
local picker = section:colorpicker({
    name = "Theme Color",
    color = Color3.fromRGB(155, 150, 219),
    alpha = 0,
    flag = "theme_color",
    callback = function(color, alpha)
        print("Color changed:", color, alpha)
    end
})
```

### Parameters

**name** : string
The text shown next to the color picker.

**color** : Color3 NOT REQUIRED
Starting color. Default is the accent color.

**alpha** : number NOT REQUIRED
Starting transparency (0 to 1). Default is 0.

**flag** : string NOT REQUIRED
Unique ID for saving this color picker's state.

**callback** : function NOT REQUIRED
Function that runs when the color changes.

Passed Parameters:
- **color** : Color3 - The selected color.
- **alpha** : number - The transparency value.

**seperator** : boolean NOT REQUIRED
Whether to add a line below this color picker.

## Creating Keybinds

### Creation Snippet

```lua
local keybind = section:keybind({
    name = "Toggle Menu",
    key = Enum.KeyCode.Insert,
    mode = "Toggle",
    flag = "menu_keybind",
    callback = function(active)
        print("Keybind active:", active)
    end
})
```

### Parameters

**name** : string
The text shown next to the keybind.

**key** : Enum.KeyCode NOT REQUIRED
The default key. Default is nothing.

**mode** : string NOT REQUIRED
How the keybind works. Can be "Toggle", "Hold", or "Always". Default is "Toggle".

**default** : boolean NOT REQUIRED
Whether the keybind starts active. Default is false.

**flag** : string NOT REQUIRED
Unique ID for saving this keybind's state.

**callback** : function NOT REQUIRED
Function that runs when the key is pressed.

Passed Parameters:
- **active** : boolean - Whether the keybind is currently active.

## Creating Buttons

### Creation Snippet

```lua
local button = section:button({
    name = "Click Me",
    callback = function()
        print("Button was clicked")
    end
})
```

### Parameters

**name** : string
The text shown on the button.

**callback** : function NOT REQUIRED
Function that runs when you click the button.

## Creating Text Boxes

### Creation Snippet

```lua
local textbox = section:textbox({
    name = "Enter Name",
    default = "Player",
    flag = "player_name",
    callback = function(text)
        print("Text changed to:", text)
    end
})
```

### Parameters

**name** : string
The text shown next to the text box.

**default** : string NOT REQUIRED
Starting text in the box.

**flag** : string NOT REQUIRED
Unique ID for saving this text box's content.

**callback** : function NOT REQUIRED
Function that runs when the text changes.

Passed Parameters:
- **text** : string - The current text in the box.

**seperator** : boolean NOT REQUIRED
Whether to add a line below this text box.

## Creating Lists

### Creation Snippet

```lua
local list = section:list({
    options = {"Item 1", "Item 2", "Item 3"},
    flag = "selected_item",
    callback = function(selected)
        print("Selected:", selected)
    end
})
```

### Parameters

**options** : table
List of items to show.

**flag** : string NOT REQUIRED
Unique ID for saving which item is selected.

**callback** : function NOT REQUIRED
Function that runs when you select an item.

Passed Parameters:
- **selected** : string - The currently selected item.

## Creating Labels

### Creation Snippet

```lua
local label = section:label({
    name = "Information",
    info = "This is some extra text that shows more details."
})
```

### Parameters

**name** : string
The main text.

**info** : string NOT REQUIRED
Extra text shown below in smaller font.

**seperator** : boolean NOT REQUIRED
Whether to add a line below this label.

## Saving And Loading

The library saves your settings to files.

### Getting Current Settings

```lua
local config = MultyLibrary:get_config()
```

Returns a JSON string with all current values.

### Loading Settings

```lua
MultyLibrary:load_config(configJSON)
```

Takes a JSON string and sets all values back.

### Where Files Are Saved

All config files go to `multylibrary/configs/` in your workspace folder.

## Changing Themes

### Updating Theme Color

```lua
MultyLibrary:update_theme("accent", Color3.fromRGB(255, 100, 100))
```

Changes the accent color everywhere in the UI.

### Theme Presets Example

```lua
local presets = {
    Red = Color3.fromRGB(255, 100, 100),
    Blue = Color3.fromRGB(100, 100, 255),
    Green = Color3.fromRGB(100, 255, 100)
}

section:list({
    options = {"Red", "Blue", "Green"},
    callback = function(choice)
        MultyLibrary:update_theme("accent", presets[choice])
    end
})
```

## Notifications

### Showing A Notification

```lua
MultyLibrary.notifications:create_notification({
    name = "Title",
    info = "Message text here",
    lifetime = 3
})
```

### Parameters

**name** : string
The title of the notification.

**info** : string
The message text.

**lifetime** : number NOT REQUIRED
How many seconds to show it. Default is 3.

## Using Flags

Flags let you save and access values easily.

### Setting Up A Flag

```lua
section:toggle({
    name = "My Toggle",
    flag = "my_unique_flag",
    default = true
})
```

### Reading A Flag Value

```lua
if MultyLibrary.flags["my_unique_flag"] then
    print("Toggle is on")
end
```

### Important Notes

- Every flag name must be unique
- Flags save automatically with configs
- You can access any widget's current value through flags

## Tips

- Use scale-based sizing for the UI to work on all screen sizes
- Test on different devices using Roblox's device emulator
- Give each widget a unique flag name if you want to save its value
- Look at the demo code at the bottom of `GUI.luau` for complete examples

## License

MIT License - 2025 Multyply
