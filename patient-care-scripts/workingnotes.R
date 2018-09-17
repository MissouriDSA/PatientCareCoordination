count(fourdf, MRN)
library(plyr)
count(fourdf, MRN)
count(fourdf, "MRN")
distributionDF <- count(fourdf, "MRN")
summary(distributionDF)
plot(distributionDF)
sort(distributionDF)
sort(distributionDF, decreasing=FALSE)
sort(distributionDF$freq, decreasing=FALSE)
new <- sort(distributionDF$freq, decreasing=FALSE)
plot(new)
summary(new)
testone <- subset(new, new$freq > 3)
testone <- subset(new, "freq" > 3)
plot(testone)
testone
?subset
testone <- new[which(new$freq > 4)]
testone <- new[which(new$freq > 4),]
testone <- new[which(new$freq > 4),]
new
new
summary(new)
testone <- distributionDF[which(distributionDF$freq > 4)]
testone <- distributionDF[which(distributionDF$freq > 4),]
plot(testone)

testone <- distributionDF[which(distributionDF$freq > 6),]


sort(testone$freq, decreasing = FALSE)
sixLevel <- sort(testone$freq, decreasing = FALSE)

NROW(sixLevel)
plot(sixLevel)


testThree <- distributionDF[which(distributionDF$freq > 6), ]
testThree <- testThree[which(testThree$freq < 103), ]

testThree <- sort(testThree$freq, decreasing = FALSE)
plot(testThree)
NROW(testThree)
## 559 is the result I get, you might get a different result when you read your file .... lets not worry about that right now. 
