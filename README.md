# MultyUI

Modern themed GUI library.

## How to Use

Just load the library in your script like this:

```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloker0000/MultyUI/refs/heads/main/MultyUI.luau"))()
```

## Quick Start

Here's the basic structure you'll be working with:

```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloker0000/MultyUI/refs/heads/main/MultyUI.luau"))()

local window = library:window({
    name = "My Script",
    suffix = "UI",
    gameInfo = "Cool Game"
})

window:seperator({name = "Main"})

local tab1, tab2 = window:tab({
    name = "Features",
    tabs = {"Combat", "Visuals"}
})

local column = tab1:column({})
local section = column:section({name = "Settings", default = true})

section:toggle({
    name = "Enable Feature",
    flag = "my_toggle",
    default = false,
    callback = function(value)
        print("Toggle is now:", value)
    end
})

library:init_config(window)
```

## Creating a Window

Every menu starts with a window. This is your main container.

```lua
local window = library:window({
    name = "Script Name",
    suffix = "UI",
    gameInfo = "Game Name"
})
```

| Option | What it does |
|--------|--------------|
| name | The main title of your menu |
| suffix | Text that shows after the title (usually "UI") |
| gameInfo | Shows at the bottom of the menu |

## Tabs

Tabs help you organize your stuff. You can have multiple sub-tabs inside each tab.

```lua
window:seperator({name = "Category Name"})

local tab1, tab2, tab3 = window:tab({
    name = "Tab Name",
    tabs = {"Sub Tab 1", "Sub Tab 2", "Sub Tab 3"}
})
```

The `seperator` is just a label that shows up in the sidebar before your tab.

## Columns and Sections

Inside each tab, you need columns and sections to hold your elements.

```lua
local column = tab:column({})

local section = column:section({
    name = "Section Title",
    default = true,
    size = 0.5
})
```

| Option | What it does |
|--------|--------------|
| name | Title shown at the top of the section |
| default | If true, section starts expanded |
| size | How much vertical space it takes (0.5 = half) |

## Elements

These are all the things you can add to your sections.

### Toggle

A simple on/off switch.

```lua
section:toggle({
    name = "Toggle Name",
    flag = "unique_flag_name",
    default = false,
    seperator = true,
    callback = function(value)
        print(value)
    end
})
```

### Slider

Pick a number in a range.

```lua
section:slider({
    name = "Speed",
    flag = "speed_slider",
    min = 0,
    max = 100,
    default = 50,
    interval = 1,
    suffix = "%",
    callback = function(value)
        print(value)
    end
})
```

### Dropdown

Pick from a list of options.

```lua
section:dropdown({
    name = "Choose One",
    flag = "my_dropdown",
    items = {"Option 1", "Option 2", "Option 3"},
    default = "Option 1",
    callback = function(value)
        print(value)
    end
})
```

For multi-select dropdowns:

```lua
section:dropdown({
    name = "Choose Multiple",
    flag = "multi_dropdown",
    items = {"A", "B", "C", "D"},
    default = {"A", "C"},
    multi = true,
    callback = function(values)
        print(values)
    end
})
```

### Keybind

Let users set their own keys.

```lua
section:keybind({
    name = "Toggle Key",
    flag = "toggle_keybind",
    default = Enum.KeyCode.X,
    mode = "toggle",
    callback = function(active)
        print("Active:", active)
    end
})
```

Modes:
- `toggle` - Press to turn on, press again to turn off
- `hold` - Only active while holding the key
- `always` - Always active (key just controls something else)

### Colorpicker

Let users pick colors. You can add this to toggles or use it standalone.

```lua
section:toggle({
    name = "ESP",
    flag = "esp_toggle"
}):colorpicker({
    flag = "esp_color",
    color = Color3.fromRGB(255, 0, 0),
    alpha = 1,
    callback = function(color, alpha)
        print(color, alpha)
    end
})
```

Or standalone:

```lua
section:colorpicker({
    name = "Box Color",
    flag = "box_color",
    color = Color3.fromRGB(255, 255, 255)
})
```

### Textbox

For text input.

```lua
section:textbox({
    name = "Player Name",
    flag = "target_name",
    default = "",
    callback = function(text)
        print(text)
    end
})
```

### Button

Just a clickable button.

```lua
section:button({
    name = "Click Me",
    callback = function()
        print("Clicked!")
    end
})
```

### Label

Show some text or info.

```lua
section:label({
    name = "Title Here",
    info = "Some extra info that shows below the title"
})
```

## Reading Flag Values

All your element values get stored in `library.flags`. You can read them anytime:

```lua
local isEnabled = library.flags["esp_toggle"]
local fovValue = library.flags["aimbot_fov"]
local selectedPart = library.flags["target_part"]
```

## Config System

Add this at the end of your script to enable saving/loading configs:

```lua
library:init_config(window)
```

This adds a Configs tab where users can save and load their settings.

## Notifications

Show popup notifications to the user:

```lua
library.notifications:create_notification({
    name = "Title",
    info = "Message goes here",
    lifetime = 5
})
```

## Unloading

To completely remove the menu:

```lua
library:unload_menu()
```

## Theming

Change the accent color:

```lua
library:update_theme("accent", Color3.fromRGB(255, 100, 100))
```

## Full Example

Check out [Example.luau](Example.luau) for a complete working example.

## Tips

- Always use unique flag names for each element
- Put `seperator = true` on elements to add a visual line between them
- Use the `info` property to add descriptions that help users understand what things do
- The `callback` function runs whenever the value changes
- Configs save to a folder called "multyUI" in your executor's workspace

---

Made by Multyply