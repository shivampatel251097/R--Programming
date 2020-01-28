#Gender of the customer , locatiobn of the customer and the quantity of product they bought. 
#In this dataset we need to identify which gender is preferring more number of products?
#create a data structure with 7 observations in it and after creating the datastructure we
#need to add a coulumn which we earlier forgot named as product.
customerdata=data.frame(gender=factor(c('M','F','M','M','F','M','F')),quantity=c(5,6,7,4,3,5,7),location=c('Pun','Chd','Del','Har','Del','Pun','Chd'),stringsAsFactors = F)
str(customerdata)
nrow(customerdata)
ncol(customerdata)
head(customerdata)
tail(customerdata)
str(mtcars)
head(mtcars)
tail(mtcars)
product=c('Soap','Cream','Water','Socks','Jeans','Perfume','Jeans')
customerdata$prod=product #add a column to existng dataset
customerdata
customerdata=cbind(customerdata,product)
#adding row
r8=data.frame(gender=factor('M'),quantity=(10),location=('del'),prod=('Lux'),product=('Soap'),stringsAsFactors = F)
customerdata=rbind(customerdata,r8)
customerdata
#To delete a column
customerdata=customerdata[,-5]# -5 deleting 5th column and before , are indicating rows
v8=c('c1','c2','c3','c4','c5','c6','c7','c8')
row.names(customerdata)=v8 # Giving name to each row
customerdata
mtcars
mtcars[[5]] #For taking all rows column number 5 and nor mentioning the rows 
mtcars[,5] #same as above but mentioning the rows
mtcars["hp"]
customerdata[1,2]
mtcars$hp
mtcars[,4]
customerdata["c1","prod"]
customerdata
customerdata[3,"location"]
