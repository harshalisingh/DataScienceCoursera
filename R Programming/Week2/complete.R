complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files_list <- list.files(path = directory, full.names = TRUE)
  
  selectedFile <- data.frame()
  completeCases <- data.frame()
  nobs <- data.frame()
  
  for(i in id){
    selectedFile <- read.csv(files_list[i], header = TRUE)
    nobs <- sum(complete.cases(selectedFile))
    completeCases <- rbind(completeCases, data.frame(i, nobs))
  }
  
  completeCases
}