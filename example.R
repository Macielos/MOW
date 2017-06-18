library("recommenderlab")
source("collaborativeFiltering.R")

#setwd("D:/workspace/MOW")

dataFile = "data/ml-latest-filtered50k_500_10/ratings.csv"; 

ratings <- read(dataFile);

result <- collaborativeFiltering(
  ratings=ratings,
  trainDatasetSize=0.9,
  recommendationMethod="UBCF", #"UBCF"/"IBCF"
  similarityMethod="Cosine",   #"Cosine/Pearson"
  trainMethod="cross-validation",         #"split"/"cross-validation"/"bootstrap"
  kCount=5,                    #uzywane przy k-fold cross-validation i bootstrap, dla split mozna dac 1
  givenItems=5,               #ile itemow per user brac do rekomendacji
  nearestNeighbours=5,
  goodRating=4,
  predictType="topNList")
print(result)
