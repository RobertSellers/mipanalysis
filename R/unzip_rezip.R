unzip_rezip <- function(mipfile, ...){
  
    options(stringsAsFactors = FALSE)

    if(substring(tolower(mipfile), nchar(mipfile)-3) != ".zip"){
        stop('Uploaded data needs to be .zip file. ');
    }
    
    # #list files inside zip directory
    fns <- unzip(mipfile, junkpaths = TRUE, exdir = tempdir())

    # compress
    res <- zip(zipfile=fz, files=names(fs), flags = flags)
    # # cleanup
    # lapply(names(fs), unlink)
    # # return path
    # attr(fz, "contentType") =  "application/zip"
    # return(invisible(fz))

    # zipack(mipfile, fns)

    mhp_filename <- paste0(substr(basename(mipfile),0,nchar(basename(mipfile)) - 8),".mhp")
    unzipped_file <- unz(mipfile, mhp_filename)
    # temp <- tempfile(mipfile)
    mip_file_data <- read.table(unzipped_file, header=T, quote="\"", sep="\t")


    col_names <- c("Depth (ft)",	
                    "EC (mS/m)",	
                    "ROP (ft/min)",	
                    "Temp. Min (deg C)",	
                    "Temp. Max (deg C)",	
                    "MIP Pressure (psi)",	
                    "MIP Flow (mL/min)",	
                    "Depth (m)",	
                    "ROP (m/min)",
                    "MIP Pressure (kPa)",
                    "Detector 1 Min (uV)",
                    "Detector 1 Max (uV)",
                    "Detector 2 Min (uV)",
                    "Detector 2 Max (uV)",
                    "Detector 3 Min (uV)",
                    "Detector 3 Max (uV)",
                    "Detector 4 Min (uV)",
                    "Detector 4 Max (uV)",
                    "HPT Press. Min (psi)",
                    "HPT Press. Avg (psi)",
                    "HPT Press. Max (psi)",
                    "HPT Flow Min (mL/min)",
                    "HPT Flow Avg (mL/min)",
                    "HPT Flow Max (mL/min)",
                    "HPT Line Press. Min (psi)",
                    "HPT Line Press. Avg (psi)",
                    "HPT Line Press. Max (psi)",
                    "HPT Press. Min (kPa)",
                    "HPT Press. Avg (kPa)",
                    "HPT Press. Max (kPa)",
                    "HPT Line Press. Min (kPa)",
                    "HPT Line Press. Avg (kPa)",
                    "HPT Line Press. Max (kPa)",
                    "HPT Screen Depth (ft)")

    colnames(mip_file_data) <- col_names
    mip_file_data[ mip_file_data == 'n/a' ] <- NA
    mip_file_data <- sapply(mip_file_data, as.numeric)

}