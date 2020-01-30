df=data.frame(Name=c('Shivam','Vasundhara','Satyam','Rishabh','Sanjay','Naveen'),Gender=c('M','F','M','M','M','M'),stringsAsFactors = F)
df
record=c('I','II','III','IV','V','VI','VII')
row.names(df)=record
Age=c(22,20,21,21,21,22)
df=cbind(df,Age)
r7=data.frame(Name='Shruti',Gender='F',Age=21,stringsAsFactors = F)
df=rbind(df,r7)
df=df[-6,]
head(df)
tail(df)
summary(df)
str(df)
table(factor(df$Gender))
library("sqldf")
sqldf("select Gender,count(Gender) as CountofGender from df where age>=21 group by Gender having CountofGender>1")
df$Placed=0
df$Placed=c('F','T','F','F','F','F','T')
sqldf("select * from df")
sqldf("select * from df where placed='T'")
sqldf("select count(placed) from df where placed='F'")
df2=sqldf("select * from df where name like 'S%' union select * from df where age>=21")
df2
sqldf("select * from df cross join customerdata")
sqldf("select * from df a,df b where a.gender=b.gender")
sqldf("select * from df inner join customerdata on df.gender=customerdata.gender")

titanicdata=read.csv(file.choose(),sep=",",header=T,stringsAsFactors = F)
titanicdata
str(titanicdata)
summary(titanicdata)
ncol(titanicdata)
nrow(titanicdata)
is.na(titanicdata$Age)
meanage=mean(titanicdata$Age,na.rm=T)
meanage
#To remove na values
titanicdata=na.omit(titanicdata)
is.na(titanicdata)
#To fill tha na values
for(i in 1:nrow(titanicdata)){
  if(is.na(titanicdata$Age[i])==T){
    titanicdata$Age[i]=meanage
  }
}
View(titanicdata)
is.na(titanicdata)
#Changing male to M and Female to F
for(i in 1:nrow(titanicdata)){
  if(titanicdata$Sex[i]=='male'){
    titanicdata$Sex[i]='M'
  }else{
    titanicdata$Sex[i]='F'
  }
}


