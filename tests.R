library("recommenderlab")

dataFile = "data/ml-latest-small/ratings.csv"; 

ratings <- read.csv(dataFile);

results <- list(
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine", "split", 1, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split", 1, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine", "split", 1, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "split", 1, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine", "bootstrap", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "bootstrap", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine", "bootstrap", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "bootstrap", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine", "cross-validation", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine", "cross-validation", 10, 20, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 10, 20, "ratings")
)