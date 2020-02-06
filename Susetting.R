#SUBETTING: 1) Dataset Name   2) Subset fun()   3) Packages(dplyr,sqldf,stringr)
#1) mtcars[row,column] Ex= mtcars[1,'am',which]
#2) subset(dataset_name,condition,column_name)
#3) #sqldf can be used as it is as sql but for only select


#1) mtcars[row,column]
mtcars
#From mtcars find data for first and third column
mtcars[,c(1,3)] #For selecting tha data from two columns write in vector
#Show data in am column
mtcars[,'am']
#Find first five rows for hp column
mtcars[1:5,'hp']
head(mtcars[,'hp'],5)
#Leaving first 8 rows show the data for cyl
mtcars[-(1:8),'cyl']
mtcars[9:nrow(mtcars),'cyl']

#Find the data for car named as Volvo 142E
mtcars['Volvo 142E',]
#Find the no. of gears in the cars having named Merc 280
mtcars['Merc 280','gear']
mtcars[c('M%'),'gear']

#Find the data of cars having 4 gears
mtcars[which(mtcars$gear==4),]
subset(mtcars,mtcars$gear==4)
attach(mtcars)
mtcars[mtcars$gear==4,]

#Find the cars those are automatic and having mpg>20
subset(mtcars,mtcars$am==0 & mtcars$mpg>20)
mtcars[which(mtcars$am==0 & mtcars$mpg>20),]
mtcars[mtcars$am==0 & mtcars$mpg>20,]

#Consider a case where user have a requirement for buying a car as 
#1) car mileage should be above 20
#2) It would be preferrable if car is automatic
#3) No. of gears should be more than 3
#4) Engine should be vshape
#5) Can work with more than three carbonators
subset(mtcars,(mtcars$mpg>20 & mtcars$gear>3 &mtcars$vs==1 &mtcars$carb>3),)
mtcars[(mtcars$mpg>20 & mtcars$gear>3 &mtcars$vs==0 &mtcars$carb>3),]

#A car manufacturer wants to create a car with high mileage, for that an analyst like you are 
#give them a hypothesis that if the weight of the car is more, then mpg decreases. wrt this if
#hp of car is more then also mpg decreases(Given mileage=20 hypothesis)
mtcars[(mtcars$wt>mean(mtcars$wt) & mtcars$hp>mean(mtcars$hp)),'mpg']
(mtcars[(mtcars$wt>mean(mtcars$wt) & mtcars$hp>mean(mtcars$hp)),'mpg'])<20 #Hence hypothesis is true

#Find the cars, those have gears more than 3 needs to be provided in which type of transmission
p=mtcars[mtcars$gear>3,'am'] #0-Automatic and 1 is manual so by the analysis we get to know more numbers of 1 so manual is preferrable
p=factor(p)
summary(p)
sum((mtcars[mtcars$gear>3,'am'])/length(mtcars[mtcars$gear>3,'am']))*100 # It gives the percentage of manual data
#which is 76.47 percent so we prefer manual

#The cars having mileage above 23  what would be there avg. hp and what would be 
#the min. number of cylinders that car require
mean(mtcars[(mtcars$mpg)>23,'hp'])
min(mtcars[mtcars$mpg>23,'cyl'])


#2) subset(dataset_name,condition,column_name)

titanicdata=read.csv(file.choose(),sep=',',header=T)
titanicdata
str(titanicdata)
summary(titanicdata)
subset(titanicdata,Survived==1)
subset(titanicdata,Survived==1,select = c(Age,Sex))
# % of male survived in the titanic ship
(nrow(subset(titanicdata,Survived==1 & Sex=='male'))/(nrow(titanicdata)))*100

(nrow(subset(titanicdata,Survived==1 & Sex=='male'))/(nrow(subset(titanicdata,Sex=='male')))*100
  
  