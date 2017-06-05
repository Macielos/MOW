library("recommenderlab")

dataFile = "data/ml-latest-small/ratings.csv"; 

ratings <- read.csv(dataFile);

result <- collaborativeFiltering(
                       ratings = ratings, 
                       trainDatasetSize = 0.9,
                       recommendationMethod = "UBCF", #"UBCF"/"IBCF"
                       similarityMethod = "Cosine",   #"Cosine/Pearson"
                       trainMethod = "split",         #"split"/"cross-validation"/"bootstrap"
                       kCount = 1,                    #uzywane przy k-fold cross-validation i bootstrap, dla split mozna dac 1
                       givenItems = 20,               #ile itemow per user brac do rekomendacji
                       predictType = "ratings")
