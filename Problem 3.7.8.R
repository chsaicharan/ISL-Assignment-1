Auto = read.csv('/Users/sai/Downloads/Fall 2022/ISL/Assignments/Datasets/Assignment-1/Auto.csv', header = TRUE, na.strings = "?")
Auto = na.omit(Auto)

# a)
lm.fit = lm(mpg ~ horsepower, data = Auto)
summary(lm.fit)

#i) The regression coefficients have p-values close to zero. This implies statistical significance, which implies the existence of a relationship.
#ii) The R^{2} value indicates that about 61% of the variation in the response variable ( mpg) is due to the predictor variable (horsepower).
#iii) The horsepower regression coefficient is negative. As a result, the relationship is negative.
#iv) 
# The confidence 95% interval
predict(lm.fit, data.frame(horsepower = c(85)), interval ="confidence")
# And, the 95% prediction interval
predict(lm.fit, data.frame(horsepower = c(85)), interval ="prediction")
# As expected the prediction interval is wider than the confidence interval.

# b)

plot(Auto$horsepower, Auto$mpg, xlab = "Horsepower", ylab = "Miles per gallon")
abline(lm.fit, lwd = 3, col = "red")

# c)
par(mfrow=c(2,2))
plot(lm.fit)
# The residuals and fitted values form a pattern (U-shaped) in the first plot. This suggests that the predictor and responder variables have a nonlinear relationship. The residuals are depicted in the second figure as being regularly distributed. The third graphic demonstrates that the mistakes' variance is constant. The fourth graphic demonstrates that the data lacks any leverage points.