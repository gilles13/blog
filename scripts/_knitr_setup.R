# R/_knitr_setup.R
# robust knitr setup for blogdown / rmarkdown / Hugo page bundles

# récupérer le fichier Rmd en cours
input_file <- tryCatch(knitr::current_input(), error = function(e) NULL)

# vérifier si input_file est valide
if (is.null(input_file) || length(input_file) == 0 || !nzchar(input_file)) {
  # fallback : on ne connaît pas le Rmd courant
  slug <- "default"
} else {
  slug <- tools::file_path_sans_ext(basename(input_file))
}

# dossier des figures dans le bundle
img_dir <- file.path("content", "post", slug, "images")
dir.create(img_dir, recursive = TRUE, showWarnings = FALSE)

# options knitr globales
knitr::opts_chunk$set(
                      fig.path = paste0(img_dir, "/"), # doit finir par /
                      dev = "png",
                      dpi = 96,
                      fig.width = 7,
                      fig.height = 4
)

message("Knitr figures will be written to: ", normalizePath(img_dir, winslash = "/"))
