alias school 'cd ~/Box/CMU/2018-2019/Spring'
alias uniform 'cd ~/Box/CMU/Uniformization'
alias unif 'uniform'
alias blog 'cd ~/Dropbox/Webdev/MathBlog/'
alias ddg 'cd ~/Box/CMU/DDGClass'
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
