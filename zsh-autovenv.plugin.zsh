_toggleVenvShell() {
  local venv_path=""

  local dir="$PWD"
  # this might break something if you have a .venv in your ~
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir/.venv" ]]; then
      venv_path="$dir/.venv"
      break 
    fi
    dir="${dir:h}"
  done

  if [[ $venv_active -eq 1 ]]; then
    if [[ -z "$venv_path" ]] || [[ "$PWD" != "${venv_path:h}"* ]]; then
      export venv_active=0
      unset venv_path
      (( $+functions[deactivate] )) && deactivate
    fi
  fi

  if [[ -n "$venv_path" ]] && [[ $venv_active -ne 1 ]]; then
    export venv_active=1
    source "${venv_path}/bin/activate"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _toggleVenvShell
_toggleVenvShell
