pollutantmean <- function(directory, pollutant, id = 1:332) {
    file_list <- list.files(directory, full.name = TRUE)
    data_read_in <- function(x) {
        df <- data.frame()
        for (i in id) {
            raw_df <- read.csv(x[i])
            df <- rbind(df, raw_df)
        }
        df
    }
    raw_data <- data_read_in(file_list)
    select_polut <- data.frame(raw_data[pollutant])
    data <- select_polut[complete.cases(select_polut),]
    mean(data)
}