mip_calculations_v2 <- function(mipfile, water_level, ...){

    options(stringsAsFactors = FALSE)

    # #list files inside zip directory
    fns <- unzip(mipfile, junkpaths = TRUE, exdir = tempdir())

    mhp_filename <- paste0(substr(basename(mipfile),0,nchar(basename(mipfile))-8),".mhp")
    mip_file_data <- read.table(unz(mipfile, mhp_filename), header=T, quote="\"", sep="\t")

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

    mip_file_data$water_level <- water_level

    return(mip_file_data)

}