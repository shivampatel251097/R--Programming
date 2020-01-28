# SET2-Question 1
awardsdataset=read.csv(file.choose(),sep=",",header = T)
awardsdataset
dim(awardsdataset)
awardsdataset
awardsdataset[awardsdataset$BHARAT.RATNA>mean(awardsdataset$BHARAT.RATNA),'NOBEL.PRIZE']
awardsdataset$decade=0


olympicyear=awardsdataset[awardsdataset$NOBEL.PRIZE>0,'YEAR']
olympicyear # Shows in which year noble pize is given
for (i in 1:7){p[i]=olympicyear[i+1]-olympicyear[i]}
p #P is the diffrence of years in getting noble prize
#To check in how many years India will get noble Prize again
mean(p)#Approx after 14 years from 2017 ie 2031 or 2032, India will be winning noble prize


#For PadmaviBhusan for each party
britishvibhusan=sum(awardsdataset[which(awardsdataset$year>=1947 & awardsdataset$GOVT=='BRITISH'),'PADMA.VIBHUSHAN'])
britishvibhusan
incvibhusan=sum(awardsdataset[which(awardsdataset$GOVT=='INC'),'PADMA.VIBHUSHAN'])
jpvibhusan=sum(awardsdataset[which(awardsdataset$GOVT=='JP'),'PADMA.VIBHUSHAN'])
jdvibhusan=sum(awardsdataset[which(awardsdataset$GOVT=='jd'),'PADMA.VIBHUSHAN'])
sjpvibhusan=sum(awardsdataset[which(awardsdataset$GOVT=='SJP'),'PADMA.VIBHUSHAN'])
(bjpvibhusan=sum(awardsdataset[which(awardsdataset$GOVT=='BJP'),'PADMA.VIBHUSHAN']))
(padmavibhusan=c(britishvibhusan,incvibhusan,jpvibhusan,jdvibhusan,sjpvibhusan,bjpvibhusan))


#For PadmaBhusan for each party
britishbhushan=sum(awardsdataset[which(awardsdataset$GOVT=='BRITISH'),'PADMA.BHUSHAN'])
incbhusan=sum(awardsdataset[which(awardsdataset$GOVT=='INC'),'PADMA.BHUSHAN'])
jpbhusan=sum(awardsdataset[which(awardsdataset$GOVT=='JP'),'PADMA.BHUSHAN'])
jdbhusan=sum(awardsdataset[which(awardsdataset$GOVT=='jd'),'PADMA.BHUSHAN'])
sjpbhusan=sum(awardsdataset[which(awardsdataset$GOVT=='SJP'),'PADMA.BHUSHAN'])
(bjpbhusan=sum(awardsdataset[which(awardsdataset$GOVT=='BJP'),'PADMA.BHUSHAN']))
padmabhusan=c(britishbhushan,incbhusan,jpbhusan,jdbhusan,sjpbhusan,bjpbhusan)
padmabhusan

Party=c('British','INC','JP','JD','SJP','BJP')
partymax=data.frame(party=Party,padmavibhusan=padmavibhusan,padmabhusan=padmabhusan,stringsAsFactors = F)
partymax
rownames(partymax)=Party

partymax[which.max(partymax$padmavibhusan),'party'] #For padmavibhusan o/p: INC
partymax[which.max(partymax$padmabhusan),'party'] #For padmavibhusan    o/p: INC

#4
awardsdataset



#Set2- Question 2
Days=c('MON','TUE','WED','THU','FRI','SAT','SUN')
weeklydata=data.frame(Earnings=c(500,500,700,800,1000,0,0),Spendings=c(100,200,200,300,500,500,300),stringsAsFactors = F)
saving=weeklydata$Earnings-weeklydata$Spendings
weeklydata=cbind(weeklydata,saving)
rownames(weeklydata)=Days
weeklydata['MON',] #It will show the all 3 values spending,earning and saving of Monday
weeklydata['TUE','saving'] # It shows the saving on monday
