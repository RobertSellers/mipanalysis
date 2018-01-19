uploaddata <- function(mipfile, ...){
  if(substring(tolower(mipfile), nchar(mipfile)-3) != ".zip"){
    stop('Uploaded data needs to be .zip file. ');
  }
}
