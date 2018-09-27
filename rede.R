# Library
library(igraph)

# Create data
set.seed(1)
data=matrix(sample(0:1, 100, replace=TRUE, prob=c(0.8,0.2)), nc=10)
network=graph_from_adjacency_matrix(data , mode='undirected', diag=F )

# Default network
par(mar=c(0,0,0,0))
plot(network)
