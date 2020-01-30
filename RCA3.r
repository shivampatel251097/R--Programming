#Set 2
#Question 1
deodrandata=read.csv(file.choose(),sep=',',header=T)
View(deodrandata)
str(deodrandata)
summary(deodrandata)
library("GGally")
library("corrplot")
correlation=cor(deodrandata)
correlation #Here we find that spend and sales are highly related, month spend and month sales are not related much
corrplot(correlation)#This will generate the correlation plot

#TASK1: You have to find the sales trend.
g=ggplot(data=deodrandata,aes(x=Spend,y=Sales))+geom_line()
g

#TASK2: Create a model to predict the sales and show the accuracy of model.
par(mfrow=c(1,2)) #Showing more than 1 graph on a screen mfrow is telling no. of rows and columns
boxplot(deodrandata$Spend)#To check any outlier present
boxplot(deodrandata$Sales)
modeldeo=lm(Sales~Spend,data=deodrandata)
summary(modeldeo)

set.seed(6234)#To keep the index of value same
traindeoin=sample(1:nrow(deodrandata),0.8*nrow(deodrandata)) 
testdeo=deodrandata[-traindeoin,]
#To check the accuracy
predict2=predict(modeldeo,testdeo)# Here we are checking model accuracy by test data
check=data.frame(predict2,deodrandata$Spend)
cor(check)

#TASK3: Create a model to predict the sales and show the accuracy of model

predict1=predict(modeldeo,data.frame(Spend=5100))
predict1









#Question 2

easydaydata=read.csv(file.choose(),sep=',',header=T)
View(easydaydata)
summary(easydaydata)
str(easydaydata)
library("dplyr")
#TASK1: Find which products are bought after 9AM and before 7PM  
easydaydata %>%
  select(PRODUCTS) %>%
  filter(TIME>9 & TIME<7)

#TASK2: Find the products that are always selected together.
easydaydata %>%
  group_by(TIME) %>%
  select(PRODUCTS,TIME)

#TASK3: During which time chicken product are getting preference.
easydaydata %>%
  select(PRODUCTS,TIME) %>%
  filter(PRODUCTS %in%c("Chicken Salami","Chicken Seekh"))


#TASK 4: Find the Customer Information those are helping in providing maximum amount of sales.
easydaydata %>%
  group_by(CUSTOMERPHONE) %>%
  summarise(sum_sales=sum(PRICE)) %>%
  select(CUSTOMERPHONE,sum_sales)

