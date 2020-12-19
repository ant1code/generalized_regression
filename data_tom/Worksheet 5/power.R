n = 10
a = 0.1
u0 = 0
sd = 1

c2<-qnorm(0.975,sd)
nu_hat_seq = seq(-1, 1, 0.01)
power<-1-(pnorm(c2 + nu_hat_seq,sqrt(sd/n))-pnorm(-c2 + nu_hat_seq,sqrt(sd/n)))
plot(nu_hat_seq, power, type = "l", ylab = "Power" )

