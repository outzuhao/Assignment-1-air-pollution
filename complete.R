complete <- function(directory, id = 1:332) {
    file_list <- list.files(directory, full.name = TRUE)
    proc <- function(x) {
        df <- data.frame()
        for (i in id) {
            raw_df <- read.csv(x[i])
            comp <- sum(complete.cases(raw_df))
            df <- rbind(df, data.frame(id = i, nobs = comp))
        }
        df
    }
    proc(file_list)
}