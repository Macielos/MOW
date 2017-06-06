library("recommenderlab")

collaborativeFiltering <- function (ratings, trainDatasetSize, recommendationMethod, 
                       similarityMethod, trainMethod, 
                       kCount, givenItems, nearestNeighbours, predictType) {
  
  print(paste(sep=", ", trainDatasetSize, recommendationMethod, similarityMethod, trainMethod, kCount, givenItems, nearestNeighbours));
  startTime <- Sys.time();
  
  matrix <- as(ratings, "realRatingMatrix");
  dataSets <- evaluationScheme(
    data = matrix, 
    method = trainMethod, 
    train = trainDatasetSize, 
    k = kCount,
    given = givenItems
  );
  
  if(recommendationMethod == "UBCF") {
    recParams = list(method=similarityMethod, nn=nearestNeighbours)
  } else {
    recParams <- list(method=similarityMethod)
  }
  
  print("Training...");
  model <- Recommender(
    data = getData(dataSets, "train"), 
    method = recommendationMethod, 
    param=recParams
  );
  
  print("Predicting...");
  predictions <- predict(model, getData(dataSets, "known"), type=predictType)
  
  print("Calcing accuracy...");
  #Root Mean Squared Error/Mean Squared Error/Mean Absolute Error
  accuracy <- calcPredictionAccuracy(predictions, getData(dataSets, "unknown"), byUser = FALSE)
  
  #print("Evaluating...")
  
  #evaluationResults = evaluate(dataSets, recommendationMethod, type=predictType)
  
  executionTime <- Sys.time() - startTime;
  print(executionTime);
  return(list(model, predictions, accuracy, executionTime))
}

#TODO 
#k-neighbours, similarity-threshold
#u Cichosza jest żeby przetestować na 2-3 zbiorach
