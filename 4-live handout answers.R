

##1. What is the causal question that this experiment is attempting to address?
#A1 - That people are willing to spend more for the artist generated picture or not. Is there a causal relation between the price of the painting and the creator?

##2. How is replication, control and randomization implemented in this completely randomized designed experiment?
#A2. Replication - sent to all the HBAP students in two groups. The replication in each group (strata?)
# Control - there were only two paintings to decide upon. The max price was also fixed (ie. $1000)
# Randomisation - selection of students in two groups

#3. What types of biases may be present in this experiment, and how can they be overcome?
#A3. the half of the students may rely on the information given as which one is artist generated and which is computer generated. There would be another bias if the 'contaminations' had occured between the groups
# there is also possibility of no responses.

#  4. The file crd.csv contains a file of 60 names. Read this file into a data frame in R. Suppose we would
#like to randomize the people in this file into treatment and control for the current study. What R code
#would accomplish this?

crd = read.csv("data/crd.csv")
#inspect the data
View(crd)
nrow(crd)

#generate random T and C for large size. Use that for randomly assigning to crd later. There is no ask to do 50-50% so I do completely randomise distribution
randomTC = sample(c("Treatment","Control"),5000, repl=TRUE)
#view the output
randomTC[1:60]

#add new variable to the frame. Use nrow() function to get the length of the crd data so if the csv changes with more data the code doesn't stop at 60 observations.
crd$random = randomTC[1:nrow(crd)]

#view the data for sanity
crd$random[1:60]
#View(crd)

#check how the randomised distribution of T and C looks like
nrow(crd[crd$random=='Treatment',])
nrow(crd[crd$random=='Control',])

 

#  5. The file paintings_crd.csv, stored in the file section of the RStudio workspace, contains three fields:
#  (1) id, (2) treatment (1=control, 2=treatment), and (3) dollar value assigned to the first painting.
#a) Read the data file into a data frame in RStudio. What is the number of responses? What are the
#number of control participants and treatment participants in the study?

paintings = read.csv("data/paintings_crd.csv")

nrow(paintings)
# What is the number of responses? = 69

dim(paintings[paintings$treatment=="1",])
#What are the number of control participants = 34

dim(paintings[paintings$treatment=="2",])
#What are the number of treatment participants = 35

#  b) Compute the sample mean dollar amount of the first painting for the control group and the sample
#mean for the treatment group. What do you make of the difference?

controlGrp = paintings[paintings$treatment=="1",]
mean(controlGrp$amount)
treatmentGrp = paintings[paintings$treatment=="2",]
mean(treatmentGrp$amount)

#  c) Create side-by-side boxplots of the allocated price of the first painting between treatment and
#control. Interpret this graph. (In the next unit, we will be able to determine statistical significance of the difference)

par(mfrow=c(2,2))
boxplot(controlGrp$amount)
boxplot(treatmentGrp$amount)




