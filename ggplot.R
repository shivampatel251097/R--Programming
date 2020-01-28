#ggplot
#Data-Regarding data for which graphs needs to be created
#Aes-size,color,shape,x,y
#Coordinates- carteign,log,polar,maps.
#Geometry- Points, lines, smooth,density, areas, boxplot etc

#Scatter Plot

#--> Normal pocess to make scatter Plot 
mtcars$cyl=as.factor(mtcars$cyl)
plot(mpg~hp,data=mtcars,col=cyl,pch=c(4,6,8)[mtcars$cyl],cex=1.5)#pch is for symbol used and cex is symbol size
legend("topright",legend = levels(mtcars$cyl),pch=c(4,6,8),col=levels(mtcars$cyl))

#--> By ggplot
library(ggplot2)
mtcars$cyl=as.factor(mtcars$cyl)
g1=ggplot(mtcars,aes(x=hp,y=mpg,color=cyl,shape=cyl))+geom_point(size=3)+geom_smooth(method="lm",aes(fill=cyl))+theme_bw()+facet_wrap(~cyl)#if bar then geom_bar
g1
#facet_wrap() is used to devide the graph in to parts 

housedata=read.csv(file.choose(),sep=",",header = T,stringsAsFactors = F)
hist(housedata$Home.Value)#Simple histogram
ggplot(housedata,aes(x=Home.Value))+geom_histogram()
library(dplyr)
ggplot(filter(housedata,State%in% c("MA","TX")),aes(x=Date,y=Home.Value,color=State))+geom_point()

ggplot(housedata,aes(x=log(Land.Value),y=Structure.Cost))+geom_text(aes(label=State),size=3)

ggplot(filter(housedata,State%in% c("MA","TX")),aes(x=Date,y=Home.Value,color=State))+geom_bar(stat = "Identity")



#From Data mtcars, Plot the graph between mpg and cyl
library(ggplot2)
ggplot(mtcars,aes(x=mpg,y=cyl,col=cyl))+geom_point(size=5)

#To draw bar chart we have two methods
#1) geom_bar- It requires only x axis
View(mpg)
ggplot(mpg,aes(class))+geom_bar()
#If we want to change the y axis scale according to displ
g1=ggplot(mpg,aes(class))+geom_bar(aes(weight=displ,fill=drv))

g1=ggplot(mpg,aes(class))+geom_bar(aes(fill=drv))
g2=g1+geom_bar(aes(fill=drv))#can also add seperately any attr of aes
g1
(g2=g2+coord_flip()) #To make a horizontal bar

#2) geom_col()- It requires both x and y axis
df=data.frame(T1=c("a","b","c"),outcome=c(2.3,1.9,3.2))
ggplot(df,aes(T1,outcome))+geom_col()

ggplot(mtcars,aes(cyl,mpg))+geom_col(aes(fill=factor(cyl)))

ggplot(mtcars,aes(cyl,mpg))+geom_col(aes(fill=factor(gear)))# Filling color according to gear

#Cyclone Chart with the help of bar chart
df=data.frame(gender=c('Male','Female','Fema le'),age=c(25,20,55))
ggplot(df,aes(x=" ",y=age,fill=gender))+geom_bar(width = 1,stat = 'Identity')+coord_polar("y",start=0)                                     

#Cyclone Chart
ggplot(mtcars,aes(cyl,mpg))+geom_col(aes(fill=factor(gear)))+coord_polar("x",start=0)

sum(subset(mtcars,cyl==8 & gear==3,select=mpg))


library(plotly)

#From the iris dataset find do saple length, saple width, petal lenghth, 
#petal width plays a role for getting selected as a particular species
#if yes create a model to predict the species by only entering saple length and saple width
#visualize your o/p

View(iris)
species=as.numeric(iris$Species)
cbind(iris,species)
library("GGally")
ggpairs(data=iris,column=1:4)
model1=lm(Species~(Sepal.Length+Sepal.Width+Petal.Length+Petal.Width),data=iris)
predict(model1,data.frame(Sepal.Length=7.7,Sepal.Width=3.8,Petal.Length=6.7,Petal.Width=2.2)

p=ggplot(data=iris)
print(p)
