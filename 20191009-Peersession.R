
#Problem 3
cardata = read.csv("http://www.datadescant.com/hbap/cars10.csv")

# answeers 1
View(cardata)
dim(cardata)

summary(cardata)


#answer 2
domesticCars = cardata[cardata$foreign=="Domestic",]
summary(domesticCars)
dim(domesticCars)

foreignCars = cardata[cardata$foreign=="Foreign",]
View(foreignCars)
summary(foreignCars)

# answer 3
summary(cardata)
print(cardata[26,])


rowNumber = which.min(cardata$mpg)
cardata$make[rowNumber]
cardata$make[which.min(cardata$mpg)]

#how to get all cars with the min mpg
rowNumber = which.min(cardata$mpg)

## try below for answer 4 as well. This finds ALL(2) cars with low mpg
minMpgValue = min(cardata$mpg)
cardata[cardata$mpg==12,] # hard-coding
cardata[cardata$mpg==minMpgValue,] #better way
cardata[cardata$mpg==min(cardata$mpg),] #better way
cardata$make[cardata$mpg==min(cardata$mpg)] #better way --> make only


# answer 4
summary(cardata)
costliestCarValue = max(cardata$price)
print(costliestCarValue)
cardata$make[which.max(cardata$price)]

# answer 4 --> see if you can replicate above logic?

#answer 5 - make histogram for price
hist(cardata$price) #skewed it is...
summary(cardata)
# what is to be positively skewed?
boxplot(cardata$price)
# Parth and others to read about Box Plot! :)

#answer 6
# prints histograms one after another
hist(domesticCars$mpg)
hist(foreignCars$mpg)

par(mfrow=c(1,2)) #puts the histograms in one row and two columns (side by side)
hist(domesticCars$mpg)
hist(foreignCars$mpg)

#below section puts the frequency values on the same scale so we can compare properly. puts min=0 and Max=30 for the frequency(Y axis)
par(mfrow=c(1,2))
hist(domesticCars$mpg,
     ylim=c(0,30)
)
hist(foreignCars$mpg,
     ylim=c(0,30))

