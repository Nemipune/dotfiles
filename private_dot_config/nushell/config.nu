# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu

# commands on startup

# environment
$env.config.buffer_editor = "vim"

# prompt


# aliases

# chezmoi
alias cmdir = cd ~/.local/share/chezmoi
alias cma = chezmoi apply -v
alias cmadd = chezmoi add
alias cme = chezmoi edit

# git
alias gp = git pull
alias ga = git add .
alias gc = git commit -m
alias gpom = git push origin main
