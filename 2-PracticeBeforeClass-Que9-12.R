

#question 9
#9.1 Using the IQR rule, how many Tip values are considered outliers?

rm(list = ls(all.names = TRUE)) # clear variables
par(mfrow=c(1,1))

mydata = read.csv("http://www.datadescant.com/hbap/RestaurantTips.csv")
names(mydata)
View(mydata)
mean(mydata$PctTip)

summary(mydata$Tip)
summary(mydata$Bill)

iqrVal = IQR(mydata$Tip) #2.9
#find interquartile range

#find q3 value - method 1
Q3 <- quantile(mydata$Tip, 0.75) 
#find q3 value - method 2 (I like this!)
fivenum(mydata$Tip)[4]
summary(mydata$Tip) #check

#Find IQR - interquartile range
my_results <- fivenum(mydata$Tip)
print(my_results[4]-my_results[2])

### find outliers
upperBound = Q3 + iqrVal*1.5 #9.35
lowerBound = fivenum(mydata$Tip)[2] - iqrVal*1.5 # -2.25
outliers = mydata[(mydata$Tip < lowerBound | mydata$Tip > upperBound),]
dim(outliers)
## Answer - 9 outliers

##9.2 Using the IQR rule, how many tip percentage values are considered outliers?

boxplot(mydata$PctTip) #outliers on both sides?
summary(mydata$PctTip)
pctTipQ3 <- fivenum(mydata$PctTip)[4] #18.2
pctTipQ1 <- fivenum(mydata$PctTip)[2] #14.3
pctIQR = IQR(mydata$PctTip) #3.9
upperBound = pctTipQ3 + pctIQR-1.5
lowerBound = pctTipQ1 - pctIQR*1.5

boxplot(mydata$PctTip)$out
outliers = boxplot(mydata$PctTip)$out
print(outliers)

pctTipOutliersRecords = subset(mydata, (PctTip<=lowerBound | PctTip>=upperBound))

View(pctTipOutliers)
View(mydata)
# Answer - total 20 outliers


#9.3 What is the correlation between dinner bill and tip?
cor(mydata$Bill,mydata$Tip)
#positive corrilation 0.9150592

#9.4 Using the data set with the tip percentages outliers removed, what is the correlation between dinner bill and tip? Is this number the same as from part 3? Explain.
dim(mydata)
boxplot(mydata$PctTip)$out
outliers<-boxplot(mydata$PctTip)$out
print(outliers)
View(outliers)


pctTipWithoutOutliers = mydata[-which(mydata$PctTip %in% outliers),]
dim(pctTipWithoutOutliers)
#149 records without the pct tip outliers 
cor(pctTipOutliers$Bill,pctTipOutliers$Tip)
#0.8876409 its lower than 0.9150592


#question 10
mydata10=read.csv("http://www.datadescant.com/hbap/blas.csv")
cor(mydata10$X,mydata10$Y) #1.041004e-20
plot(mydata10$X,mydata10$Y)
