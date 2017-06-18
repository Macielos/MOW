library("recommenderlab")
source("utils.R")

collaborativeFiltering <- function (
  ratings, 
  trainDatasetSize, 
  recommendationMethod, 
  similarityMethod, 
  trainMethod, 
  kCount, 
  givenItems, 
  nearestNeighbours, 
  goodRating, 
  predictType) {
  
  print(paste(sep=", ", trainDatasetSize, recommendationMethod, similarityMethod, trainMethod, kCount, givenItems, nearestNeighbours));
  startTime <- Sys.time();
  
  matrix <- as(ratings, "realRatingMatrix");
  
  print("Selecting train and test subsets...");
  dataSets <- evaluationScheme(
    data = matrix, 
    method = trainMethod, 
    train = trainDatasetSize, 
    k = kCount,
    given = givenItems,
    goodRating = goodRating # dla filmow = 4, dla ksiazek = 8
  );
  
  t = getData(dataSets, "train");
  k = getData(dataSets, "known");
  u = getData(dataSets, "unknown");
  
  print(paste("Training with ", nrow(t), "users..."));
  if(recommendationMethod == "UBCF") {
    recParams = list(method=similarityMethod, nn=nearestNeighbours)
  } else {
    recParams <- list(method=similarityMethod)
  }
  
  model <- Recommender(
    data = t, 
    method = recommendationMethod, 
    param=recParams
  );
  
  print(paste("Predicting for ", nrow(k), "users..."));
  predictions <- predict(model, k, type=predictType)

  print("Calcing accuracy...")
  accuracy = calcPredictionAccuracy(predictions, u, given=givenItems, goodRating=goodRating)
  print(accuracy);

  executionTime <- difftime(Sys.time(), startTime, units="secs");
  print(executionTime);
  result = paste(sep=";", 
              trainDatasetSize, 
              recommendationMethod, 
              similarityMethod, 
              trainMethod, 
              kCount, 
              givenItems, 
              nearestNeighbours, 
              paste(collapse=";", accuracy), 
              executionTime);
  resultFile = paste(sep="", "tests/", predictType, ".csv");
  writeLine(result, resultFile, append = TRUE)
  return (c(recommender=model, accuracy=accuracy, executionTime=executionTime));
}
