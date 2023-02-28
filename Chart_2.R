library("ggplot2")

ggplot(data = rick_riordan_df2) + 
  geom_line(mapping = aes(y = as.numeric(Checkouts), x = as.numeric(CheckoutMonth), color = PublicationYear)) + 
  scale_x_continuous(breaks = seq(1, 12, 1)) + 
  labs(x = "Checkout Month", y = "Checkouts", title = "All Monthly Checkouts Of Publications Post 2012")
