# PACKAGE LIST
## MAIN
**OS:** `EndeavourOS`  
**global theme:** `catppuccin-mocha`  

### WM
**greeter:** `greetd-gtkgreet`  
**WM:** `swayfx`  
- `swaybg`  
- `swaylock`  
- `swayidle`  
  
**bar:** `waybar`  
**screencap:** `grim` `grimshot`  
**dmenu:** `wofi`  
**backlight:** `light`  
  
### TERMINAL
**term:** `kitty`  
**shell:** `nushell` *todo:config*  
**proc:** `btm`  
**editor:** `vim`  
**filemanager:** `fifm` *todo:config*  

### AUDIO  
**server:** `pipewire`  
    - `pavuctl`  
**effects:** `easyeffects` *flatpak*  

### UTILS
**update:** `topgrade`  
**dotfiles:** `chezmoi`  
**torrent:** `qbittorrent`
**passwords:** `bitwarden`  
**browser:** `firefox`  
**markdown:** `obsidian`  
**office:** `libreoffice-still`  
**camera:** `cameractrls`  
**mouse:** `piper`  

## DEV

### GLOBAL
**IDE:** `code`  
**languages:**  
- `rustup`  

### GAMEDEV
**engine:** `godot`  

## MISC

### MULTIMEDIA
**image editor:** `gimp`  
**vector:** `inkscape`  
**video:** `kdenlive`  
**paint:** `pinta`  
**audio:**  
- recording: `audacity`  
- virtual amp: `guitarix`  
- daw: `lmms`, `ardour`  
- synth: `vcvrack`  
- metadata: `kid3`  

### COMS
**discord:** `vesktop` *flatpak*  
**matrix:** `element` *flatpak*  
  
### GAMES
**launchers:**  
- `steam`  
- `lutris`  
- `prismlauncher` *minecraft*  

# CONFIG
## EOS INSTALLER
On the EOS live environment, put the `user_pkglist.txt` in the `/home/liveuser` dir  

## GENERAL INSTALL

### AUR PACKAGES
- `swayfx`  
- `topgrade`  
- `fifm`  
- `vcvrack`  

### FLATPAK
**Export app list**
cd to the chezmoi dir and run `flatpak list --columns=application --app > flatpak.bkp`  

*note: I made an alias in bash named* `fltbkp` *that does exactly this*  


**Install**  
cd to the chezmoi dir and run `xargs flatpak install -y < flatpak.bkp`  
  
**Notes**  
- This won't save the configuration, it's stored in the `~/.var/app`  
