library(ISLR2)

Boston
head(Boston)

#a)
dim(Boston)
# Boston has 506 rows and 13 columns
str(Boston)
# data from the Boston state related to house sales

#b)
par(mfrow= c(3,2))
plot(Boston$dis, Boston$nox)
plot(Boston$age, Boston$nox)
plot(Boston$medv, Boston$lstat)
plot(Boston$rm, Boston$lstat)
plot(Boston$crim, Boston$dis)

# nox versus dis: it says that pollution is inversely proportional to the distance of the employment centers.
# nox versus age: it shows that the pollution increases as the occupation increased.
# lstat versus medv: shows that lower status population has the lower mean value of homes.
# lstat versus rm: as lower the population status, lower the rooms per dwelling.
# crim versus dis: the crimes seems to happen more nearby the employment centers

#c)
par(mfrow= c(2,2))
plot(Boston$dis, Boston$crim)
plot(Boston$age, Boston$crim)

# crim versus dis: the crimes seems to happen more nearby the employment centers
# crim versus age: there are more crimes as the age increases.

#d)
# par(mfrow=c(1,3))
#pairs(Boston[,c(1,8,10,11)])
#plot(Boston$crim, Boston$dis,type = 'p', pch=16)
#plot(Boston$tax, Boston$dis,type = 'p', pch=16)
#plot(Boston$ptratio, Boston$dis,type = 'p', pch=16)
par(mfrow=c(1,3))
boxplot(Boston$crim, xlab = "crim")
boxplot(Boston$tax, xlab = "tax")
boxplot(Boston$ptratio, xlab = "ptratio")

# "Per capita crime rate by town," "full-value property-tax rate per $10,000/-," and "pupil-teacher ration by town" are shown by the first, second, and third boxplots, respectively.

# The variable "per capita crime rate per town" contains a lot of outliers at the upper end. Most municipalities have extremely low crime rates, perhaps between zero and five. A extremely high crime rate of more than 70 is present in some places. The data is between 0 and more than 80.
# Full-value property tax per $10,000 or less - There are no outliers in the property tax rates, but the fact that the data varies from 200 to 700 and has a median value close to 300 suggests that the data is similarly biased.
# The box plot's bottom extremity contains outliers for the variable "pupil-teacher ration by town." The data are between 12.6 and 22. The average student-to-teacher ratio is roughly 19.

#e)
sum(Boston$CHAS)
# in this dataset 35 tracts are bound to charles river

#f)
summary(Boston$ptratio)
# The median pupil-teacher ratio among towns in this data set is 19.05 pupils per teacher.

# g)
selection = Boston[order(Boston$medv),]
selection[1,]
# Suburb #399 with a median value of $5000
# Suburb #399: * There is no residential land zoned for lots larger than 25,000 square feet. * Crime is quite high relative to the median and average rates of all Boston neighborhoods. More over half of Boston's neighborhoods fall within this category. * Compared to most suburbs, towns have a fairly high proportion of non-retail commercial acres.


# h)
rm_over_7 = subset(Boston, rm>7)
nrow(rm_over_7) 
rm("rm_over_7")
# There are 64 suburbs with more than 7 rooms per dwelling.

rm_over_8 <- subset(Boston, rm>8)
nrow(rm_over_8) 
# There are 13 suburbs with more than 8 rooms per dwelling

summary(rm_over_8)
# One thing that is clear from the summary is that, in comparison to the entire data set, the tracts with an average of at least eight rooms per dwelling have low crime rates, low nitric oxide concentrations, low proportions of Black residents (high values of B), and low proportions of residents with lower socioeconomic status.


