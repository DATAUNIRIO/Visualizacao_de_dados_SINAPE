library(sjPlot)

banco <- data.frame(
  question1 = as.factor(sample(1:5, 500, replace = TRUE, prob = c(0.25, 0.33, 0.14, 0.28,0.8))),
  question2 = as.factor(sample(1:5, 500, replace = TRUE, prob = c(0.5, 0.25, 0.15, 0.1,0.4))),
  question3 = as.factor(sample(1:5, 500, replace = TRUE, prob = c(0.25, 0.1, 0.39, 0.26,0.6))),
  question4 = as.factor(sample(1:5, 500, replace = TRUE, prob = c(0.17, 0.27, 0.38, 0.16,0.2))),
  question5 = as.factor(sample(1:5, 500, replace = TRUE, prob = c(0.37, 0.26, 0.16, 0.21,0.4)))
)
# create labels
labels <- c("Discordo totalmente", "Discordo parcialmente", "Indiferente","Concordo parcialmente", "Concordo totalmente")

# create item labels
items <- c("item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7", "item 8", "item 9", "item 10", "item 11", "item 12", "item 13", "item 14", "item 15", "item 16", "item 17", "item 18" , "item 19", "item 20", "item 21", "item 22")

plot_likert(banco,sort.frq="pos.asc",legend.labels=labels,catcount=5)




