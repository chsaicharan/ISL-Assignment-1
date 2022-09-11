# a)
college = read.csv('/Users/sai/Downloads/Fall 2022/ISL/Assignments/Datasets/Assignment-1/College.csv', header = TRUE)

# b)
View(college)

rownames(college) = college[, 1]

View(college)

college = college[, -1]
View(college)

# c)

#i)
summary(college)
#ii)
college[,1] = as.numeric(factor(college[,1]))
pairs(college[, 1:10])
#iii)
#plot(college$Private, college$Outstate, xlab = "Private", ylab = "Out-of-state tuition (dollars)")
boxplot(college$Outstate ~ college$Private, main = "Outstate versus Private", 
        xlab = "Private", ylab = "Outstate")
#iv)
Elite = rep("No", nrow(college))
Elite[college$Top10per > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

summary(college$Elite)

plot(college$Outstate ~ college$Elite, main = "Outstate versus Elite", 
        xlab = "Elite", ylab = "Outstate")

#v)
par(mfcol = c(2, 3))
# Apps with 5 bins
hist(college$Accept, breaks = 6, freq = TRUE, col = "blue", main = "Histogram", 
     xlab = "Accept", ylab = "Value")
hist(college$Accept, breaks = 10, freq = TRUE, col = "green", main = "Histogram", 
     xlab = "Accept", ylab = "Value")
hist(college$Enroll, breaks = 6, freq = TRUE, col = "blue", main = "Histogram", 
     xlab = "Enroll", ylab = "Value")
hist(college$Enroll, breaks = 10, freq = TRUE, col = "green", main = "Histogram", 
     xlab = "Enroll", ylab = "Value")
hist(college$Top10perc, breaks = 6, freq = TRUE, col = "blue", main = "Histogram", 
     xlab = "Top10perc", ylab = "Value")
hist(college$Top10perc, breaks = 10, freq = TRUE, col = "green", main = "Histogram", 
     xlab = "Top10perc", ylab = "Value")

# vi)
NonTuitionCosts = college$Room.Board + college$Books + college$Personal
college = data.frame(college, NonTuitionCosts)
par(mfrow = c(1, 2))
boxplot(college$Private, college$NonTuitionCosts, xlab = "Private", ylab = "Total non-tuition costs per year (dollars)")
plot(college$Elite, college$NonTuitionCosts, xlab = "Elite", ylab = "Total non-tuition costs per year (dollars)")

AcceptPerc = college$Accept / college$Apps * 100
college = data.frame(college, AcceptPerc)
par(mfrow = c(1, 2))
boxplot(college$Private, college$AcceptPerc, xlab = "Private", ylab = "Acceptance Rate")
plot(college$Elite, college$AcceptPerc, xlab = "Elite", ylab = "Acceptance Rate")

summary(college$AcceptPerc[college$Private == "Yes"])
summary(college$AcceptPerc[college$Private == "No"])
