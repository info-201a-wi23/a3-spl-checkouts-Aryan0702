library("ggplot2")

ggplot(data = rick_riordan_df1) + 
  geom_line(mapping = aes(y = Checkouts, x = extract_numeric(PublicationYear), color = MaterialType)) + 
  scale_x_continuous(breaks = seq(2005, 2021, 1)) +   theme(axis.text.x = element_text(size = 7, angle = 45, hjust = 1)) + 
  labs(x = "Publication Year", y = "Checkouts", title = "Format in Publication Was Consumed Yearwise")
