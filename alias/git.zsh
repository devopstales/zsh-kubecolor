# alias
alias gs='git status'
alias gh='git log'
gpsm(){
  git submodule init
  git submodule update
}

# promt
git_prompt_user () {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "${GIT_AUTHOR_NAME:-$(command git config --get user.name 2>/dev/null)}"
  fi
}
