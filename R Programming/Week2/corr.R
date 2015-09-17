corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  source("complete.R")
  completeCases <- complete(directory)
  casesAboveThreshold <- completeCases[completeCases$nobs > threshold,1]
  filesFull <- list.files(path = directory, full.names = TRUE)
  correlations <- rep(NA,length(casesAboveThreshold))
  
  for (i in casesAboveThreshold) {
    file <- (read.csv(filesFull[i]))
    completeCases <- complete.cases(file)
    sulfate <- file[completeCases, 2]
    nitrate <- file[completeCases, 3]
    correlations[i] <- cor(x = sulfate, y = nitrate)
  }
  correlations <- correlations[complete.cases(correlations)]
  
}