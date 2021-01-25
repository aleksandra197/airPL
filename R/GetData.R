GetData<- function(sensor.ids, start.date, end.date){

  # Returns air pollution data for selected sensor in selected time period.
  #
  # Args:
  #   sensor.id: integer, station ID that user can get from StationsInfo() function.
  #   start.date: string with start date in YYYY-MM-DD format
  #   end.date: string with end date in YYYY-MM-DD format
  #
  # Returns:
  #   air PL object - data frame with airpollution data (date,values).
  #stopifnot(is.vector(sensor.ids))
  df<-data.frame()
  for(i in 1:length (sensor.ids)){
    url = "http://api.gios.gov.pl/pjp-api/rest/data/getData/"
    encode.url <- URLencode(paste(url,toString(sensor.ids[i]),sep=""))
    temp <- fromJSON(getURL(encode.url))
    temp<-temp$values %>%
          filter(date >= as.Date(start.date)& date<= as.Date(end.date))
    df<-data.frame(rbind(df,temp))
  }

  me <- df
  class(me)<-append(class(me),'airPL')
  return(me)
}

