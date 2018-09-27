
library(sjPlot)

banco <- data.frame(
  question1 = as.factor(sample(c("Dicordo plenamente","Discordo","Concordo","Concordo plenamente"), 500, replace = TRUE, prob = c(0.25, 0.33, 0.14, 0.28))),
  question2 = as.factor(sample(c("Dicordo plenamente","Discordo","Concordo","Concordo plenamente"), 500, replace = TRUE, prob = c(0.5, 0.25, 0.15, 0.1))),
  question3 = as.factor(sample(c("Dicordo plenamente","Discordo","Concordo","Concordo plenamente"), 500, replace = TRUE, prob = c(0.25, 0.1, 0.39, 0.26))),
  question4 = as.factor(sample(c("Dicordo plenamente","Discordo","Concordo","Concordo plenamente"), 500, replace = TRUE, prob = c(0.17, 0.27, 0.38, 0.16))),
  question5 = as.factor(sample(c("Dicordo plenamente","Discordo","Concordo","Concordo plenamente"), 500, replace = TRUE, prob = c(0.37, 0.26, 0.16, 0.21)))
)

edit(banco)

plot_likert(banco,
     grid.range = 1,
     expand.grid = FALSE,
     values = "sum.outside",
     show.prc.sign = TRUE,
     sort.frq = "neg.asc"
 )

