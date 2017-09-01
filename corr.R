corr <- function(directory, threshold = 0) {
    file_list <- list.files(directory, full.name = TRUE)
    comp <- complete(directory)
    result <- numeric()
    for (i in 1:nrow(comp)) {
        if (comp[i, "nobs"] > threshold) {
            raw_data <- read.csv(file_list[i])
            data <- raw_data[complete.cases(raw_data),]
            raw_result <- cor(data["nitrate"], data["sulfate"])
            result <- c(result, raw_result)
        }
    }
    result
}