
# Load the dataset
engineering_dataset <- read.csv(file.choose())


rownames(engineering_dataset) <- paste(engineering_dataset$Lot.number, '', engineering_dataset$Outcome)


results <- prcomp(engineering_dataset[c("Size5","Size10","Size15","TGA","DSC","TMA")], scale = TRUE)


results$sdev^2/sum(results$sdev^2)


barplot(results$rotation[,1], main ="PC 1 Loading Plot")
barplot(results$rotation[,2], main ="PC 2 Loading Plot")
barplot(results$rotation[,3], main ="PC 3 Loading Plot")


biplot(results, scale = 0)
