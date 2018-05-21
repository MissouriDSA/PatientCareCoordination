setwd("~/msgcenter")

library(RecordLinkage)

test <- read.csv("msg-center1.csv")

trythis <- compare.dedup (test, strcmp = TRUE, strcmpfun = levenshteinSim)
