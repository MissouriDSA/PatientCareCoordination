#setwd("~/msgcenter")
parser <- function(file) {
  library(RecordLinkage)
  setwd("/Volumes/SeansRAIDBaby/Dropbox/Work/00. Active Projects/359. Patient Care Networks/Care-Coordination-Box/Message Center Data")
  test <- read.csv(file)
  trythis <- compare.dedup (test, strcmp = TRUE, strcmpfun = levenshteinSim)
  
}
# test <- read.csv("msg-center1.csv")

