# Themer
DomacsVim theme manager

## Install
Install via your plugin manager. for example :

Packer:

````lua
use {
  'DomacsVim/themer',
  config = function()
    -- API Call
  end
}
````

## List of the Themes
* **Darkplus**
* **Dracula**
* **GitHub**
* **Gruvbox**
* **Horizon**
* **Monokai**
* **Onedark**
* **RosePine**
* **tokyonight**

## API
require themer :

````lua
local themer = require('themer')
````

for Get the theme name :

````lua
themer.get_theme(theme) -> String 
````

for example : onedark theme.

````lua
themer.get_theme('onedark') -> 'themer.themes.onedark'
````

for Get the colors palette :

````lua
themer.get_palette(theme) -> Table 
````

for example : onedark theme.

````lua
themer.get_palette('onedark') -> onedark theme color palette
````

for configure themes :

````lua
themer.config_theme(theme, configs)
````

for example : onedark theme.

````lua
themer.config_theme('onedark', { style = 'darker' })
````

for load theme :

````lua
themer.load_theme(theme)
````

for example : onedark theme.

````lua
themer.load_theme('onedark')
````
