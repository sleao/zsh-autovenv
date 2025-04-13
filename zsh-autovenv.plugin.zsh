_toggleVenvShell() {
  local in_venv_dir=0

  if [[ -d "$PWD/.venv" ]]; then
    in_venv_dir=1
  fi

  if [[ $venv_active -eq 1 ]] && { [[ $in_venv_dir -eq 0 ]] || [[ "$PWD" != "$venv_dir"* ]]; }; then
    export venv_active=0
    unset venv_dir
    (( $+functions[deactivate] )) && deactivate
  fi

  if [[ $in_venv_dir -eq 1 ]] && [[ $venv_active -ne 1 ]]; then
    export venv_active=1
    export venv_dir="$PWD/.venv"
    source "${venv_dir}/bin/activate"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _toggleVenvShell
_toggleVenvShell
