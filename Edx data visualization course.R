#edx
library(dslabs)
data("heights")
data(murders)
murders
p=top_n(murders,10,total)
arrange(p,desc(total))

library(NHANES)
data(NHANES)
NHANES

gapminder %>%
  filter(continent=="Africa" & year==2012 &fertility<=3 &life_expectancy>=70 )  %>%
  select(country,region)
  

gapminder$continent
library(dslabs)
data(gapminder)
View(gapminder)

library(dplyr)
library(ggplot2)

gapminder%>%
  filter(year%in% c(1960,2012) )%>%
  ggplot(aes(fertility,life_expectancy,col=continent))+geom_point()+facet_grid(continent~year)

#facet_grid helps us to make the view of two years at the same time
gapminder%>%
  filter(year%in% c(1960,2012) )%>%
  ggplot(aes(fertility,life_expectancy,col=continent))+geom_point()+facet_grid(~year)

#But when we add more number of years it leads to thinning of graph so we use facet_wrap
gapminder%>%
  filter(year%in% c(1960,1970,1981,2000,2012,2014),continent %in% c('Europe','Asia') )%>%
  ggplot(aes(fertility,life_expectancy,col=continent))+geom_point()+facet_wrap(~year)

#Time series plot
gapminder%>%
  filter(country %in% c('India','Japan') )%>%
  ggplot(aes(year,fertility,col=country))+geom_line()
  
gapminder%>%
  filter(country %in% c('Germany','South Korea') )%>%
  ggplot(aes(year,fertility))+geom_line()
#the above graph just plot the point for both country without knowing which point is for wic
#country so we need to make group by 
gapminder%>%
  filter(country %in% c('Germany','South Korea') )%>%
  ggplot(aes(year,fertility,group=country,col=country))+geom_line()

#Usually most of the ggplot add legends but in case if we need to add labels here is the 
#code:
labels=data.frame(country=c('South Korea','Germany'),x=c(1975,1962),y=c(60,72))
gapminder%>%
  filter(country %in% c('Germany','South Korea') )%>%
  ggplot(aes(year,life_expectancy,col=country))+geom_line()+geom_text(data=labels,aes(x,y,label=country),size=5)+theme(legend.position = "none")

#if we have large number so as to minimize we can just scale in to log
gapminder%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(log2(dollars_per_day)))+geom_histogram(binwidth = 1,fill="blue",col="black")+scale_x_continuous(trans="log2")


gapminder%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(log10(population)))+geom_histogram(binwidth = 0.5,fill="blue",col="black")
#We can also scale x in log #Transformation
gapminder%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(dollars_per_day))+geom_histogram(binwidth = 0.5,fill="blue",col="black")+scale_x_continuous(trans="log2")

#Stratify and Boxplot
p=gapminder%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(region,dollars_per_day,col=continent))+geom_boxplot()
p
  #Now the above graph shows the overlapping labels on the x axis so to rotate by 90 degree
#or write vertically
p+theme(axis.text.x  = element_text(angle = 90,hjust = 1))


#reorder function# It order in ascending order
v=c("Asia","Asia","West","West","West")
fac=factor(v)
levels(fac)#In default it reorder alphabetically lets consider the case for integers
#"Asia" "West" is o/p
val=c(10,11,12,6,4)
fac=reorder(fac,val,FUN=mean)
levels(fac)#"West" "Asia" is o/p
#In the above the west(12+6+4)/3 is having min mean in comparison with asia(10+11)/2
#So here we are going to make use of reorder in the region column

gapminder=mutate(gapminder,dollars_per_day=gdp/population/365)
gapminder=mutate(gapminder,region=reorder(region,dollars_per_day,FUN=median))
gapminder%>%
  filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(region,dollars_per_day,fill=continent))+geom_boxplot()+
  theme(axis.text.x  = element_text(angle = 90,hjust = 1))+xlab("")+
  scale_y_continuous(trans="log2")+geom_point(show.legend = FALSE)


#Compairing Distributions
west=c("Western Europe","Northern Europe","Southern Europe", "Northern America", "Australia and New Zealand")

