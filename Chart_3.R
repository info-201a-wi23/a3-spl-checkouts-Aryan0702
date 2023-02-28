library("ggplot2")

ggplot(data = rick_riordan_df3) + 
  geom_col(aes(y = as.numeric(Checkouts), x = PublicationYear, fill=CheckoutMonth)) + labs(y = "Monthly Checkouts", x = "Publication Year", title = "Total Checkouts of Each publication Year")
