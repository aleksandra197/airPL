ParamsInfo<-function(station.id) {

  # Displays info about sensors available for selected air pollution measuring station.
  # Information from this function is neccessary to use GetData() function.
  #
  # Args:
  #   station.id: integer, station ID that user can get from StationsInfo() function.
  #
  # Returns:
  #   View of created data frame.

  stopifnot(is.numeric(station.id))
  url = "http://api.gios.gov.pl/pjp-api/rest/station/sensors/"
  encode.url <- URLencode(paste(url,toString(station.id),sep=""))
  df <- jsonlite::fromJSON(content(GET(encode.url),as="text",encoding="UTF-8"))

  df<-df[df$stationId == station.id,]
  View(df)
}
