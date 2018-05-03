rm(list=ls(all=TRUE))
library(igraph)
library(ggplot2)
library(xlsx)
library(gdata)
igraph.options(print.vertex.attributes = TRUE)
igraph.options(print.edge.attributes = TRUE)

df = read.xls("msg-center.xlsx", sheet = 1, header = TRUE)

# setwd("~/GitHub/Group-Informatics/R-Code/Student Data - LASI 2016/CourseData-Provenance/SNA_Ready_mdl_forum_posts_scrubbed_csv")

### This is data about discussions
### Developer discussions only
files <- system("ls edge*.csv",intern=T)

### Temp for testing file structure
el <- read.table(files[1], header=TRUE, sep=",", dec=".", fill=TRUE)
str(el)

el$FROM_STAFF

test <- read.xlsx



#==========================


#==========================

for (i in 1:length(files)) {
  
  i = 1
  fileNamer = as.character(i)
  #Import the files
  #	el <- read.table(files[i], header=TRUE, dec=".", fill=TRUE)
  # for a comma seperated file, you just add in the parameter "sep=","" 
  el <- read.table(files[i], header=TRUE, sep=",", dec=".", fill=TRUE)
  
  # based on variable values
#  subsetEL <- el[ which(el$class_course_id == 55113),] 
  
  #	subsetEL <- subset(el, class_course_id = 40491, select= c(userid_from, userid_to,  id,created, class_course_id))	
  #	subsetEL <- subset(el, class_course_id = c(40491, 51891, 55113, 55290)) 	
  #	subsetEL <- subset(el, class_course_id == 40491 || class_course_id == 51891)
  #or       
 subsetEL <- el
  
  ## This graph is directed
  disAll <-graph.data.frame(el, directed=TRUE)
  
  V(disAll)$label <- V(disAll)$name
  # layout.fruchterman.reingold
  # until now, I have obfuscated the process of weighting data by
  # including data sets that are already weighted 
  
  # layout.kamada.kawai(disAll, weights=E(disAll)$weight)
  # for an undirected graph
  # layout_with_kk(disAll)
  
  layout_with_sugiyama(disAll)
  
  # weights not calculated yet
  # E(disAll)$width <- E(disAll)$weight/25
  
  E(disAll)$arrow.size <-0.4
  
  #	layout.spring(disAll,weights=E(disAll)$weight)
  
  # size of sphere calculated based on the betweenness value
  V(disAll)$size <-(3+sqrt(sqrt(betweenness(disAll, v=V(disAll)))))
  g<-disAll
  
  if (is.connected(g)){
    com <- spinglass.community(g, spins=8)
    V(g)$color <- com$membership+1
  }
  
  # This seems redundent 
  # g <- set.graph.attribute(g, "layout", layout.kamada.kawai(g))
  
  layout_with_sugiyama(g)
  
  #output the file
  filename=paste("community",i,"b2.pdf")
  pdf(filename)
  #plot.igraph(g)
  plot(g, vertex.label.dist=.5, vertex.label.cex=.7, vertex.label.color="black",
       vertex.frame.color="white")
  dev.off()
}

