#Programming Part
x=5
if(x>0){
  print("Positive Number")
}else{
  print("Negative Number")
}

#Program to write bigger number
a=10
b=5
if(a>b){
  print("Greater number is a")
}else{
  print("B is greater")
}
# To take values from user
x=as.integer(readline(prompt="Enter Number"))
x
p=as.character(readline(prompt = "Enter Character"))
p
#While Loop
i=1
while(i<6){
  print(i)
  i=i+1}

x=c(2,5,8,17,25)
count=0
for(val in x){
  if(val%%2==0)
    count=count+1
}
print(count)

y=titanic_data$Age
z=0
for(i in y){
  if(i%%2==0)
    z=z+1
}
print(z)

#WAp for factorial of a number
fact=1
a=5
i=1
while(i<=a){
  fact=fact*i
  i=i+1
}
for(i in 1:a){
  fact=fact*i
}
fact
print(fact)

#Types of operators
#1) Arithmetic 2) Relational 3) Logical 4) Assignment 5) Misc Operator
#1) Arithmetic
v1=c(20,40,10)
v2=c(13,15,12)
(v3=v1+v2)
(v4=v1-v2)
(v5=v1*v2)
v1/v2
v1%%v2#it will give remainder
v1%/%v2 # will give only quotient
5%/%2
#2) Relational <,>,>=,<=,==,!= (o/p will be in TRUE/ FALSE)
v1<v2
v1>v2
v1>=v2
v1<=v2
v1==v2
v1!=v2

#3) Logical &,|,!,(&& , || -result for these two will be calculated on the basis on first value in vectors)
v1&v2
v1|v2
!v1
!v2
v3=c(0,2,-3)# only zero is treated as false not -ve numbers
v4=c(1,2,3)
v3&v4

#4) Assignment <-, =, ->, ->>, <<-
v<-10
v=10
v<<-10
10->v
10->>v

#5) Miscellaneous Operators :, %in%- Checking the value present in range and returns T/F , %*%
t2=2:8
t2
12%in%t2
12%*%t2
t2*12
m=matrix(c(2,6,5,1,10,4),nrow=2,ncol=3,byrow=T)
m
m%*%t(m) # t is transpose

m=matrix(c(20,40,80,50,65,90,30,65,45),nrow=9,ncol=1,byrow=T)
m
p=c('Dhoom 1','Dhoom 2','Dhoom 3','Golmal 1','Golmal 2','Golmal 3','Housefull 1','Housefull 2','Housefull 3')
rownames(m)=p
m
#1St Sequel of Dhoom
colSums(m)/9 #mean
((-m[1]+m[2])/m[1])*100 #100% profit on the 1st sequel
#2nd Sequel of dhooom
((m[3]-m[2])/m[3])*100 #100% profit on the 2nd sequel
#1st Seq of Golmal 
((m[5]-m[4])/m[4])*100 # 30% profit on 1st sequel
#2nd Seq of Golmal 
((m[6]-m[5])/m[5])*100 # 38.46% profit on 2nd sequel
#1st Seq of housefull 
((m[8]-m[7])/m[7])*100 # 116.66% profit on 1st sequel
#2nd Seq of Golmal 
((m[9]-m[8])/m[8])*100 # 30% loss on 2nd sequel

library(nycflights13)
View(flights)
library("MASS")
data(women)
women
data("painters")
painters
painters[,c(1,2)]
ChickWeight
c=subset(ChickWeight,Chick==34)
c
plot(c$weight,c$Time)
