library("recommenderlab")

dataFile = "data/ml-latest-small/ratings.csv"; 

ratings <- read.csv(dataFile);

result <- collaborativeFiltering(
                        ratings, 
                       0.9,
                       "UBCF", #"UBCF"/"IBCF"
                       "Cosine",   #"Cosine/Pearson"
                       "split",         #"split"/"cross-validation"/"bootstrap"
                       1,                    #uzywane przy k-fold cross-validation i bootstrap, dla split mozna dac 1
                       20,               #ile itemow per user brac do rekomendacji
                       5,
                       "ratings")

