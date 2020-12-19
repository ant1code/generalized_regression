data("CHFLS", package = "HSAUR2")
library("MASS")
polr.mod <- polr(R_happy ~ R_age + R_income, data = CHFLS)
summary(polr.mod)
predict(polr.mod, type = "prob",
        newdata = data.frame(R_age = mean(CHFLS$R_age),
                             R_income = mean(CHFLS$R_income)))

age <- c(min(CHFLS$R_age), mean(CHFLS$R_age), max(CHFLS$R_age))
nd.age <- expand.grid(R_age = age, R_income = mean(CHFLS$R_income))

income <- c(min(CHFLS$R_income), mean(CHFLS$R_income), max(CHFLS$R_income)) 
nd.income <- expand.grid(R_age = mean(CHFLS$R_age), R_income = income)

### Exercise 2
y <- seq(0,1, by = 0.01)
b04 <- (1-y)^(4)
b14 <- 4*y*(1-y)^3
b24 <- 6*(y^2)*((1-y)^2)
b34 <- 4*(y^3)*(1-y)
b44 <- y^4
plot(b04, type = "l")
lines(b04)
lines(b14)
lines(b24)
lines(b34)
lines(b44)

library(basefun)

### set-up basis
bb <- Bernstein_basis(numeric_var("x", support = c(0, 10)), 
                      order = 4, ui = "increasing")
### b)
### generate data + coefficients
x <- as.data.frame(mkgrid(bb, n = 100))
cf <- c(1, 1, 1, 1, 1)
test <- diag(1, 5,5)
cf <- test[1,]
plot(x$x, predict(bb, newdata = x, coef = cf), type = "l")
cf <- test[2,]
lines(x$x, predict(bb, newdata = x, coef = cf), type = "l")
cf <- test[3,]
lines(x$x, predict(bb, newdata = x, coef = cf), type = "l")
cf <- test[4,]
lines(x$x, predict(bb, newdata = x, coef = cf), type = "l")
cf <- test[5,]
lines(x$x, predict(bb, newdata = x, coef = cf), type = "l")

### c)
### generate data + coefficients
x <- as.data.frame(mkgrid(bb, n = 100))
cf <- c(1, 1, 1, 1, 1)

### evaluate and plot Bernstein polynomial defined by
### basis and coefficients
plot(x$x, predict(bb, newdata = x, coef = cf), type = "l")

### d)
cf <- c(-3, -2.3, -1.2, 0.3, 1.8)
plot(x$x, predict(bb, newdata = x, coef = cf), type = "l")
cf <- c(3, 2.3, 1.2, -0.3, -1.8)
plot(x$x, predict(bb, newdata = x, coef = cf), type = "l")
cf <- c(-3, 2.3, -1.2, 0.3, -1.8)
plot(x$x, predict(bb, newdata = x, coef = cf), type = "l")


