rm(list=ls(all=TRUE))
library(igraph)
library(plyr)
library(ggplot2)
#library(xlsx)
library(gdata)
igraph.options(print.vertex.attributes = TRUE)
igraph.options(print.edge.attributes = TRUE)

## Read the first tab of the spreadsheet with no message text in
df = read.xls("msg-center-no-message.xlsx", sheet = 1, header = TRUE)
##Make the FIN variable a factor so we get a count
df$finfactor <- as.factor(df$FIN)

## Repeat for the rest of the spreadsheet tabs. 
df2 = read.xls("msg-center-no-message.xlsx", sheet = 2, header = TRUE)
df2$finfactor <- as.factor(df2$FIN)
twodf <- rbind(df, df2)

df3 = read.xls("msg-center-no-message.xlsx", sheet = 3, header = TRUE)
df3$finfactor <- as.factor(df3$FIN)
threedf <- rbind(twodf, df3)

df4 = read.xls("msg-center-no-message.xlsx", sheet = 4, header = TRUE)
df4$finfactor <- as.factor(df4$FIN)
fourdf <- rbind(threedf, df4)

#count(fourdf, MRN)

el <- fourdf

el <- df

## This reorders the data frame columns to put the "From and To" 
## into the first two columns, which iGraph needs
data <- el[c(6,7,1,2,3,4,5,8,9,10,11,12,13,14)]
el <- data

  # THIS IS HOW YOU WOULD FILTER ALL THE NETWORKS
  # subsetEL <- el
  # based on variable values

  #To build the networks for individual MRN's apply a filter like this
  # subsetEL <- el[ which(el$MRN == "00-00-02-72-1"),] 

  #To build networks for a particular staff member, do something like this

# ====================================================
## Fake clinic list file, fill in your own
ClinicList <- read.csv(file="lori-clinic-list.csv")
## Fake clinic count for testing
NumberOfClinics = 3; 

## Iterating 
for (i in 1:length(NumberOfClinics)) {
  
  # subsetting code by clinic fakeout 
  theClinicNum <- i
  ## PseudoCode for identifying clinics by id in list
  thisClinic <- ClinicList[i]
  
  ## You'll have to look at the data to identify which clinic in this iteration
  # subsestEL <- el[which(el$clinic_column),]

  ## Comment this out and replace it with whats above
    subsetEL <- el[which(el$FROM_STAFF == "Alioto RN, Armine A"),]

  # subsetEL <- el
  
  ## This graph is directed
  disAll <-graph.data.frame(subsetEL, directed=TRUE)
  
  V(disAll)$label <- V(disAll)$name

  layout_with_sugiyama(disAll)
  
  # weights not calculated yet
  # E(disAll)$width <- E(disAll)$weight/25
  
  E(disAll)$arrow.size <-0.2
  
  #	layout.spring(disAll,weights=E(disAll)$weight)
  
  # size of sphere calculated based on the betweenness value
  V(disAll)$size <-(3+sqrt(sqrt(betweenness(disAll, v=V(disAll)))))
  g<-disAll
  
  ## Note that this only works if the graph is fully connected.  In some cases you could 
  ## find that we have small subnets that are not connected to other subnets
  ## When that happens the spinglass won't run and everything will be the same color. 
  if (is.connected(g)){
    com <- spinglass.community(g, spins=8)
    V(g)$color <- com$membership+1
  }

  layout_with_sugiyama(g)
  
  #output the file
  
  filename=paste("community",theClinicNum,"b2.pdf")
  pdf(filename)
  plot(g, vertex.label.dist=.5, vertex.label.cex=.3, vertex.label.color="black",
       vertex.frame.color="white")
  dev.off()
  ### End of the for loop
  print(paste("the i is ", theClinicNum))
}

# ====================================================

  
## Post processing of filtered graph calculations
V(g)
degreed<-as.data.frame(degree(g))
vertex(g)
plot(g)
#STOP HERE FOR INDIVIDUAL NETWORK

### Looking at communication across the entire network
MSGCenterAll <-graph.data.frame(el, directed=TRUE)
i=2
E(MSGCenterAll)$arrow.size <-0.2

# size of sphere calculated based on the betweenness value
V(MSGCenterAll)$size <-(3+sqrt(sqrt(betweenness(MSGCenterAll, v=V(MSGCenterAll)))))

filename=paste("community",i,"b2.pdf")
pdf(filename)
plot(MSGCenterAll, vertex.label.dist=.5, 
     vertex.label.cex=.3, 
     width=32,
     height=32,
     vertex.label.color="black",
     vertex.frame.color="white")
dev.off()

filename=paste("community",i,"b3.pdf")
pdf(filename)
plot(subsetEL, vertex.label.dist=.5, 
     vertex.label.cex=.3, 
     width=32,
     height=32,
     vertex.label.color="black",
     vertex.frame.color="white")
dev.off()



## Post processing of filtered graph calculations
V(MSGCenterAll)
degreed<-as.data.frame(degree(MSGCenterAll))
vertex(MSGCenterAll)
plot(MSGCenterAll)

#describing the dataset

NROW(el)
NROW(fourdf)
NROW(threedf)
NROW(twodf)
NROW(df)
summary(el)


