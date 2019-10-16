

#Part 2
#Question 7

mydata = read.csv("http://www.datadescant.com/hbap/smallsurvey.csv")

#7.1 - 30 rows
dim(mydata)

#7.2 - 10 variables
ncol(mydata)
dim(mydata)

#7.3 - pie chart
View(mydata)
summary(mydata)
pie(table(mydata$residence),main = "Distribution of Residence")

#7.4 - bar chart
barplot(table(mydata$politicalparty), main = "Distribution of Political Affiliation")
View(mydata$politicalparty) #categorical variable. not a quantitative variable so can't use histogram

#7.5
mean(mydata$income) #45.4

#7.6
menData = subset(mydata,mydata$gender=='M')
womenData = subset(mydata,mydata$gender=='F')

by(mydata$income,mydata$gender,mean)
by(mydata$income,mydata$gender,sd)


#7.7
plot(mydata$income,mydata$jobhappy)

summary(mydata$income[mydata$jobhappy])
     
summary(mydata$income[mydata$jobhappy<=3]) #51.42
summary(mydata$income[mydata$jobhappy>=8]) #37.25

#8.1
rm(list = ls(all.names = TRUE)) # clear variables
mydata = read.csv("http://www.datadescant.com/hbap/airline2008Nov.csv")

#cleandata -> remove blanks
cleandata = na.omit(mydata)

#get Origin as JFK and LGA data
lgaJFKData = subset(cleandata, Dest=="BOS" & (Origin=="LGA" | Origin=="JFK"))
#print the origins. Should have all others printed as well
lgaJFKData$Origin

#factor it to clean other 0 observations entries from the summary.
lgaJFKData$Origin <- factor(lgaJFKData$Origin)

summary(lgaJFKData)
names(lgaJFKData)

#8.1 Which airport would you rather fly out of to get to Boston? 
by(lgaJFKData$ActualElapsedTime,lgaJFKData$Origin,summary)
#answer - JFK. The mean is lower 84.50 for JFK to BOS flights. LGA to BOS is higher 97.0

par(mfrow=c(1,2))
lgaData = lgaJFKData[lgaJFKData$Origin=="LGA",]
boxplot(lgaData$ActualElapsedTime)

jfkData = lgaJFKData[lgaJFKData$Origin=="JFK",]
boxplot(jfkData$ActualElapsedTime)

by(lgaJFKData$ActualElapsedTime,lgaJFKData$Origin,IQR)
#lgaJFKData$Origin: JFK
#[1] 26.25
#lgaJFKData$Origin: LGA
#[1] 62

#8.2 What is the correlation between departure delay and arrival delay? Is this a surprising result?
par(mfrow=c(2,2))
cor(lgaJFKData$DepDelay,lgaJFKData$ArrDelay)
#[1] 0.8245181

cor(jfkData$DepDelay,jfkData$ArrDelay)
#0.9161194

cor(lgaData$DepDelay,lgaData$ArrDelay)
#0.6153794

plot(lgaJFKData$DepDelay, lgaJFKData$ArrDelay, col="red", main = "JFK and LGA Combined data")
plot(lgaData$DepDelay, lgaData$ArrDelay, col="red", main = "LGA Dept and Arr Delay Scatter Plot")
plot(jfkData$DepDelay, jfkData$ArrDelay, col="red", main = "JFK Dept and Arr Delay Scatter Plot")
