print.airPL<-function(df){

  # Prints data.
  #
  # Args: airPL object
  #
  # Returns:
  #   Printed data.

  library(rjson)
  library(jsonlite)
  library(RCurl)
  library(dplyr)
  library(lubridate)
  library(xts)

  rownames(df)=NULL
  cat("Top 10 records for selected sensor:\n")
  cat("-----------------------------------------\n")
  head(df, 10)
}
