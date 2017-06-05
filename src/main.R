library("recommenderlab")

collaborativeFiltering <- function (ratings, trainDatasetSize, recommendationMethod, 
                       similarityMethod, trainMethod, 
                       kCount, givenItems, predictType) {
  matrix <- as(ratings, "realRatingMatrix");
  dataSets <- evaluationScheme(
    data = matrix, 
    method = trainMethod, 
    train = trainDatasetSize, 
    k = kCount,
    given = givenItems
  );
  model <- Recommender(
    data = getData(dataSets, "train"), 
    method = recommendationMethod, 
    param=list(method=similarityMethod)
  );
  
  predictions <- predict(model, getData(dataSets, "known"), type=predictType)
  
  #Root Mean Squared Error/Mean Squared Error/Mean Absolute Error
  accuracy <- calcPredictionAccuracy(predictions, getData(dataSets, "unknown"), byUser = FALSE)
  
  evaluationResults = evaluate(dataSets, recommendationMethod, type=predictType)
  
  return(list(model, predictions, accuracy, evaluationResults))
}

#TODO 
#k-neighbours, similarity-threshold
#u Cichosza jest żeby przetestować na 2-3 zbiorach
