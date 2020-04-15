#' Build Site
#' @noRd
build_site <- function(){
  # delete html
  files_delete <- list.files(pattern = ".html")
  files_delete <- c(files_delete, list.files(pattern = ".css"))
  files_delete <- c(files_delete, list.files(pattern = ".js"))
  files_delete <- c(files_delete, list.files(pattern = ".yml"))
  files_delete <- c(files_delete, list.files(pattern = ".svg"))
  unlink(files_delete)
  unlink("articles", recursive = TRUE)
  dir.create("articles")
  # Build the site
  pkgdown::build_site()
  
  # Copy to home directory
  rawPath <- "docs"
  dataPath <- "./"
  dataFiles <- list.files(rawPath, full.names = TRUE, recursive = TRUE) 
  file.copy(dataFiles, dataPath, overwrite = TRUE)
}
