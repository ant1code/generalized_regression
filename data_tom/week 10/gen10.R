cherry <- read.csv("C:/Users/TomasMartinek/Downloads/cherry.csv", sep=";")
library("survival") 
summary(cherry$Volume) 
eps <- 5 
### define interval-censored survival object 
surv.obj <- Surv(time = cherry$Volume - eps, time2 = cherry$Volume + eps, type = "interval2") 
surv.mod <- survreg(surv.obj ~ Girth, dist = "gaussian", data = cherry)
summary(surv.mod)         

lin.mod <- glm(Volume ~ Girth, data = cherry, family = gaussian)
summary(lin.mod)

eps <- c(0.01, 0.5, min(cherry$Volume)/4, min(cherry$Volume)/2) 
for (i in 1:length(eps)){
  surv.obj <- Surv(time = cherry$Volume - eps[i], time2 = cherry$Volume + eps[i], type = "interval2") 
  surv.mod <- survreg(surv.obj ~ Girth, dist = "gaussian", data = cherry)
  print(summary(surv.mod))

}
surv.obj <- Surv(time = cherry$Volume - eps[1], time2 = cherry$Volume + eps, type = "interval2") 
surv.mod <- survreg(surv.obj ~ Girth, dist = "gaussian", data = cherry)

## The higher the eps, the higher is the likelihood!!! 
library(mlbench)
data(BostonHousing2)
BostonHousing2$logcmedv <- log(BostonHousing2$cmedv)
fit1 <- lm(log(cmedv) ~ chas + nox, data = BostonHousing2)
summary(fit1)

# b)
library(ggplot2)
BostonHousing2$chas <- as.factor(BostonHousing2$chas)
ggplot(BostonHousing2, aes(x = logcmedv)) + stat_ecdf(aes(color = chas), geom = "step", size = 1.5)
ggplot(BostonHousing2, aes(x = cmedv)) + stat_ecdf(aes(color = chas), geom = "step", size = 1.5)

ggplot(BostonHousing2, aes(x = cmedv)) + geom_density(aes(color = chas), size = 1.5)












