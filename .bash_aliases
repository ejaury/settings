# Custom aliases
alias django-test="./manage.py test --config=conf/setup.cfg"
alias diff="diff -u"
alias minicom="minicom -b 9600"
alias git-diff='git diff --color'
alias rdesktop='rdesktop -g 1280x760'
alias svnadd-all="svn status | grep "^\?" | awk '{print \$2}' | xargs svn add" 
alias tree="tree -C"
