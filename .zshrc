# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt
# ----------------------------------
# Colors (custom code)
# ----------------------------------
#DARKGRAY='\033[1;30m'
#LIGHTRED='\033[1;31m'
## ----------------------------------
#echo -e "${LIGHTRED}   ▄████████ ${DARKGRAY}  ▄▄▄▄███▄▄▄▄      ▄████████ ███▄▄▄▄   "
#echo -e "${LIGHTRED}  ███    ███ ${DARKGRAY}▄██▀▀▀███▀▀▀██▄   ███    ███ ███▀▀▀██▄ "
#echo -e "${LIGHTRED}  ███    ███ ${DARKGRAY}███   ███   ███   ███    ███ ███   ███ "
#echo -e "${LIGHTRED}  ███    ███ ${DARKGRAY}███   ███   ███   ███    ███ ███   ███ "
#echo -e "${LIGHTRED}▀███████████ ${DARKGRAY}███   ███   ███ ▀███████████ ███   ███ "
#echo -e "${LIGHTRED}  ███    ███ ${DARKGRAY}███   ███   ███   ███    ███ ███   ███ "
#echo -e "${LIGHTRED}  ███    ███ ${DARKGRAY}███   ███   ███   ███    ███ ███   ███ "
#echo -e "${LIGHTRED}  ███    █▀  ${DARKGRAY} ▀█   ███   █▀    ███    █▀   ▀█   █▀  "
#echo ""


autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.cache/.zsh_history

# Use modern completion system
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# -----------Custom code------
#
# -----------Plugins---------
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-plugins/themes/powerlevel10k/powerlevel10k.zsh-theme
# ----------------------------
export PATH="${PATH}:/home/legion/.local/bin"
# function to copy a file to host
function cphost { cp "$1" /mnt/c/Users/AMAN\ YADAV/Desktop/Nuclear\ Codes/wsl-files; }
# function to copy a folder to host
function cpdhost { cp -r "$1" /mnt/c/Users/AMAN\ YADAV/Desktop/Nuclear\ Codes/wsl-files; }
# function to cd followed by ls
function cs() { cd "$1" && ls -l --color=auto; }
# cheat.sh function
function cht { curl cht.sh/"$1"; }
# All aliases in .zsh_aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export EDITOR=vim
# ----------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/home/legion/.deta/bin:$PATH"
