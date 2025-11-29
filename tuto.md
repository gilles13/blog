# tuto

Informations sur la création du repo et son alimentation

## création du repo

1. dans github, créer un repo (create, new repository)

2. dans la console

+ cd ~/mon/rep/de/projets/git/

+ mkdir blog

+ cd blog/

+ echo "# blog" >> README.md

+ git init

+ git add README.md

+ git commit -m "add readme"

+ git branch -M master

+ git remote add origin git@github.com:gilles13/blog.git

+ git push -u origin master
