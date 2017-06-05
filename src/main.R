library("recommenderlab")

datasetDirectory = "data/ml-latest-small/"; #data/ml-latest-small/ lub data/ml-latest/
trainDatasetSize = 0.9;
recommendationMethod = "UBCF";              #"UBCF"/"IBCF"
similarityMethod = "Cosine";                #"Cosine/Pearson"
trainMethod = "split";                      #"split"/"cross-validation"/"bootstrap"
kCount = "10"                               #uzywane przy k-fold cross-validation i bootstrap

#TODO 
#k-neighbours, similarity-threshold
#bootstrap, k-fold cross-validation, wykorzystac evaluationScheme
#u Cichosza jest żeby przetestować na 2-3 zbiorach

ratings <- read.csv(paste(sep="", datasetDirectory, "ratings.csv"));
links <- read.csv(paste(sep="", datasetDirectory, "links.csv"));
movies <- read.csv(paste(sep="", datasetDirectory, "movies.csv"));
tags <- read.csv(paste(sep="", datasetDirectory, "tags.csv"));

matrix <- as(ratings, "realRatingMatrix")

#podzial na zbior trenujacy i testowy
maxUserId = ratings[which.max(ratings$userId),]$userId
trainUserIdLimit = round(maxUserId * trainDatasetSize)

trainMatrix <- matrix[1:trainUserIdLimit]
testMatrix <- matrix[(trainUserIdLimit+1):maxUserId]

#nauka
model <- Recommender(trainMatrix, method = recommendationMethod, param=list(method=similarityMethod))

#predykcja top 10 rekomendacji na zbiorze trenujacym
p <- predict(model, testMatrix, n=10)