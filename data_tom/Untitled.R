set.seed(2410)
theta <- 0.1
beta <- c(-0.5, 0.1, 0.01, 0.03)
parm <- c(theta, beta)
n <- 1000
p <- length(beta)
x <- matrix(rnorm(n*p), nrow = n)
lp <- cbind(1, x) %*% matrix(parm, ncol = 1)
resp <- factor(rbinom(n = n, size = 1, prob = plogis(lp)), levels = c(0, 1))
simdata <- data.frame(response = resp, x)
fm_simple <- response ~ X1
fm_complex <- response ~ X1 + X2 + X3 + X4

fit_glm_sim <- glm(fm_simple, data = simdata, family = binomial)
fit_glm_sim2 <- glm(fm_complex, data = simdata, family = binomial)

anova(fit_glm_sim, fit_glm_sim2)

BIC(fit_glm_sim)
BIC(fit_glm_sim2)
