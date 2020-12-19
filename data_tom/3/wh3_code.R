disease <- factor(c(rep(1, 75), rep(0, 25), rep(1, 25), rep(0, 75)),
                  levels = c("1", "0"),
                  labels = c("yes", "no"))
supp <- factor(c(rep("no.calc", 100), rep("calc", 100)),
               levels = c("no.calc", "calc"),
               labels = c("no.calc", "calc"))
RCT <- data.frame(disease = disease,
                  supp = supp)
table(RCT$supp, RCT$disease)
bin.log.mod <- glm(disease ~ supp, family = "binomial", data = RCT)
bin.log.mod # intercept is the baseline log odds

library(oddsratio)
or_glm(RCT, bin.log.mod)

# Exercise 2
library("MASS")
data("CHFLS", package = "HSAUR2")
polr.mod <- polr(R_happy ~ R_age + R_income, data = CHFLS)
# a) R_happy is a categorical, with 3 categories.
summary(polr.mod)
c(polr.mod$zeta, coef(polr.mod))
exp(c(polr.mod$zeta, coef(polr.mod)))
# b) The coefficients have an additive effect, in the sense that the regression
# goes like happy = age + income, i.e. there are no interaction terms.
# logistic regression: P(Y=1|X)=1/(1+exp(b0+b1X+b2X))
# c) They are odds ratios, because inn log. regression, given X prob of Y occuring = 1/(exp(-Xb))=p1/(1-p1)
# for another X' it is 1/(exp(Xb+bi)) and exp(bi) ar etherefore the odds.
# In this case, the odds are always almost 1, which means that hapiness doesn't depend on neither age, nor income.
# d) For every year of age, the probability of being happy decreases by 0.6%.

## Exercise 3
age <- c(min(CHFLS$R_age), mean(CHFLS$R_age), max(CHFLS$R_age))
nd.age <- expand.grid(R_age = age, R_income = mean(CHFLS$R_income))

income <- c(min(CHFLS$R_income), mean(CHFLS$R_income), max(CHFLS$R_income)) 
nd.income <- expand.grid(R_age = mean(CHFLS$R_age), R_income = income)

data("CHFLS", package = "HSAUR2")
library("MASS")
polr.mod <- polr(R_happy ~ R_age + R_income, data = CHFLS)
predict(polr.mod, type = "prob",
        newdata = data.frame(R_age = mean(nd.age$R_age),
                             R_income = mean(nd.income$R_income)))


