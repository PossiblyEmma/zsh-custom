gri() {
    amount=${1}
    if [[ -z $amount ]]
    then
        echo "Must provide a number of commits to rebase."
        echo  "-h for info on this command"
        return
    elif [[ $amount = "-h" ]]
    then
        echo "Alias for 'git rebase -i HEAD~{amount}'"
        echo "Must provide a number of commits to rebase"
        return
    elif ! [[ $amount =~ "^[0-9]+$" ]]
    then
        echo "That is not a number. Must provide a number of commits to rebase."
        echo "-h for info on this command."
        return
    fi
    git rebase -i HEAD~$amount
}

greset() {
    amount=${1}
    if [[ -z $amount ]]
    then
        echo "Must provide a number of commits to reset."
        echo  "-h for info on this command"
        return
    elif [[ $amount = "-h" ]]
    then
        echo "Alias for 'git reset HEAD~{amount}'"
        echo "Must provide a number of commits to reset"
        return
    elif ! [[ $amount =~ "^[0-9]+$" ]]
    then
        echo "That is not a number. Must provide a number of commits to reset."
        echo "-h for info on this command."
        return
    fi
    git reset HEAD~$amount
}
alias grh="greset"

gupdate() {
    flag=${1}
    if [[ $flag = "-h" ]]
    then
        echo "Pulls latest main from origin, then rebases the working branch onto main, then force pushes."
        echo "Use this to update your branch to reflect the most recent changes on main."
        return
    fi

    gcm
    gl
    gco -
    grbm
    gpf
}