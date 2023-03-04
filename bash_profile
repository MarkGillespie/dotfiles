alias school='cd ~/Box/CMU/2018-2019/Spring'
alias uniform='cd ~/Box/CMU/Uniformization'
alias unif='uniform'
alias blog='cd ~/Dropbox/Webdev/MathBlog/'
alias ddg='cd ~/Box/CMU/DDGClass'
alias notes='cd ~/Box/CMU/DDGClass/ddg-notes'
alias knit='cd ~/Box/knit/textiles-lab/textiles-code/knitting'
alias weave='cd ~/Box/CMU/2018-2019/Spring/textiles/weave'
alias flow='cd ~/Dropbox/Code/EigenvalueFlow'

#export DISPLAY=:0
#alias vim='/usr/local/bin/vim --servername whatever'
alias vim='mvim -v'
alias oni='/Applications/Oni.app/Contents/MacOS/Oni'

PS1="\w \u$ "

# https://www.cnet.com/news/tip-set-the-terminal-to-store-only-unique-commands-in-the-history/
# ignore duplicate commands in history
HISTCONTROL=ignoredupds

# Initialize Houdini Environment
alias hou='cd /Applications/Houdini/Current/Frameworks/Houdini.framework/Versions/Current/Resources/ && source houdini_setup && cd ~'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/markgillespie/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/markgillespie/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/markgillespie/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/markgillespie/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

