titanic_train=read.csv(file.choose(),sep=",",header = T) # To choose CSV file from browse box 
View(titanic_train)
titanic_test=read.csv(file.choose(),sep=",",header = T)
titanic_gender=read.csv(file.choose(),sep=",",header = T)
str(titanic_train) 
str(titanic_test)
str(titanic_gender)
ncol(titanic_gender)
ncol(titanic_test)
ncol(titanic_train)
# We observed that train has 12 col while test has 11 col. So survived col of gender is to be copied to test
titanic_data=cbind(titanic_test,Survived=titanic_gender$Survived) #adding column into titanic_test in to new var titanic_dat
str(titanic_data)
View(titanic_data)
head(titanic_data)
tail(titanic_data)
titanic_data=rbind(titanic_train,titanic_data)
titanic_data
dim(titanic_data)
summary(titanic_data)
#Handling Na values 1) Remove Na values 2) Fill Na with Average values
mean(titanic_data$Age) #There are NA values in age column so if we calculate mean it will show NA as o/p 
#we have to exclude NA values so as to get the correct mean 
# To calculate the mean excluding NA values
mean(titanic_data$Age, na.rm=T)
#To check NA values
is.na(titanic_data)
#exclude and save only na data 
titanic_data_navalues=titanic_data[!complete.cases(titanic_data),] # To run at the same line syntax: (command)
titanic_data_navalues
nrow(titanic_data_navalues)
titanic_data=na.omit(titanic_data) #removing na values method 1
titanic_data=titanic_data[complete.cases(titanic_data),]  #removing na values method 2
nrow(titanic_data)

#To fill tha na values
for(i in 1:nrow(titanicdata)){
  if(is.na(titanicdata$Age[i])==T){
    titanicdata$Age[i]=meanage
  }
}