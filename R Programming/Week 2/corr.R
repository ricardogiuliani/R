corr <- function(directory, threshold = 0) {
  fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  df <- complete(directory)
  ids <- df[df["nobs"] > threshold, ]$id
  corrr <- numeric()
  
  for (i in ids) {
    mydata <- read.csv(fileList[i])
    dff <- mydata[complete.cases(mydata), ]
    corrr <- c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}