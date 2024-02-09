function passook() {
    if [ "$1" != "" ]
    then
        pwgen -Bs $1 1 | tr -d '\n' | pbcopy
    else
        pwgen -Bs 20 1 | tr -d '\n' | pbcopy
    fi
}
