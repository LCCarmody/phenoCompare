# phenocluster.R
# author: Hannah Blau
# last modified on: 11 Sep 2017

# Function rcp *r*eads an n x n dissimilarity matrix, *c*lusters the data, and *p*lots the resulting clustering.
# Its paramter is a string giving the path to the input file containing the dissimilarity values.
# requires the cluster library (https://CRAN.R-project.org/package=cluster)
# returns the clustering object

rcp <- function(inputPath) {
  library("cluster")
  
  dissfrm <- read.table(inputPath)
  dissmat <- as.matrix(dissfrm)
  # agglomerative hierarchical clustering, diss argument tells agnes we are passing a dissimilarity matrix
  # default method is "average"; other choices are "complete", "flexible", "gaverage", "single", "ward", "weighted"  
  # "flexible" and "gaverage" require par.method argument
  ahclus <- agnes(as.dist(dissmat), diss = TRUE)
  plot(ahclus)
  return(ahclus)
}