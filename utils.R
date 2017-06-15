preprocess <- function(dataset, maxMovieId, minRatings) {
  if(!is.null(maxMovieId)) {
    print ("Filtering film list...")
    dataset = dataset[dataset$movieId <= maxMovieId,]
  }
  if(!is.null(minRatings)) {
    print ("Filtering users to those with required rating count")
    t = table(dataset$userId)
    t = t[t >= minRatings]
    dataset <- dataset[dataset$userId %in% names(t),]
  }
  return (dataset)
}
