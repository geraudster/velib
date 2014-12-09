library(ggplot2)
library(sqldf)
library(xts)
#data <- read.csv('velib.csv.gz', header = T, sep = ',', nrows = 500000)
#data <- read.csv('velib.csv.gz', header = T, sep = ',')
file <- gzfile('velib.csv.gz', 'r')
data <- read.table(file, header = T, sep = ',')
close(file)
data$ArchivedStationId <- factor(data$ArchivedStationId)
#length(levels(data$ArchivedStationId))
#dataSubset <- data[data$ArchivedStationId  %in% head(levels(data$ArchivedStationId)),]

dataSubset <- data[data$ArchivedStationId %in% c(1234, 1235), ]

dataSubset$UpdateUtc <- as.POSIXct(dataSubset$UpdateUtc, format="%Y-%m-%dT%H:%M:%S")
dataSubset$ArchivedStationId <- factor(dataSubset$ArchivedStationId)
qplot(UpdateUtc, AvailableBikes, data = dataSubset, colour = ArchivedStationId, geom = "line")

hclust(dataSubset)
