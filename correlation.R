#Correlation and Regression analysis
#cor value if btw -1 and 0 means they are least related if btw 1 and 0
#then they are related. -ve indicated least related and 0 means no relation
#What hypothesis we made is false then null hypothesis is true and if null hypothesis is false
#then what we thought is right which is known as alternative hypothesis
#Preferable is Null hypothesis should be False so that out hypothesis what we have thought is true ie. alternative hypothesis
trees #Girth is width of stem
summary(trees)
str(trees)
cor(trees$Girth,trees$Height)
cor(trees$Girth,trees$Volume)
cor(trees$Height,trees$Volume)
#Suppose if we have more no. of clolumn the task would be easy
library("GGally")
ggpairs(data=trees,column=1:3)
#Without importing GGALLY 
trees.cor=cor(trees) #It will give the matrix only
trees.cor
library("corrplot")
trees.cor=cor(trees)
corrplot(trees.cor) #Correlation plot and its a type of heat map. 


#Working on mt cars
ggpairs(data=mtcars,column=1:ncol(mtcars))
mtcars.cor=cor(mtcars)
corrplot(mtcars.cor)#To show the plot of correlation



#Supervised- have a prior knowledge of the bahaviour of input and have knowledpe of o/p
#Unsupervised- Training the model according to each input for furure production and clustering is done
#Reinforcement- learning (feedback and fault)- To make supervised better 
#Supervised- 1) Regression used if response variable is numerical Ex- height and 2) Classification used if response variable is categorical Ex= gender
#Multiple regression model when the predictor have to enter more than onr column to predict aaccurately
#predictor is independent and on the x axis while response is dependent and on y axis in scatter plot
#and this is called linear model and it has absolute line

#making of linear model
model=lm(Volume~Girth,data=trees) # Here Volume is Response and Girth is Predictor
model
summary(model)
plot(model)
plot(trees$Girth,trees$Volume)
abline(model)

#Coeffecients---> Estimate and std Error
#Intercepter is excpected tree volume if the volume of girth is zero and intercepter is always +ve
#we can not have a tree with a negative value
#slope in the dataset is the effect of tree girth on tree volume which means additional inch of 
#girth of tree volume increased by 5.0659
#The coeffecient standard errors tells the variation of estimated coeffecient from actual 
#average of response variable
#t value- It measures how many standard deviation are the estimated coeffecient from zero
#p value- It measures any value equal or larger than t if h0(NUll Hypo) is TRUE.
#The larger t value, smaller p value generally we use 0.05 significance value when p value is smaller than 0.05 we reject the null hypothesis

ggplot(data=trees,aes(x=Girth,y=Volume))+geom_point()+stat_smooth(method="lm",col="dodgerblue3")+theme(panel.background = element_rect(fill = "white"),axis.line.x=element_line(),axis.line.y = element_line())+ggtitle("Linear Model")
p1=predict(model,data.frame(Girth=18))#Its not giving accurate prediction
View(trees)
p1
#So to make it better and accurate prediction
model1=lm(Volume~(Girth+Height),data=trees)
p2=predict(model1,data.frame(Girth=18,Height=72))
p2



#Working on Cars dataset
cars
str(cars)
summary(cars)# Always check whether the range of attributes /column are close enough 
#Suppose we have one column have value less than 1 and other have more than 1000
#then we have to normalise by using formula. abs((min-max)/max)
structure(cars)
corcar=cor(cars$speed,cars$dist)

corrplot(cor(cars))
library("GGally")
ggpairs(cars) # To make ggplot

par(mfrow=c(1,2))
ggpairs(cars)
corrplot(cor(cars))
#Without making model we can see the o/p through this graph
scatter.smooth(cars$speed,cars$dist,main="Dist~Speed")

par(mfrow=c(1,2)) #Showing more than 1 graph on a screen mfrow is telling no. of rows and columns
boxplot(cars$speed)#To check any outlier present
boxplot(cars$dist)
#Generally an outlier is a data point that lies outside 1.5*IQR(Inter Quartile Range)
#IQR =75th percentile-25th percentile of boxplot or 3rd quadratile-1st quadratile(each 10 percentile is considered as 1st,2nd,...quadratile)
#outlier is the value which is at max distance from mean
#Prepare Model
modelcars=lm(dist~speed,data=cars)
summary(modelcars)#If p value is less than 0.5 then we have assumed the right hypothesis'
set.seed(6234)#To keep the index of value same
traincarin=sample(1:nrow(cars),0.8*nrow(cars)) #It is picking 80% random rows index from Cars
traincar=cars[traincarin,]
testcar=cars[-traincarin,]
lmmod=lm(dist~speed,data=traincar)
lmpred=predict(lmmod,testcar)
check=data.frame(lmpred,testcar$dist)
cor(check)






#Visualization in R
#Scatter Plot- Syntax: plot(x_axis,y_axis)
plot(mtcars$mpg,mtcars$wt)

height=c(5.10,6.2,6,5.8,5.9)
weight=c(80,89,82,72,65)

plot(weight,height)
lines(weight,height)
plot(height,weight,type='S',main='Height v/s Weight',col='red',xlab = 'Height',ylab = 'Weight')# H for histogram, l for line
#s for stage step. s starts from starting and and S starts from last
dates=factor(c(2014,2015,2016,2017))
sales=c(1800,2700,3200,2500)

plot(dates,sales) #As it is fator so rather than showing a dot it will show a line
lines(dates,sales)

v1=c(7,12,28,3,41)
v2=c(14,7,9,19,3)
png(file="line chart learning .jpg")
plot(v1,type='o',col='blue',xlab='Months',ylab = 'Hairfall',main='Rainfall Chart')
#Here if only one column is passed thn it is considered as y as default 
lines(v2,type='o',col='red')
dev.off()

#Bar Plot
counts=table(mtcars$gear)
counts
barplot(counts,main='Gear in Car',xlab = 'Gears',horiz = T)

#Stacked Bar 
counts=table(mtcars$vs,mtcars$gear)
barplot(counts,main="Car",xlab="Number of Years",col=c('blue','red'),legend=rownames(counts),beside=T)
#Legend is what colors indicates , beside will show the stacked graph to side graph


#Pie Chart
slices=c(10,12,4,16,8)
lb=c("US","UK","AUS",'RUS',"IND")
pie(slices,labels = lb,main="Country Chart")
percent=round(slices/sum(slices)*100)
lb=paste(lb,percent)
lb=paste(lb,"%",sep=" ")
lb
pie(slices,labels = lb,main="Country Chart",col=rainbow(length(lb)))

#For 3d Pie
install.packages("plotrix")
library(plotrix)
pie3D(slices,labels = lb,main="Country Chart",col=rainbow(length(lb)))
install.packages("plotly")
