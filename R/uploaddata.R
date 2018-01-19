uploaddata <- function(mipfile, ...){
  if(substring(tolower(mipfile), nchar(mipfile)-3) != ".mhp"){
    stop('Uploaded data needs to be .mhp file. ');
  }
    mydata <- read.table(mipfile, sep="\t", header=TRUE)
  return(mydata)  
}
