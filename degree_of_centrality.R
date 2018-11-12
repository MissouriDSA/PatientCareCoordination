
rm(list=ls(all=TRUE))
library(igraph)
library(plyr)
library(ggplot2)
#library(xlsx)
library(gdata)
igraph.options(print.vertex.attributes = TRUE)
igraph.options(print.edge.attributes = TRUE)

## Read the first tab of the spreadsheet with no message text in
df = read.xls("2013 - July01-Dec31-no-message.xlsx", sheet = 1, header = TRUE)[, c(6,7,11,13)]
##Make the FIN variable a factor so we get a count
df$finfactor <- as.factor(df$FIN)

uniqueMRN=count(unique(df$MRN))
uniqueFIN=count(unique(df$FIN))

df$finfactor

########
#g <- make_star(10)
#E(g)$weight <- seq(ecount(g))
#strength(g)
#strength(g, mode="out")
#strength(g, mode="in")
########

dirG <- graph_from_data_frame(df)
degree <- degree(dirG)
plot(degree)
degree=write.csv(degree)[, c(5)]

df1=(df,degree)

# No weights, a warning is given
g <- make_ring(10)
strength(g)

library(igraph)
df = read.xls("2013 - July01-Dec31-no-message.xlsx", sheet = 1, header = TRUE)[, c(6,7,11,13)]
df2 <- data.frame(
  "from" = df$FROM_STAFF,
  "to" = df$TO_PROV
)

##Make the FIN variable a factor so we get a count
df$finfactor <- as.factor(df$FIN)

# create an igraph object from the dataframe, which essentially is a list
# of edges between nodes
g <- graph_from_data_frame(df, directed = TRUE) # or FALSE

# each edge receives "finfactor" as an attribute
g <-
  set_edge_attr(g,
                name = "finfactor",
                value = df$finfactor)

# calculate betweenness of nodes and store it in an attribute "color" of the
# vertices. The color-attribute is treated specially when plotting graphs.
V(g)$color <- betweenness(g)

plot.igraph(g,
            # plot edge labels from the "FIN" attribute
            edge.label = edge_attr(g, "finfactor"),
            # specify the palette of colours to use when plotting vertices
            palette = heat.colors(n = 99))

# same as above; we multiply by 100 to make sure all values are > 0, otherwise
# the colour will be interpreted as 0 (usually, white)
V(g)$color <- (eigen_centrality(g)$vector) * 100

V(g)$doc <- (eigen_centrality(g)$vector) 

V(g)$name <- paste(V(g)$name, " ", V(g)$doc)

#assign weights based on frequency of finfactor?
# assign edge weights based on the last digit of "finfactor"/frequency of "finfactor
E(g)$weight <- E(g)$finfactor %% 10

plot.igraph(
  g,
  edge.label = edge_attr(g, "FIN"),
  edge.width = E(g)$weight,
  edge.arrow.size = .8,
  palette = heat.colors(n = 99)
)
