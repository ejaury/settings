alias activate_django13="source /Users/edwin/virtualenvs/django-1.3/bin/activate"
alias colordiff="colordiff -u"
alias diff="diff -u"
alias juventus="ssh edwin@juventus"
alias tree="tree -C"
alias linode="ssh edwin@173.255.251.237"
alias webserver="python ./manage.py runserver_plus"

alias fa="find . | grep -Ev \"(.svn|.git|tags$)\" | xargs grep --color"
alias fpy="find . -name \"*.py\" | grep -Ev \"(migrations|tests)\" | xargs grep --color"


# Django
# ======
alias dbshell="python ./manage.py debugsqlshell"
alias webserver="python ./manage.py runserver_plus"
alias webshell="python ./manage.py shell_plus"
alias graphdbmigs="python ./manage.py graphmigrations | dot -Tpng -omigrations.png"
alias graphmodels="python ./manage.py graph_models -a -g -o model_dependency_graph.png"

# Certificates
# ============
alias dumpcert="openssl x509 -text -noout -in"
alias dumpcrl="openssl crl -text -noout -inform DER -in"
alias dumpreq="openssl req -text -noout -in"
