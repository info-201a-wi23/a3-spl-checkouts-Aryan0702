library("dplyr")
library("stringr")
library("tidyverse")

# Reading the CSV
checkouts_17_23 <- read.csv("/Users/autia/Desktop/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Creating a smaller dataframe for Rick Riordan's books
rick_riordan_df <- checkouts_17_23 %>% filter(str_detect(Creator, "(?i)riordan"))

# Finding the number of rows and columns
no_of_rows <- nrow(checkouts_17_23)
no_of_cols <- ncol(checkouts_17_23)

# Finding the year with the most number of checkouts
most_checkouts_year <- checkouts_17_23 %>% group_by(CheckoutYear) %>% summarise(Checkouts = sum(Checkouts))
most_checkouts_year <- most_checkouts_year %>% filter(Checkouts == max(Checkouts))
most_checkouts_year <- most_checkouts_year$CheckoutYear

# Finding the most popular title
most_popular_book <- checkouts_17_23 %>% group_by(Title) %>% summarise(Checkouts = sum(Checkouts))
most_popular_book <- most_popular_book %>% filter(Checkouts == max(Checkouts))
most_popular_book <- most_popular_book$Title

# Finding the most popular Rick Riordan title
most_popular_rr_book <- rick_riordan_df %>% group_by(Title) %>% summarise(Checkouts = sum(Checkouts))
most_popular_rr_book <- most_popular_rr_book %>% filter(Checkouts == max(Checkouts))
most_popular_rr_book <- most_popular_rr_book$Title

# Finding the most popular format
most_popular_format <- rick_riordan_df %>% group_by(MaterialType) %>% summarise(Checkouts = sum(Checkouts))
most_popular_format <- most_popular_format %>% filter(Checkouts == max(Checkouts))
most_popular_format_checkouts <- most_popular_format$Checkouts
most_popular_format <- most_popular_format$MaterialType

# Finding the month with the highest average number of checkouts
month_with_highest_avg_checkouts <- rick_riordan_df %>% group_by(CheckoutMonth) %>% summarise(Checkouts = sum(Checkouts))
month_with_highest_avg_checkouts <- month_with_highest_avg_checkouts %>% summarise(CheckoutMonth, Checkouts = Checkouts/7)
month_with_highest_avg_checkouts <- month_with_highest_avg_checkouts %>% filter(Checkouts == max(Checkouts))
month_with_highest_avg_checkouts <- month_with_highest_avg_checkouts$CheckoutMonth

# Calculate number of total checkouts
no_of_checkouts <- sum(checkouts_17_23$Checkouts)