gapminder%>%
  filter(year%in%c(1970,2010) & !is.na(gdp))%>%
  mutate(group=ifelse(region%in%west,"West","Developing"))%>%
  ggplot(aes(dollars_per_day))+geom_histogram(binwidth = 0.5,fill="blue",col="black")+
  scale_x_continuous(trans="log2")+facet_grid(year~group)
#In the above code there is problem that many countries are  made after 1970 so we need
#to find the countries which are in the both 1970 and 2010
countrylist1=gapminder%>%
  filter(year==1970& !is.na(dollars_per_day))%>%
  .$country
countrylist2=gapminder%>%
  filter(year==2010& !is.na(dollars_per_day))%>%
  .$country
country_list=intersect(countrylist1,countrylist2)
country_list

#Now we need to rewrite this code
gapminder%>%
  filter(year%in%c(1970,2010) & country %in% country_list)%>%
  mutate(group=ifelse(region%in%west,"West","Developing"))%>%
  ggplot(aes(dollars_per_day))+geom_histogram(binwidth = 0.5,fill="blue",col="black")+
  scale_x_continuous(trans="log2")+facet_grid(year~group)

#Boxplot
gapminder%>%
  filter(year%in%c(1970,2010) & country %in% country_list)%>%
  mutate(region=reorder(region,dollars_per_day,FUN=median))%>%
  ggplot(aes(region,dollars_per_day,fill=continent))+geom_boxplot()+
  theme(axis.text.x=element_text(angle=90,hjust=1))+xlab("")+
  scale_y_continuous(trans="log2")+facet_grid(~year)


#For camparison over the years
gapminder%>%
  filter(year%in%c(1970,2010) & country %in% country_list)%>%
  mutate(region=reorder(region,dollars_per_day,FUN=median))%>%
  ggplot(aes(region,dollars_per_day))+geom_boxplot(aes(fill=factor(year)))+
  theme(axis.text.x=element_text(angle=90,hjust=1))+xlab("")+
  scale_y_continuous(trans="log2")

#Density Plots
#To check the diff btw developing and western(developed) countries we need to make group
gapminder%>%
  filter(year==1970 & country %in% country_list)%>%
  mutate(group=ifelse(region%in%west,"West","Developing"))%>%
  group_by(group)%>%
  summarize(count=n())

#Now how yo make density plot
gapminder%>%
  filter(year%in% c(1970,2010) & country %in% country_list)%>%
  mutate(group=ifelse(region%in%west,"West","Developing"))%>%
  ggplot(aes(dollars_per_day,y=..count..,fill=group))+
  geom_density(alpha=0.2,bw=0.75,position = "stack")+facet_wrap(~year)+scale_x_continuous(trans ="log2")
#stack fun overlap one over the other

#Case_when is used to define groups


#To show labels instead of pints in scatter plot we use geom_text
gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day,infant_mortality,color=region,label=country))+
  geom_text()+scale_x_continuous(trans="log2")



library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder%>%
  filter(continent=="Africa" & year%in% c(1970,2010) & !is.na(gdp) & !is.na(infant_mortality))%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  ggplot(aes(dollars_per_day,infant_mortality,label=country,color=region))+
  geom_text()+scale_x_continuous(trans="log2")+
  facet_grid(rows=vars(year),cols=NULL)

#How to reorder the graph according to given quantity
library(dplyr)
library(ggplot2)
library(dslabs)
data(us_contagious_diseases)
dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting)%>%
  mutate(state=reorder(state,rate,FUN="mean"))
dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()

library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
murders
murders %>% 
  mutate(rate = total/population*100000)%>%
  mutate(region=reorder(region,rate,FUN="median"))%>%
  ggplot(aes(region,rate))+geom_boxplot()+geom_point()



#Case Study(us_contagious_disease)

library(dslabs)
data("us_contagious_diseases")
str(us_contagious_diseases)
summary(us_contagious_diseases)
View(us_contagious_diseases)

