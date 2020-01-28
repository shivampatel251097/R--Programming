#Predefined function in R
help()
apropos()#lm k konse features p R studio kam krta h it will show
library()
demo()
?NA #To know about particular fn = Syntax:?fn 
args()
?Control
?Extract
?Logic
?Syntax
demo() #description of package in R studio
demo(package = .packages(all.available = T))
help(mtcars)
apropos("lm") #lm k konse features p R studio kam krta h it will show
apropos("or")
library(MASS) #To attach the MASS package in R 
is.na(mtcars)
x=c(20,10,51.3,-20,54,-78.5)
abs(x)
sqrt(16)
ceiling(4.482)
floor(4.482)
trunc(5.99)
trunc(4.482)
floor(-4.482)#Floor will go -1 always
trunc(-4.482)#Remove decimal values
round(x,digits=2)
round(4.482,digits = 2)
sin(3.14/3)
log(30)
log10(30)
log2(30)
exp(2)
union()
intersect()
setdiff()
eigen()#Values and vectors
x='abcdef'
substr(x,2,4)
grep("A",c("b","A","a"),fixed = T) #To return the index of "A" in vector,Fixed means=if its True then string otherwise regular expression
#Syntax of sub=sub(pattern,replacement,x,ignore.case=F,fixed=F)
sub("\\s",".","Hello there")#Substitute . in place of space
sub("",".","Hello there") #Substitute the . in front of screen
strsplit("abc xyz lmn"," ")#seperator=" " ie. space
strsplit("abc","")#here seperator=""
paste("x",1:3,sep="") # This is used to print user statement while programming
paste("Today Date is ",date())
toupper("shivam patel")
tolower("SHIVAM PATEL")

#############################################################
#Statistical function
x=c(20,30,28.95)
mean(x,na.rm=F)
sd(x) #Standard Deviation
median(x)
quantile(x,c(0.25,0.75))# User defined Percentiles 
range(x)
sum(x)
seq(2,100,5)#sequence from 2 to 100 with th difference of 5
rep(9,20)#What to repeat and frequency

############################################################
#User Defined function
LearnPower=function(x,y){
  result=x^y
  print(paste(x," raised to power ",y," is ",result))
}
LearnPower(4,8)
SquareLearn=function(a){
  for(i in 1:a){
    b=i^2
    print(b)
  }
}
SquareLearn(7)
greater=function(a,b){
  if(a>b){
    print(paste(a," is greater than ",b))
  }else
  {
    print(paste(b," is greater than ",a))
  }
}
greater(5,6)

#WAP tp create a fn in which when the name of attributes of mt car is passed then it would
#pringt data for the attributes
mtcarsattr=function(g){
  print(mtcars$g)
}
  
mtcarsattr(mpg)

mtcarsattr=function(x){
  for(i in mtcars[4]){
    print(i)
  }
}
mtcarsattr(hp)

#From the data of mtcars ,that cars which have mileage of 20 is good and rest low

mtcarsfn=function(x){
  for(i in mtcars$x){
    if(i>20){
      print(paste("HIGH"))
    }else{
      print("LOW")
    }
  }
}
mtcarsfn(mpg)




