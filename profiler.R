library(profvis)
library(ggplot2)

profvis({
  source("/Volumes/SeansRAIDBaby/github/PatientCareCoordination/RecordLinkage.R")
  k <- parser("msg-center1.csv")
  print(k)
})