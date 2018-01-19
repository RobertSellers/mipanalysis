mip_calculations <- function(mipfile, ...){
    mip_file_data <- read.table(mipfile, header=T, quote="\"", sep="\t")
    mip_file_data$test = 0
    return(mip_file_data)
}
