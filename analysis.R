library("dplyr")
library("stringr")
library("tidyverse")
library("ggplot2")

# Reading the initial CSV
checkouts_17_23 <- read.csv("/Users/autia/Desktop/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Creating a smaller dataframe for Rick Riordan's books
rick_riordan_df <- checkouts_17_23 %>% filter(str_detect(Creator, "(?i)riordan"))

# Cleaning the PublicationYear column
rick_riordan_df$PublicationYear <- gsub("\\D", "", rick_riordan_df$PublicationYear)

# Setting up data for the first chart
rick_riordan_df1 <- rick_riordan_df %>% group_by(MaterialType, PublicationYear) %>% summarise(Checkouts = sum(Checkouts))

# Setting up data for the second chart
rick_riordan_df2 <- rick_riordan_df %>% group_by(PublicationYear, CheckoutMonth)%>% summarise(Checkouts = sum(Checkouts))
rick_riordan_df2 <- rick_riordan_df2 %>% filter(PublicationYear > 2012)

# Setting up data for the third chart
rick_riordan_df3 <- rick_riordan_df %>% group_by(PublicationYear, CheckoutMonth, CheckoutYear, MaterialType) %>% summarise(Checkouts = sum(Checkouts))
rick_riordan_df3 <- rick_riordan_df3 %>% filter(CheckoutYear >= 2020)

