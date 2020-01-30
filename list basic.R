l1=list(customerdata,b=c(20,30),mtcars) #creating list with three elements customer data, vector,mtcars
l1[[1]]#accessing the first element of list
l1[[2]]
l1[[3]]
l1[[1]][1] #it means that accesing the data of customer data written in double codes then in customer data col1
l1[[3]][2,1] # 3rd data structure in  list and [2,1] in that data structure
# To add element in l1
l1[4]='a'; 
l1[[5]]='Shivam'
l1[[5]]
l1[[2]][3]=50
l1[[2]][3]
# To drop element from list #Use single square bracket only
l1=l1[-4]
# Single brackets means you are in the list and [[]] means you have acess that position 
l1
# IF you want to delete particular value in data structure of list
l1=l1[[2]][-3]
l1[[2]][2]

