#neccessary libraries

library(rjson)
library(jsonlite)
library(RCurl)
library(dplyr)
library(lubridate)
library(xts)
library(httr)

StationsInfo()
ParamsInfo(station.id = 114)

#test code
x<-GetData(sensor.id=92, start.date="2019-01-01", end.date="2021-01-24")
plot.airPL(x, color='red')
print(x)
summary(x)

