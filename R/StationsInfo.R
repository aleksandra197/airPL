StationsInfo <- function(city=NULL, voivodeship=NULL) {

  # Displays info about air pollution measuring station.
  # Information from this function is neccessary to use ParamsInfo()
  # and GetData() functions.
  #
  # Args:
  #   city: string with city name, optional argument, when used
  #     returned data will be filterd for selected city.
  #   voivodeship: string with voivodeship name, optional argument, when used
  #     returned data will be filterd for selected city.
  #
  # Returns:
  #   View of created data frame.
  url = "http://api.gios.gov.pl/pjp-api/rest/station/findAll"
  encode.url <- URLencode(url)
  df <- fromJSON(content(GET(encode.url),as="text",encoding="UTF-8"))
  if(!is.null(city)){
    stopifnot(is.character(city))
    df<-df[df$city$name == city,]
  }
  if(!is.null(voivodeship)){
    stopifnot(is.character(voivodeship))
    df<-df[df$city$commune$provinceName == voivodeship,]
  }
  View(df)
}

