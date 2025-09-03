<div align="center">
<h1>My Nixos Config</h1>

<p>My NixOs setup using <a href="https://github.com/YaLTeR/niri">Niri</a> and <a href="https://github.com/noctalia-dev/noctalia-shell">Noctalia-Shell</a></p>

</div>

## Content

1. [Previews](#previews)
2. [Keybinds](#keybinds)
3. [Dependencies](#dependencies)
4. [Requirements](#requirements)
5. [Quick Start](#quick-start)

## Previews
<table>
    <tr>
        <td><img src="./.previews/Screenshot from 2025-09-03 14-50-11.png" width="1000" /></td>
    </tr>
    <tr>
        <td><img src="./.previews/Screenshot from 2025-09-03 14-50-22.png" width="1000" /></td>
    </tr>
</table>

## Keybinds
> <strong>Note:</strong> $mainMod is set to the SUPER key (usually the Windows key).

|Shortcut | Description |
| --------------------------- | ------------------------------------------------------- |
|$mainMod + Return | Opens the terminal (Wezterm) |
|$mainMod + Q | Closes the active window |
|$mainMod + E | Opens the file manager (Yazi) |
|$mainMod + T | Toggles the window between floating and tiled |
|$mainMod + A | Opens the launcher/menu (Noctalia) |
|$mainMod + P | Runs the custom power menu (Noctalia) |
|$mainMod + B | Opens the default browser (Brave) |
|$mainMod + C | Opens the default editor (Neovim) |
|$mainMod + V | Manages clipboard (Noctalia) |
## Requirements

- Git

## Quick Start

```bash
git clone https://github.com/viitorags/nixos-config.git

cd nixos-config

sudo nixos-rebuild switch --flake .#gh0stk
home-manager switch --flake .#gh0stk
```
