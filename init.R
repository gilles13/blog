# initialisation du blog et des posts

getwd()

# blogdown::install_hugo()
# blogdown::new_site(sample = TRUE, dir = ".", force = TRUE)
# blogdown::install_theme("yihui/hugo-lithium", force = TRUE)

blogdown::new_post(title = "compteur-linky", ext = ".Rmd", subdir = "post")

blogdown::new_post(title = "math-en-r",
                   ext = ".Rmd", subdir = "post")

blogdown::new_post(title = "compta-nat",
                   ext = ".Rmd", subdir = "post")

# rmarkdown::render_site(encoding = "UTF-8")
blogdown::build_site()
blogdown::serve_site()
blogdown::stop_server()
