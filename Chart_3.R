library("ggplot2")

ggplot(data = rick_riordan_df3) + 
  geom_col(mapping = aes(y = as.numeric(Checkouts), x = PublicationYear, fill = MaterialType)) + labs(y = "Monthly Checkouts", x = "Publication Year", title = "Post 2020 Checkouts of Each publication Year") + theme(axis.text.x = element_text(size = 7, angle = 45, hjust = 1))
