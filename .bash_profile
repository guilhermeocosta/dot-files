# Loads NVM
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# All alias are concentrated on .bash_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# GIT Configs and helpers
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Color pallete
BLACK="\033[0;30m"
BLUE="\033[0;34m"
BROWN="\033[0;33m"
CYAN="\033[0;36m"
DARK_GRAY="\033[1;30m"
GREEN="\033[0;32m"
LIGHT_BLUE="\033[1;34m"
LIGHT_CYAN="\033[1;36m"
LIGHT_GRAY="\033[0;37m"
LIGHT_GREEN="\033[1;32m"
LIGHT_PURPLE="\033[1;35m"
LIGHT_RED="\033[1;31m"
PURPLE="\033[0;35m"
RED="\033[0;31m"
WHITE="\033[1;37m"
YELLOW="\033[1;33m"
END_COLOR="\e[m"

parse_git_branch() {
  local GITDIR=`git rev-parse --show-toplevel 2>&1`

  if [[ "$GITDIR" != '/Users/guilhermeocosta' ]]; then
    local BRANCH=`git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'`
    if [ -n "$BRANCH" ]; then
      echo -e "[$BRANCH] "
    fi
  fi
}

git_status() {
  if [ -d .git ]; then
    if `git diff --quiet 2> /dev/null`; then
      echo -e $CYAN
    else
      echo -e $RED
    fi
  fi;
}

export PS1="⚡️  ${DARK_GRAY}\w${END_COLOR} \$(git_status)\$(parse_git_branch)${END_COLOR}${DARK_GRAY}\$${END_COLOR} "
