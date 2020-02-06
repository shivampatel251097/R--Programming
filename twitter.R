#Twitter data analysis
install.packages("twitteR")
install.packages("ROAuth")
library("twitteR")
library("ROAuth")
# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

api_key = "xH2q4kY1Z7OACQYtvNcVkE23R" # your api_key
api_secret = "dvENtgUzLp0pBeIPi0uqsO9mzKrS5dTqVz1TgCkZ8Hjzuxm5KB" # your api_secret 
access_token = "969327162963578880-wwIb1y9uRAXE25TuZMWhSErjrpJfq26" # your access_token 
access_token_secret = "lWSMXR8EyZEmeHJVnQSHqUY0r1aG8Qzp38FpegsWXX70y" # your access_token_sceret 
#create an object "cred" that will save the authenticated object that we can use for later sessions
cred <- OAuthFactory$new(consumerKey='xH2q4kY1Z7OACQYtvNcVkE23R',
                         consumerSecret='dvENtgUzLp0pBeIPi0uqsO9mzKrS5dTqVz1TgCkZ8Hjzuxm5KB',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

# Executing the next step generates an output --> To enable the connection, please direct your web browser to: <hyperlink> . Note:  You only need to do this part once
cred$handshake(cainfo="cacert.pem")

#In RStudio, type in the pin number. Save the object "cred" on your local machine as "twitter authentication.Rdata."
save(cred, file="twitter authentication.Rdata")


load("twitter authentication.Rdata")
setup_twitter_oauth(api_key,api_secret,access_token,
                    access_token_secret)

#Type hashtags of which you want data
search.string <- "#ipl"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,  lang="en")
View(tweets)

df <- do.call("rbind", lapply(tweets, as.data.frame))
View(df)
write.csv(df,'Ipl data.csv')


install.packages("splitstackshape")
library("splitstackshape")
df=cSplit(df, "created", " ")

colnames(df)[colnames(df) == 'created_1'] <- 'Date'
colnames(df)[colnames(df) == 'created_2'] <- 'Time'
View(df)
str(df)
library("dplyr")

df1=df%>%
  group_by(screenName)%>%
  summarise(cop=n())
df1

