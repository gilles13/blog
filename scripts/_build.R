# scripts/_build.R
# Pré-build du site avec les chunks setup déjà présents dans chaque Rmd

library(rmarkdown)
library(blogdown)

# trouver tous les index.Rmd dans content/post
rmd_files <- list.files(
  "content/post",
  pattern = "index\\.Rmd$",
  recursive = TRUE,
  full.names = TRUE
)

# rendre chaque Rmd individuellement
for (rmd in rmd_files) {
  message("Rendering ", rmd)
  rmarkdown::render(
    input = rmd,
    encoding = "UTF-8",
    quiet = TRUE   # tu peux mettre FALSE pour voir les logs
  )
}

# construire le site Hugo complet
blogdown::build_site()
