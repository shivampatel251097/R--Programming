#assignment
age<-10
#if condition
age<-20
if(age<18){
  print("Child")
}else{
  print("Adult")}

age <- 15
if (age >15){
  print ("major")
} else {
  print ("minor")}

x=15
if(x<0){
  print("Smaller")
}else if(x>0){
  print("Greater")
}else{
  print("Zero")
}
a<-0
if(a>0){
  print("positive")
}else if(a<0){
  print("negative")
}else
  print("zero")


x<- 0
if(x<0){
  print("negative numbers")
}else if(x>0){
  print("positive numbers")
}else 
  print("zero")

#ifelse()function
a= c(1,2,3,4)
ifelse(a%%2==0,"even","odd")

#switch function
switch(3,"apple","ball","cat")

#For loop
a<- c(1,2,3,4,5,6,7)
for (i in a) 
{
  print(i)
}
#ex of loop
a<- c(1,2,3,4,5,6,7)#or a<-1:7
for (i in a )
{
  print(i*2)
}
#while loop
i<- 2
while (i<=7) {
  print(i)
  i=i+1
}
#repeat loop- it repeat loop to infinity
z<-1
repeat{
  print(z)
  z=z+1
}
#to stop repeat loop
z<-1
repeat{
  print(z)
  z=z+1
  if(z==920){
    break
  }
}
#break statement
g<-1:5
for (i in g) {
  if(i==4){
    break
  }
  print(i)
}
#next statement
g<-1:5
for (i in g) {
  if(i==4){
    next
  }
  print(i)
}
#CEO of bank of America is analysing the financial reports of his bank after analysing the reports
#he found that in 2015 and 2016 the bank is not having any new customers that the first thing he analyse
#the business revenue of bank dec rapidly and operation cost is inc. from past two years. 
#The ceo approaches the anALYTICal team of machanzie and ask them to frame the strategy for this business problem.
#Being the member of analytics team what type of data you will be asking from the bank.create a data of atleats 20
#observationns and frame the strategy based on data which will solve business problem of bank of america.
x=c(23,11,40)
x[order(x)]