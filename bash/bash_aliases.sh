export TZ='Asia/Shanghai'

function pwdgen() {
    if [ $# -eq 0 ];
    then
        count=10
    else
        count=$1
    fi
    cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 16 | head -n $count
}

function pwdgeni() {
    cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 16 | head -n 5000 | grep -i "$1" | head -n 10
}

extract() {
    if [ -f $1 ];
    then
        case $1 in
            *.tar.bz2)  tar xjf $1     ;;
            *.tar.gz)   tar xzf $1     ;;
            *.bz2)      bunzip2 $1     ;;
            *.rar)      unrar e $1     ;;
            *.gz)       gunzip $1      ;;
            *.tar)      tar xf $1      ;;
            *.tbz2)     tar xjf $1     ;;
            *.tgz)      tar xzf $1     ;;
            *.zip)      unzip $1       ;;
            *.Z)        uncompress $1  ;;
            *.7z)       7z x $1        ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function mcd() {
    mkdir -p "$1" && cd "$1";
}

alias .='cd ..'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lashF'
alias ls='ls --color=auto'

alias json="python -mjson.tool"
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'
