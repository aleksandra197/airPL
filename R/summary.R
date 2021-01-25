summary.airPL<-function(df){

  # Prints descriptive statistics.
  #
  # Args: airPL object
  #
  # Returns:
  #   Printed descriptice statistics.

  cat("Descriptive statistics for air pollution data:\n")
  cat("-------------------------------------------------\n")
  summary.default(df$value)
}
