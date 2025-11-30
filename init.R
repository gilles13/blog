# initialisation du blog


library("blogdown")
getwd()
list.files(path = ".", recursive = TRUE)

# blogdown::install_hugo()
# blogdown::new_site(sample = TRUE, dir = ".", force = TRUE)
# blogdown::install_theme("theNewDynamic/gohugo-theme-ananke")
# blogdown::install_theme("wowchemy/starter-hugo-academic")
# blogdown::install_theme("yihui/hugo-lithium", force = TRUE)

blogdown::new_post(title = "Compteur linky", ext = ".Rmd", subdir = "post")

rmarkdown::render_site(encoding = "UTF-8")
blogdown::build_site()
blogdown::serve_site()
blogdown::stop_server()

rmarkdown::render(
   input = "./content/post/2025-11-29-compteur-linky/index.Rmd",
   output_format = "github_document",
   clean = FALSE,
   encoding = "UTF-8")
