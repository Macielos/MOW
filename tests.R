library("recommenderlab")

#setwd("D:/workspace/MOW")

dataFile = "data/ml-latest-sample/ratings.csv"; 

ratings <- read.csv(dataFile);

results <- list(
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 10, 5, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 10, 5, "ratings"),

  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "bootstrap",        5, 10, 5, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "bootstrap",        5, 10, 5, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 10, 5, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 10, 5, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 10, 10, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 10, 10, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 20, 10, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 20, 10, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "split",            1, 10, 5, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "split",            1, 10, 5, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 10, 5, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 10, 5, "topNList")
  
 # collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "bootstrap",        5, 10, 5, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "bootstrap",        5, 10, 5, "ratings"),

#  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 10, 5, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 10, 5, "ratings")
#  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "split",            1, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "split",            1, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "bootstrap",        5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "bootstrap",        5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "bootstrap",        5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "bootstrap",        5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 10, 3, "ratings"),
#  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 10, 3, "ratings")
)
