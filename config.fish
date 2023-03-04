alias school 'cd ~/Box/CMU/2018-2019/Spring'
alias uniform 'cd ~/Box/CMU/Uniformization'
alias unif 'uniform'
alias blog 'cd ~/Dropbox/Webdev/MathBlog/'
alias ddg 'cd ~/Box/CMU/DDGClass'
alias code 'cd ~/Documents/Code'
alias notes 'cd ~/Box/CMU/DDGClass/ddg-notes'
alias knit 'cd ~/Box/knit/textiles-lab/textiles-code/knitting'
alias weave 'cd ~/Box/CMU/2018-2019/Spring/textiles/weave'
alias flow 'cd ~/Dropbox/Code/EigenvalueFlow'

alias vim 'mvim -v'
alias oni '/Applications/Oni.app/Contents/MacOS/Oni'

function hou
    set loc "$PWD"
    cd /Applications/Houdini/Current/Frameworks/Houdini.framework/Versions/Current/Resources/
    exec bash -c "source houdini_setup; cd $loc; exec fish"
end

set PATH /usr/local/opt/coreutils/libexec/gnubin:$PATH
set PATH /usr/local/opt/gnu-sed/libexec/gnubin:$PATH
set PATH /usr/local/Cellar/tidy-html5/5.6.0/bin:$PATH

set PATH /usr/local/opt/llvm/bin:$PATH
set PATH /Applications/meshlab.app/Contents/MacOS:$PATH
set PATH /Users/mgillesp/.local/bin:$PATH
set PATH /Users/markgillespie/miniconda3/bin:$PATH


# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# this function may be required
function fish_title
  true
end
