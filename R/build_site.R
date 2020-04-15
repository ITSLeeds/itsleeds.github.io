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
  dataFiles <- list.files("docs", full.names = TRUE) 
  file.copy(dataFiles, "./", overwrite = TRUE)
  
  dataFiles <- list.files("docs/articles/", full.names = TRUE) 
  file.copy(dataFiles, "./articles", overwrite = TRUE)
  
  dir.create("articles/images")
  dataFiles <- list.files("docs/articles/images", full.names = TRUE) 
  file.copy(dataFiles, "./articles/images", overwrite = TRUE)
  
  
}
