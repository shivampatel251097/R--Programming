#Combining vectors
v=c(1,2,3)
w=c('Mary','Rohan')
x=c(v,w)
x[3]#access the value of a vector
x[4]
#inserting the data in vector
x[4]='Ram'
x
#adding a new value in  vector
x[6]='Shivam'
x
x[3:5]
x[3:5]=c('20','40','60')
x
length(x)#length of a vector
#insertig a value at the end of vector
x[length(x)+1]='Easy'
x
#inserting values at two end positions of vector
x[c(length(x)+1,length(x)+2)]=c('Mary Kom','Bhatinda')
x
#printing the element other than intented one
x[-3]# except 3rd element from starting all will print
#How to give name of columns to a vector
#First create new vector which contains the column names
a=c('Roll','Reg','SEQ','AGE','Marks','Name','Last','F name','Place')
names(x)=a
x
names(x)


s=c("aa","bb","cc","dd","ee")
l=c(FALSE,TRUE,FALSE,TRUE,FALSE)# logical vector
s[l]# It will show the values in s which are true in l;
x['Name']#accesing the vector value with column name
x['Place']
p=c(1,2,3,4,5,6,7,8,9)
names(p)=a
p
#Droping the value
x=x[-2]
x

#Factors
data=c(1,3,2,2,1,1,3,3,1,3)
levels(data)
data1=factor(data)
levels(data1)
data1=factor(data,labels=c('I','II','III'))#For changing the labels of factor
levels(data1)
summary(data1)

months=c('March','April','Jan','Nov','Jan','Sept','Oct','Sept','Nov','Aug','Jul','Dec','Aug','Aug','Sept','Nov','Feb','April')
months
months=factor(months)
months
table(months)
levels(months)
#The command below will show the orderd levels data which show the count of each month from the months data
months=factor(months,levels=c('Jan','Feb','March','April','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'),ordered=TRUE) 
#LEvels will match tha data from the month data then show its count
table(months)
months


fact1=factor(c('Good','Bad','Good','Poor','Good','Bad'),labels=c('Bad','Good','Poor'),ordered=T)
fact1
levels(fact1)
table(fact1)
fact1[2]
fact1[2]==fact1[4]
fact1[1]>fact1[2]
