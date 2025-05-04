# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string cdto have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-history-substring-search
  zsh-interactive-cd
  zsh-navigation-tools
  zsh-vi-mode
)

source $ZSH_CUSTOM/plugins/zsh-async/async.zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unalias g 2>/dev/null

g() {
  local GREEN="\033[32m"
  local YELLOW="\033[33m"
  local RED="\033[31m"
  local RESET="\033[0m"

  case "$1" in
    help|h)
      echo -e "${YELLOW}📘 Git Shortcuts Help:${RESET}"
      echo -e "${GREEN}g st${RESET}               → git status"
      echo -e "${GREEN}g lg${RESET}               → git log --oneline --graph --decorate"
      echo -e "${GREEN}g ci \"msg\"${RESET}         → git commit -m \"msg\""
      echo -e "${GREEN}g ca \"msg\"${RESET}         → git commit -a -m \"msg\""
      echo -e "${GREEN}g amend${RESET}            → git commit --amend --no-edit"
      echo -e "${GREEN}g co BRANCH/HASH${RESET}   → git checkout BRANCH"
      echo -e "${GREEN}g out BRANCH/HASH${RESET}  → git checkout BRANCH"
      echo -e "${GREEN}g in BRANCH/HASH${RESET}   → git checkout HASH"
      echo -e "${GREEN}g new BRANCH${RESET}       → git checkout -b BRANCH"
      echo -e "${GREEN}g b${RESET}                → git branch"
      echo -e "${GREEN}g pl${RESET}               → git pull"
      echo -e "${GREEN}g ps${RESET}               → git push"
      echo -e "${GREEN}g psf${RESET}              → git push --force"
      echo -e "${GREEN}g a${RESET}                → git add FILE"
      echo -e "${GREEN}g aa${RESET}               → git add ."
      echo -e "${GREEN}g s${RESET}                → git stash"
      echo -e "${GREEN}g sp${RESET}               → git stash pop"
      echo -e "${GREEN}g sd${RESET}               → git stash drop"
      echo -e "${GREEN}g r${RESET}                → git restore ."
      echo -e "${GREEN}g hist${RESET}             → histórico personalizado do git log"
      ;;
    
    st)     echo -e "${YELLOW}🔍 Status:${RESET}"; command git status ;;
    lg)     echo -e "${YELLOW}📜 Log:${RESET}"; command git log --oneline --graph --decorate ;;
    ci)     shift; echo -e "${GREEN}✅ Commit: $*${RESET}"; command git commit -m "$*" ;;
    ca)     shift; echo -e "${GREEN}✅ Commit All: $*${RESET}"; command git commit -a -m "$*" ;;
    amend)  echo -e "${YELLOW}✏️  Amending last commit...${RESET}"; command git commit --amend --no-edit ;;
    co|out|in) shift; echo -e "${GREEN}🚀 Checkout to: $*${RESET}"; command git checkout "$@" ;;
    new)    shift; echo -e "${GREEN}🌱 New branch: $*${RESET}"; command git checkout -b "$@" ;;
    b)      shift; echo -e "${YELLOW}🌿 Branches:${RESET}"; command git branch "$@" ;;
    s)      echo -e "${YELLOW}📦 Stash:${RESET}"; command git stash ;;
    sp)     echo -e "${GREEN}📤 Stash pop:${RESET}"; command git stash pop ;;
    sd)     echo -e "${RED}🗑️  Stash drop:${RESET}"; command git stash drop ;;
    pl)     echo -e "${YELLOW}⬇️  Pulling...${RESET}"; command git pull ;;
    ps)     echo -e "${GREEN}⬆️  Pushing...${RESET}"; command git push ;;
    psf)    echo -e "${RED}💥 Force Push...${RESET}"; command git push --force ;;
    a)     shift; echo -e "${GREEN}➕ Added changes on file "$@"${RESET}"; command git add "$@" ;;
    aa)     echo -e "${GREEN}➕ Added all changes${RESET}"; command git add . ;;
    r)      shift; echo -e "${RED}🧹 Restoring "$@"...${RESET}"; command git restore "$@";;
    hist)   echo -e "${YELLOW}📚 Git history:${RESET}"; command git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short ;;
    
    *)
      echo -e "${YELLOW}🤖 Running: git $*${RESET}"
      command git "$@"
      ;;
  esac
}




SPACESHIP_PROMPT_ORDER=(
  user # Username section
  dir       # pasta atual
  git       # status do git
  hg # Mercurial section (hg_branch + hg_status)
  exec_time # tempo de execução
  line_sep # Line break
  jobs      # jobs em background
  exit_code # código de saída
  char      # caractere do prompt
)

SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_COLOR_FAILURE="red"

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_DIR_TRUNC=1

SPACESHIP_USER_SHOW=always
