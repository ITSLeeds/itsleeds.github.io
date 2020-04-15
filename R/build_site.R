#' Build Site
#' @noRd
build_site <- function(){
  # delete html
  files_delete <- list.files(pattern = ".html")
  files_delete <- c(files_delete, list.files(pattern = ".css"))
  files_delete <- c(files_delete, list.files(pattern = ".js"))
  files_delete <- c(files_delete, list.files(pattern = ".yml"))
  files_delete <- c(files_delete, list.files(pattern = ".svg"))
  files_delete <- c(files_delete, list.files(pattern = ".png"))
  unlink(files_delete)
  unlink("articles", recursive = TRUE)
  unlink("docs", recursive = TRUE)
  unlink("reference", recursive = TRUE)
  #dir.create("articles")
  # Build the site
  devtools::document()
  pkgdown::build_site()
  
  # Copy to home directory
  dirs <- list.dirs("docs", recursive = TRUE)
  dirs <- dirs[2:length(dirs)]
  dirs <- gsub("docs/","",dirs)
  for(i in dirs){
    dir.create(i)
  }
  
  files <- list.files("docs", full.names = TRUE, recursive = TRUE)
  for(i in files){
    file.copy(i, gsub("docs/","",i))
  }
  unlink("docs", recursive = TRUE)
  
}