dat=us_contagious_diseases%>%
  filter(!state%in% c("Hawaii","Alaska") & disease=="Measles")%>%
  mutate(rate=count/population*10000)%>%
  mutate(state=reorder(state,rate))
dat
View(dat)
dim(dat)

#How to add intercept in the plot
dat%>%
  filter(state=="California")%>%
  ggplot(aes(year,rate))+geom_line()+geom_vline(xintercept = 1963,col="blue")+
  ylab("Cases per 10,000")

#Color palettes are of two types:sequential and diverging
library(RColorBrewer)
display.brewer.all(type="seq")#For low to high intensity of color palette
display.brewer.all(type="div")#To show standard dev. away from the average

#A plot taking 3 arguments at a time
dat%>%
  ggplot(aes(year,state,fill=rate))+
  geom_tile(color="grey50")+scale_x_continuous(expand=c(0,0)) + 
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") +
  geom_vline(xintercept = 1963,col="blue")+
  theme_minimal()+theme(panel.grid = element_blank())+
  ggtitle("Heat map of Disease Per Year")+ylab("")+xlab("")


#How to find average of any coloumn when groupby is used
avd=us_contagious_diseases%>%
  filter(disease=="Measles")%>%
  group_by(year)%>%
  summarize(us_rate=sum(count,na.rm = TRUE)/sum(population,na.rm=TRUE)*10000)
View(us_contagious_diseases)
levels(us_contagious_diseases$disease)
avd%>%
  ggplot(aes(year,us_rate))+geom_line()+geom_vline(xintercept = 1963,color="blue")+
  geom_hline(yintercept = 20,color="red")

#signif and round function are used to set the significant value to the number
#to set globall we use: options(digits=n)


#Tile Plot
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(dslabs)
data(us_contagious_diseases)

the_disease = "Smallpox"
dat <- us_contagious_diseases %>% 
  filter(!state%in%c("Hawaii","Alaska") & weeks_reporting>=10 & disease == the_disease) %>% 
  mutate(rate = count / population * 10000) %>% 
  mutate(state = reorder(state, rate))

dat %>% ggplot(aes(year, state, fill = rate)) + 
  geom_tile(color = "grey50") + 
  scale_x_continuous(expand=c(0,0)) + 
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") + 
  theme_minimal() + 
  theme(panel.grid = element_blank()) + 
  ggtitle(the_disease) + 
  ylab("") + 
  xlab("")

# Codes

library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

the_disease = "Smallpox"
dat <- us_contagious_diseases %>%
  filter(!state%in%c("Hawaii","Alaska") & weeks_reporting>=10 & disease == the_disease) %>%
  mutate(rate = count / population * 10000) %>%
  mutate(state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease==the_disease) %>% group_by(year) %>%
  summarize(us_rate = sum(count, na.rm=TRUE)/sum(population, na.rm=TRUE)*10000)

dat %>% ggplot() +
  geom_line(aes(year, rate, group = state),  color = "grey50", 
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate),  data = avg, size = 1, color = "red") +
  scale_y_continuous(trans = "sqrt", breaks = c(5,25,125,300)) + 
  ggtitle("Cases per 10,000 by state") + 
  xlab("") + 
  ylab("") +
  geom_text(data = data.frame(x=1955, y=50), mapping = aes(x, y, label="US average"), color="black") + 
  geom_vline(xintercept=1963, col = "blue")

#code
library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

us_contagious_diseases %>% filter(state=="California" & weeks_reporting>=10) %>% 
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population)*10000) %>%
  ggplot(aes(year, rate,color=disease)) + 
  geom_line()+geom_hline(yintercept = 50,color="orange")+
  geom_text(data = data.frame(x=1990,y=110),mapping = aes(x,y,label="Rate Time series of Diseases"),color="Blue")

#Code
library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)
data=us_contagious_diseases%>%
  filter(!is.na(population))%>%
  group_by(disease,year)%>%
  summarize(rate = sum(count)/sum(population)*10000)
data
data%>%
  ggplot(aes(year,rate,color=disease))+geom_line()