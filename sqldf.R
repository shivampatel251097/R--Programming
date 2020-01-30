#sqldf
library(sqldf)
sqldf("select * from iris")
sqldf("select count(*) from iris")
sqldf("select count(species) from iris group by species")
sqldf("select * from iris where Species like '%Setosa'")
sqldf("select Species from iris where Species like '%Setosa'")
