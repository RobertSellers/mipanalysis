uploaddata <- function(mipfile, ...){
  if(substring(tolower(mipfile), nchar(mipfile)-3) != ".csv"){
    stop('Uploaded data needs to be .mhp file. ');
  }
  
  #read csv data
  # mydata <- read.csv(mipfile, row.names = NULL, stringsAsFactors=FALSE, ...);
  read.table(mipfile, sep="\t", header=TRUE)

  #convert columns with 7 or less levels to factors
  # for(i in seq_along(mydata)){
  #   if(length(unique(mydata[[i]])) < 8){
  #     mydata[[i]] <- as.factor(mydata[[i]]);
  #   }
  # }
  
  #return dataset
  return(mydata)  
}
