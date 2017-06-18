library("recommenderlab")
source("collaborativeFiltering.R")

dataFile = "data/ml-latest-filtered10k_5000_100/ratings.csv"; 

ratings <- read(dataFile);

#ratings, trainDatasetSize, recommendationMethod, similarityMethod, trainMethod, 
                                       #kCount, givenItems, nearestNeighbours, goodRating, predictType 
headers = paste(sep=";", 
  "trainDatasetSize", 
  "recommendationMethod", 
  "similarityMethod", 
  "trainMethod", 
  "kCount", 
  "givenItems", 
  "nearestNeighbours", 
  "TP", 
  "FP", 
  "FN", 
  "TN", 
  "precision", 
  "recall", 
  "TPR", 
  "FPR", 
  "executionTime");
writeLine(headers, "tests/topNList.csv");

headersRatings = paste(sep=";", 
                "trainDatasetSize", 
                "recommendationMethod", 
                "similarityMethod", 
                "trainMethod", 
                "kCount", 
                "givenItems", 
                "nearestNeighbours", 
                "RMSE", 
                "MSE", 
                "MAE", 
                "executionTime");
writeLine(headersRatings, "tests/ratings.csv");

results <- list(
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 5, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 5, 5, 4, "topNList"),

  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "bootstrap",        5, 5, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "bootstrap",        5, 5, 5, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 5, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 5, 5, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 5, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 5, 5, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 5, 10, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 5, 10, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 5, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 5, 5, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 10, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 10, 5, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 10, 5, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 10, 5, 4, "topNList"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 20, 20, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 50, 50, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 20, 50, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 50, 20, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 10, 100, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 20, 100, 4, "topNList"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 100, 100, 4, "topNList")
)

results2 <- list(
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "split",            1, 5, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "split",            1, 5, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "bootstrap",        5, 5, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "bootstrap",        5, 5, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 5, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 5, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 5, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 5, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 5, 10, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 5, 10, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 5, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 5, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 10, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Pearson", "cross-validation", 5, 10, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "IBCF", "Cosine",  "cross-validation", 5, 10, 5, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "IBCF", "Pearson", "cross-validation", 5, 10, 5, 4, "ratings"),
  
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 20, 20, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 50, 50, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 20, 50, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 50, 20, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 10, 100, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 20, 100, 4, "ratings"),
  collaborativeFiltering(ratings, 0.9, "UBCF", "Cosine",  "cross-validation", 5, 100, 100, 4, "ratings")
  )