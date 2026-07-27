#!/usr/bin/env bash

__system_git_current_branch() {
  git branch --show-current
}

__system_git_default_branch() {
  git rev-parse --verify origin/main >/dev/null 2>&1 && echo main || echo master
}

# git push -f
# git push --force
# Show a confirmation when forcing a push on the default branch.
__system_git_push_confirmation_master_branch_force() {
  local default
  default=$(__system_git_default_branch)
  if [ "$(__system_git_current_branch)" == "$default" ]; then
    read -p "Force pushing to $default branch. Are you sure? " -r
    if [[ $REPLY =~ ^(yes|y|Y)$ ]]; then
      command git "$@"
    fi
  else
    command git "$@"
  fi
}

# $ git push
__system_git_push() {
  if [[ "$*" == "push -f"* || "$*" == "push --force"* ]]; then
    __system_git_push_confirmation_master_branch_force "$@"
  else
    command git "$@"
  fi
}

# $ git clone
__system_git_clone() {
  name="${3:-${2##*/}}"
  command git "$@" && cd "${name%.git}" || return
}

# $ git co <branch>
# If the branch is already checked out in another worktree, free it and
# retry here. Relies on `git worktree remove` refusing on its own when that
# worktree has uncommitted or untracked changes.
__system_git_checkout() {
  local out status wt_path
  out=$(command git "$@" 2>&1)
  status=$?

  if [[ $status -ne 0 && $out == *"is already used by worktree at"* ]]; then
    wt_path=$(sed -n "s/.*is already used by worktree at '\([^']*\)'.*/\1/p" <<< "$out")
    if [[ -n $wt_path ]]; then
      echo "Branch is checked out in worktree '$wt_path' — freeing it and retrying." >&2
      if command git worktree remove "$wt_path"; then
        command git "$@"
        return
      fi
    fi
  fi

  [[ -n $out ]] && printf '%s\n' "$out"
  return $status
}

__system_git() {
  if [[ "$1" == "push" ]]; then
    __system_git_push "$@"
  elif [[ "$1" == "clone" ]]; then
    __system_git_clone "$@"
  elif [[ "$1" == "co" ]]; then
    __system_git_checkout "$@"
  else
    command git "$@"
  fi
}

alias git='__system_git'

_git_jump() {
  __gitcomp_nl "$(__git_heads)"
}

_git_remove() {
  __gitcomp_nl "$(__git_heads)"
}

_git_integrate() {
  __gitcomp_nl "$(__git_heads)"
}

_git_co() {
  __gitcomp_nl "$(__git_heads)"
}

export PATH="$DOTFILES_DIR/git-commands:$PATH"
