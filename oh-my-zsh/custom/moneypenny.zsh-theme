PROMPT='%{$fg[magenta]%}%3~%{$reset_color%} at %{$fg[blue]%}%m%{$reset_color%} $(git_prompt_info)%# '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="($fg_bold[yellow]"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN=" $fg_bold[green]✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" $fg_bold[red]✗%{$reset_color%}"
