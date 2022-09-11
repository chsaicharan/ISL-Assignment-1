Auto = read.csv("/Users/sai/Downloads/Fall 2022/ISL/Assignments/Datasets/Assignment-1/Auto.csv", header = TRUE, na.strings = "?")
Auto = na.omit(Auto)
dim(Auto)

#a)
summary(Auto)
head(Auto)
str(Auto)

# year, origin, and the name predictor --> Qualitative
# mpg, cylinders, displacement, horsepower, weight, acceleration --> Quantitative

#b)
range(Auto$mpg)
range(Auto$cylinders)
range(Auto$displacement)
range(Auto$horsepower)
range(Auto$weight)
range(Auto$acceleration)

#c)
colMeans(Auto[, 1:6])
apply(Auto[, 1:6], MARGIN = 2, FUN = "sd")

#d)
apply(Auto[-(10:85), 1:7], MARGIN = 2, FUN = "range")
apply(Auto[-(10:85), 1:7], MARGIN = 2, FUN = "mean")
apply(Auto[-(10:85), 1:7], MARGIN = 2, FUN = "sd")

#e)
pairs(Auto[, 1:6])

par(mfrow = c(2, 1))
plot(Auto$weight, Auto$horsepower, xlab = "Car weight (pounds)", ylab = "Horsepower")
plot(Auto$weight, Auto$displacement, xlab = "Car weight (pounds)", ylab = "Engine displacement (cubic inches)")


par(mfrow = c(2, 2))
plot(Auto$displacement, Auto$mpg, xlab = "Engine displacement (cubic inches)", ylab = "Miles per gallon")
plot(Auto$horsepower, Auto$mpg, xlab = "Horsepower", ylab = "Miles per gallon")
plot(Auto$weight, Auto$mpg, xlab = "Car weight (pounds)", ylab = "Miles per gallon")
plot(Auto$year, Auto$mpg, xlab = "Model Year", ylab = "Miles per gallon")

boxplot(Auto$mpg, Auto$year , xlab ="Year(1900s)", ylab="MPG")

#f)
Auto$origin[Auto$origin == 1] = "American"
Auto$origin[Auto$origin == 2] = "European"
Auto$origin[Auto$origin == 3] = "Japanese"
Auto$origin = as.factor(Auto$origin)

plot(Auto$origin, Auto$mpg, xlab = "Country of origin", ylab = "Miles per gallon")
#based on the plot cars in japan are giving more miles per gallon than that are of america and europe

plot(Auto$year, Auto$mpg, xlab = "Year", ylab = "Miles per gallon")
# based on the plot cars manufactured in 80's are giving more miles per gallon and cars that are manufactured in 72's are giving less miles per gallon

