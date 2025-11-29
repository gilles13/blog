# initialisation du blog


library("blogdown")

list.files(path = ".")
getwd()

blogdown::install_hugo()

blogdown::new_site(sample = TRUE, dir = ".", force = TRUE)

# blogdown::install_theme("theNewDynamic/gohugo-theme-ananke")
# blogdown::install_theme("wowchemy/starter-hugo-academic")
# blogdown::install_theme("yihui/hugo-lithium", force = TRUE)
# blogdown::install_theme("adityatelange/hugo-PaperMod")
# blogdown::install_theme("halogenica/beautifulhugo")
# blogdown::install_theme("pacollins/hugo-future-imperfect-slim")
# blogdown::install_theme("calintat/minimal")
# blogdown::install_theme("digitalcraftsman/hugo-livestyle", theme_example = TRUE)
# blogdown::install_theme("lemummie/minimalist-hugo", theme_example = TRUE)
# blogdown::install_theme("vimux/mainroad", theme_example = TRUE)

blogdown::new_post(title = "Introduction à AH", ext = ".Rmd", subdir = "post")

blogdown::build_site()
blogdown::serve_site()
blogdown::stop_server()

# DANGER
# new_site(dir = "mon-blog")
# blogdown::new_site(dir = ".", format = "toml")
