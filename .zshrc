# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
# ZSH_THEME="kafeitu"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/admin.pem"

# history config
export HISTSIZE=10000
export SAVEHIST=10000
# 以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
# 如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS      
# 为历史纪录中的命令添加时间戳      
setopt EXTENDED_HISTORY      

# 启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
# 相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
# 在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE      

# kill 命令补全      
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

##行编辑高亮模式 {{{
# Ctrl+@ 设置标记，标记和光标点之间为 region
zle_highlight=(region:bg=magenta  # 选中区域 
               special:bold       # 特殊字符
               isearch:underline)#搜索时使用的关键字
#}}}

##空行(光标在行首)补全 cd {{{
user-complete(){
    if [[ -n $BUFFER ]] ; then
        zle expand-or-complete
    else
        BUFFER="cd "
        zle end-of-line
        zle expand-or-complete
    fi }
zle -N user-complete
bindkey "\t" user-complete
##}}}

# 路径别名
# 进入相应的路径时只要 cd ~xxx
hash -d ADS="/home/xianglong/workspace/adsplatform"
hash -d SAYING="/home/xianglong/workspace/GeekSaying"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias top10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cls='clear'
alias l='ls -CF'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias la='ls -A'
alias vi='sudo vim'
alias vim='sudo vim'
alias grep="grep --color=auto"
alias gz='tar -czvf'
alias ntgz='tar -xzvf'
alias ps='ps -ef --forest'

alias aliyun='ssh -i ~/.ssh/aliyun root@115.28.143.213'

# git alias
alias gits='git status'
alias gitp='git pull'

