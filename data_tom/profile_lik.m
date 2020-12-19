x = [225, 175, 198, 189, 189, 130, 162, 135, 119, 162]
x1 = transpose(x)
pd = fitdist(x1, 'Weibull')
! display profile likelihood estimate for the shape parameter
[ll, param] = proflik(pd,1,'display','on')
[ll, param] = proflik(pd,1)
[ll',param']
! we see that the likelihood is maximized between [180.7755, 183.1508]

! display profile likelihood estimate for the scale parameter
[ll, param] = proflik(pd,2,'display','on')
[ll, param] = proflik(pd,2)
[ll',param']
! we see that the likelihood is maximized between [5.8822, 6.2414]

mle1 = mle(x, 'distribution', 'wbl')
! mle1 = 181.6040    5.9611