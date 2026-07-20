# ==============================================================================
# 0. ИНИЦИАЛИЗАЦИЯ P10K (Моментальная отрисовка строки)
# ==============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# 1. ЯДРО ZINIT (Автоустановка при первом запуске)
# ==============================================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  print -P "%F{33} 🚀 Installing Zinit...%f"
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ==============================================================================
# 2. OH-MY-ZSH (Легковесная интеграция через Snippets)
# ==============================================================================
# Библиотеки ядра OMZ (загружаем только самое необходимое)
zinit snippet OMZL::history.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit light zsh-users/zsh-completions

# ==============================================================================
# 3. СТОРОННИЕ ПЛАГИНЫ (Магия Turbo Mode)
# ==============================================================================

zinit ice wait"0" lucid
zinit light Aloxaf/fzf-tab

zinit ice wait"0" lucid
zinit light olets/zsh-abbr

zinit light jeffreytse/zsh-vi-mode

zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

# ==============================================================================
# 4. DEVOPS НАСТРОЙКИ (История команд)
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory        # Добавлять в историю, а не перезаписывать файл
setopt sharehistory         # Общая история между всеми открытыми терминалами
setopt hist_ignore_all_dups # Не сохранять дубликаты команд
setopt hist_ignore_space    # Не сохранять команду, если она начинается с пробела (для секретов)

# 4.5. FZF ИНТЕГРАЦИЯ (Поиск по истории и файлам)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=bg+:-1,bg:-1,spinner:6,hl:4,fg:15,header:4,info:2,pointer:4,marker:4,fg+:15,prompt:4,hl+:4"

# 2. Подключаем официальные системные скрипты Arch Linux для fzf
function zvm_after_init() {
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
  fi
}

# ==============================================================================
# 5. ALIASES & ABBR (Повседневные сокращения)
# ==============================================================================
alias ls="eza --icons -T -L=2"
alias ll="eza --icons -T -L=2"
alias cat="bat"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Zoxide (Умный cd)
eval "$(zoxide init zsh)"

# ==============================================================================
# 6. ОФОРМЛЕНИЕ TERMINAL (Powerlevel10k)
# ==============================================================================
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
