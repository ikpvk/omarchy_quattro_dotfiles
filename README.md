# omarchy_quattro_dotfiles

Personal Omarchy (Hyprland) customizations, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level directory is a stow package that mirrors `$HOME`.

| Package | Installs to | Purpose |
|---|---|---|
| `bin` | `~/.local/bin/omarchy-internal-display-backlight` | Turn the laptop panel on/off with its backlight kept in sync; `watch` mode turns the panel back on (and restores brightness) when the last external monitor disappears |
| `hypr` | `~/.config/hypr/autostart.lua` | Restores panel/backlight state at login and starts the watcher |

## Install

```bash
omarchy pkg add stow
git clone https://github.com/ikpvk/omarchy_quattro_dotfiles.git ~/Downloads/work/omarchy_quattro_dotfiles
cd ~/Downloads/work/omarchy_quattro_dotfiles
stow -t ~ bin hypr
```

The repo doesn't live in `$HOME`, so always pass `-t ~`. If the target files already exist,
`stow --adopt -t ~ bin hypr` replaces them with links (it moves their content into the repo), and `git diff` shows what changed.

## After `omarchy refresh hyprland`

Omarchy's refresh replaces `~/.config/hypr/autostart.lua` with the default (after backing it up). Restore it with:

```bash
rm ~/.config/hypr/autostart.lua && stow -t ~ hypr
```

## Background

The watcher works around Hyprland's synthetic `FALLBACK` output fooling Omarchy's
`omarchy-hyprland-monitor-external-active`, which left the laptop screen black after the external
USB-C monitor lost power. Upstream fix: https://github.com/omacom/omarchy/pull/10586
