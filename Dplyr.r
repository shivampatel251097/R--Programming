#pipeline means the dataset can be used with the use of pipe sign %>% if 
#you want to continue the dataset in next line for next function then again use%>%
#subset using dplyr
install.packages("dplyr")
install.packages("sqldf")
install.packages("rpart")
install.packages("plotly")
#importing data Mammals Datset
datamammals=read.csv(file.choose(),sep =',',header = T )
datamammals
summary(datamammals)
structure(datamammals)

attributes(mtcars)
#Making Pipeline so as to use the dataset for subsetting and make the changes in itself without storing
#package named dplyr used for subsetting
#subset(dataset,condition,columns)
#here columns will be provided as select=c()

#useful pre defined functions in R
#1. select()-- to select the columns with column names-- to find which columns u wanna see
#2. filter()--- to filter out and gain only specified data out of whole db
#3. mutate()--- as same as R bind C bind, to combine rows, columns
#4. group by()--- data will be grouped eg: male, female
#5. arrange()--- sorting of data either ascending or descending
#6. summarise()----
#7. pipe operation %<% will be helping to apply the functions in a sequence continously
#Rather than storing it again and again
library("dplyr")
#1- Select
select(mtcars,am)
select(datamammals,name,sleep_total)  #1st arg is dataset name, 2nd is the column name, 3rd is again col name
#2nd and 3rd are called projections
head(select(datamammals,name,sleep_total))#return the top 6 values
select(datamammals,name:order)
select(datamammals,-name,-order)#Excludiing column 'name'and order

select(datamammals,starts_with("sleep_total"))   #to use the keyword to find the columns starting with 'sl'
#contains(),matches(),one_of(),starts_with()
select(datamammals,one_of("sleep_total"))
select(datamammals,contains("s"))
select(datamammals,matches("sleep_"))

#2 using Filter()--- which Rows you want to see

l=filter(datamammals,sleep_total>=16) #Through this we can filter data with condition withour if else
l
filter(datamammals,sleep_total>=16,bodywt>=1)  #applies the And operation:
View(select(DataMammals,order))
filter(datamammals,order %in%c("Primates","Carnivora"))  #applies or operation  to match character condition
filter(datamammals,c(order=="Primates"|order=="Carnivora")) #Or operation uses  '|'
filter(datamammals,name %in%c("Cheetah","Cow","Dog"))
filter(datamammals,c(order=="Primates"|name=="Cheetah"),sleep_total>8)#Using both And,Or


#to find name and order with condition on order
datamammals %>%
  select(name,order)%>%
  filter(c(order=="Primates"| order=="Carnivora"))

head(arrange(datamammals,order))

datamammals %>% #Alternate to above
  arrange(order) %>% 
  head

#we need to select name, order,and sleep_total of mammals for those mammals having sleep_total>=16
#and show the data in the arrangement of order and sleep_total
datamammals%>%
  select(name,order,sleep_total)%>% #%>% indicated that the next line is also in same query or pipeline
  filter(sleep_total>=16)%>%
  arrange(order,sleep_total)%>%
  head
#installing neccessary packages to R
install.packages("ggplot2")
install.packages("sqldf")
install.packages("rpart")
install.packages("plotly")

#Mutate is used to add row or comlumn
datamammals1=datamammals %>%   #Syntax to make pipe
  mutate(rem_prop=sleep_rem/sleep_total)%>%
  head#No need to pass dataset because we are already working in pipe

datamammals1
#Alternative to above
datamammals2=mutate(datamammals,body_weight=bodywt*1000)
datamammals2

# Summarise function has many functions such as mean(),sd(),
#median(), min(),max(),sum(),n()-Count,first(),last(),n_distinct- Gives distinct values in dataset

datamammals1=datamammals %>%   #Syntax to make pipe
  summarise(avg_sleep=mean(sleep_total),
            sd=sd(sleep_total),
            min_sleep=min(sleep_total),
            max_sleep=mean(sleep_total),
            count=n())
datamammals1
#Alternate to above
summarise(datamammals,n(),mean(sleep_total))

#Group By
datamammals %>%
  group_by(order)%>% #Use of %>% means the next line should also work together ie summarise will execute
  summarise(avg_sleep=mean(sleep_total),
            sd=sd(sleep_total),
            min_sleep=min(sleep_total),
            max_sleep=max(sleep_total),
            count=n())%>%
  arrange(desc(count))# To sort in descending order

datamammals%>%
  group_by(order)%>%
  select(order,name)# It will be unable to perform groupby
#because we need to apply groupby on aggregate function of summarise function

datamammals%>%
  group_by(order)%>%
  summarise(count_an=n())


library(tidyverse)