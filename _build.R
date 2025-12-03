#!/usr/bin/env Rscript

# ───────────────────────────────
# Se placer automatiquement à la racine du projet Hugo
# ───────────────────────────────
find_project_root <- function() {
  path <- normalizePath(getwd())
  for (i in 1:6) {
    if (file.exists(file.path(path, "config.yaml")) ||
        file.exists(file.path(path, "config.toml"))) {
      return(path)
    }
    path <- dirname(path)
  }
  stop("Impossible de localiser la racine Hugo (config.yaml/toml introuvable)")
}

project_root <- find_project_root()
setwd(project_root)
message("Project root: ", project_root)

# ───────────────────────────────
# Construire tous les Rmd → md (front matter YAML correct)
# ───────────────────────────────
library(blogdown)
message("Rendering all Rmd files via blogdown::build_site()...")
blogdown::build_site()

# ───────────────────────────────
# Générer public/ avec Hugo
# ───────────────────────────────
message("Building site with Hugo...")
hugo_output <- system2("hugo", args = c("-D"), stdout = TRUE, stderr = TRUE)
cat(hugo_output, sep = "\n")

# ───────────────────────────────
# Déploiement Netlify (optionnel)
# ───────────────────────────────
if (Sys.getenv("NETLIFY_AUTH_TOKEN") != "" && Sys.getenv("NETLIFY_SITE_ID") != "") {
  message("Deploying to Netlify...")
  cli <- system2(
    "netlify",
    args = c(
      "deploy",
      "--prod",
      "--dir=public",
      paste0("--auth=", Sys.getenv("NETLIFY_AUTH_TOKEN")),
      paste0("--site=", Sys.getenv("NETLIFY_SITE_ID"))
    ),
    stdout = TRUE, stderr = TRUE
  )
  cat(cli, sep = "\n")
} else {
  message("NETLIFY_AUTH_TOKEN or NETLIFY_SITE_ID is missing → skipping deploy.")
}
message("✔ Build complete.")
