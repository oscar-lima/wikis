# display git branch in prompt 
function git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

bash_color=32

if [ $(hostname) == "youbot-brsu-2-pc1" ]; then
   bash_color=31

elif [ $(hostname) == "youbot-brsu-2-pc2" ]; then
   bash_color=34
fi

#selest this one to show the complete terminal path:
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;${bash_color}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00;32m\] $(git_branch)\[\033[00m\]\$ '

#select this one to show the last folder in the path:
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;${bash_color}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00;32m\] $(git_branch)\[\033[00m\]\$ '

#alias

#cleaning temporary files recursively
alias clean='find . -name "*~" -type f -exec /bin/rm -fv -- {} +'
#mrc anaconda ipython notebook, spyder
alias enable_anaconda='bash --rcfile ~/scripts/conda-bashrc'
#mac external keyboard layout
alias ekey='bash ~/scripts/external_mac_german_keyboard_layout.sh'
#going back one directory shortcut
alias ..='cd ..'

#adding simlinks folder to env variable PATH, to call executables from anywhere
export PATH=$PATH:~/programs/simlinks
