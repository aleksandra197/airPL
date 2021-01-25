plot.airPL<-function(df, color=NULL){

  # Converts data frame to time series object and displays plot.
  #
  # Args: airlPL object
  #
  # Returns:
  #   Plot.
  if(is.null(color)){
    color='green'
  }
  df<-na.omit(df)
  df$date<-as_datetime(df$date)
  ts <- xts::xts(df$value, order.by=df$date)
  xts::plot.xts(ts)
  lines(ts,col=color)
}
