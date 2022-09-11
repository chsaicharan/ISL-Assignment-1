Auto = read.csv('/Users/sai/Downloads/Fall 2022/ISL/Assignments/Datasets/Assignment-1/Auto.csv', header = TRUE, na.strings = "?")
Auto = na.omit(Auto)

head(Auto)

Auto$origin[Auto$origin == 1] = "American"
Auto$origin[Auto$origin == 2] = "European"
Auto$origin[Auto$origin == 3] = "Japanese"
Auto$origin = as.factor(Auto$origin)
head(Auto)

# a)
pairs(~mpg + cylinders + displacement + horsepower + weight + acceleration + year, Auto)

# b)
cor(Auto[,-c(8, 9)])
# I didn't include the name column in the matrix of correlations computation because the origin column is also qualitative.

# c)
mpg.fit = lm(mpg ~ . - name, data = Auto)
summary(mpg.fit)

#i) I'd say there is. Some predictors, however, do not affect the answer in a way that is statistically significant. According to the R-squared value, the predictors in this regression model can account for 82% of the variations in the answer.
# ii) displacement, weight, year, origin are the predictors that appears to be statistically significant in relationship to the response.
# iii) The mpg value rises as time goes on while all other predictors remain constant. In particular, mpg rises by 1.43 every year.

# d)
par(mfrow = c(2,2))
plot(mpg.fit)

# The first graph demonstrates that the connection between the response and the predictors is nonlinear; 
# The residuals are right-skewed and regularly distributed, as seen by the second graph; 
# The third graph demonstrates that this model does not adhere to the constant variance of error assumption; 
# According to the third graph, there are no leverage points. However, one finding sticks out as a possible leverage point.

# e)
mpg.fit = lm(mpg ~.-name+displacement:weight, data = Auto)
summary(mpg.fit)

mpg.fit = lm(mpg ~.-name+displacement:cylinders+displacement:weight+acceleration:horsepower, data=Auto)
summary(mpg.fit)

mpg.fit = lm(mpg ~.-name+displacement:cylinders+displacement:weight+year:origin+acceleration:horsepower, data=Auto)
summary(mpg.fit)

mpg.fit = lm(mpg ~.-name-cylinders-acceleration+year:origin+displacement:weight+
             displacement:weight+acceleration:horsepower+acceleration:weight, data=Auto)
summary(mpg.fit)

# The final model is the only one of the four where each variable is important. The likelihood that it is the ideal fusion of predictors and interaction variables is quite high. According to R-squared statistics, this specific collection of predictors may account for 87% of variations in response ( single and interaction.) The studies did not yield a higher value.The final model is the only one of the four where each variable is important. The likelihood that it is the ideal fusion of predictors and interaction variables is quite high. According to R-squared statistics, this specific collection of predictors may account for 87% of variations in response ( single and interaction.) The studies did not yield a higher value.

# f)
summary(lm(mpg ~ . -name + log(acceleration), data=Auto))
# Even though it is less significant than acceleration, log(acceleration) is still quite significant.

summary(lm(mpg ~ . -name + I(horsepower^2), data=Auto))
# Squaring horsepower doesn’t change the significance.