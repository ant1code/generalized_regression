library( TH.data)
library(tidyverse)
data<-GlaucomaM %>% 
  select(Class,varg, vart, vars, varn)


vY = as.matrix(as.numeric(data$Class)-1)
mX = as.matrix(data[c('varg','vart', 'vars', 'varn')])

#================================================
# compute the logistic regression parameters as 
#   an optimal value
#================================================
# define the logistic transformation
logit = function(mX, vBeta) {
  return(exp(mX %*% vBeta)/(1+ exp(mX %*% vBeta)) )
}

# stable parametrisation of the log-likelihood function
# Note: The negative of the log-likelihood is being returned, since we will be
# /minimising/ the function.
logLikelihoodLogitStable = function(vBeta, mX, vY) {
  return(-sum(
    vY*(mX %*% vBeta - log(1+exp(mX %*% vBeta)))
    + (1-vY)*(-log(1 + exp(mX %*% vBeta)))
  ) 
  ) 
}

# initial set of parameters
vBeta0 = c( -0.1, -0.3, 0.001, 0.01) # arbitrary starting parameters

# minimise the (negative) log-likelihood to get the logit fit
optimLogit <- optim(vBeta0, logLikelihoodLogitStable,
                   mX = mX, vY = vY, method = 'BFGS', 
                   hessian=TRUE)

data_1<-data.frame(data)
data_1$Class<-factor(data_1$Class)
try1<-glm(Class ~. , data = data_1, family = "binomial") 
summary(try1)
