library("dplyr")
library("stringr")
library("tidyverse")
library("ggplot2")
library(tidyr)

checkouts_17_23 <- read.csv("~/Desktop/College Books/Win 23/INFO 201/Assignment/a3-spl-checkouts-Aryan0702/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

rick_riordan_df <- checkouts_17_23 %>% filter(str_detect(Creator, "(?i)riordan"))

rick_riordan_df$PublicationYear <- gsub("\\D", "", rick_riordan_df$PublicationYear)

rick_riordan_df1 <- rick_riordan_df %>% group_by(MaterialType, PublicationYear) %>% summarise(Checkouts = sum(Checkouts))

rick_riordan_df2 <- rick_riordan_df %>% group_by(PublicationYear, CheckoutMonth)%>% summarise(Checkouts = sum(Checkouts))

rick_riordan_df3 <- rick_riordan_df %>% group_by(PublicationYear, CheckoutMonth)%>% summarise(Checkouts = sum(Checkouts))

