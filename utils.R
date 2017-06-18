preprocess <- function(dataset, maxMovieId, maxUserId, minRatings) {
  if(!is.null(maxMovieId)) {
    print ("Filtering list by movie id...")
    dataset = dataset[dataset$movieId <= maxMovieId,]
  }
  if(!is.null(maxUserId)) {
    print ("Filtering list by user id...")
    dataset = dataset[dataset$userId <= maxUserId,]
  }
  if(!is.null(minRatings)) {
    print ("Filtering users to those with required rating count")
    t = table(dataset$userId)
    t = t[t >= minRatings]
    dataset <- dataset[dataset$userId %in% names(t),]
  }
  return (dataset)
}

read <- function(dataFile) {
    read.table(dataFile, header = TRUE, dec=",", sep=";");
}

write <- function(data, dataFile) {
    write.table(data, dataFile, sep=",", dec=".", quote=FALSE, row.names = FALSE)
}

writeLine <- function(data, dataFile, append = FALSE) {
    write.table(data, dataFile, row.names = FALSE, col.names = FALSE, append = append)
}