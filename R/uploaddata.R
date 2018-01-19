uploaddata <- function(mipfile, ...){
  if(substring(tolower(mipfile), nchar(mipfile)-3) != ".zip"){
    stop('Uploaded data needs to be .zip file. ');
  }
  mhp_filename <- paste0(substr(basename(mipfile),0,nchar(basename(mipfile))-8),".mhp")
  mip_file_data <- clean_names(read.table(unz(mipfile, mhp_filename), header=T, quote="\"", sep="\t"))
  mip_file_data$test = 0
  return(mip_file_data)
}
