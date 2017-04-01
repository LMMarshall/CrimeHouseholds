library(dplyr)

#Pull in raw data
fileURL <- "https://www2.ed.gov/rschstat/statistics/surveys/mbk/Children-in-households-with-violent-crime_2014_0731_1400.csv"
df <-read.csv(fileURL)
write.csv(df, file="children_crime.csv")

df <- read.csv("children_crime.csv")

#The data set isn't tidy; the same crimes are counted across multiple rows
#Totals are listed; then totals by gender; then totals by race.
#We need to extract the rows that include gender/crime/race.

df2 <- df[-c(1:117,274:377, 534:637),]
df2$Year <- as.factor(df2$Year)
df2$Sex<- as.factor(df2$Sex)
levels(df2$Race.ethnicity)[1] <- "Native American"
levels(df2$Race.ethnicity)[2] <- "Asian/Pacific Islander"
levels(df2$Race.ethnicity)[3] <- "Black"
levels(df2$Race.ethnicity)[4] <- "Hispanic"
levels(df2$Race.ethnicity)[5] <- "Mixed-Race"
levels(df2$Race.ethnicity)[6] <- "White"

rownames(df2) <- 1:nrow(df2)

df3 <- df2[,-c(1:2)]

#get rid of Native American data since it's so sparse and not reliable
df3 <- subset(df3, Race.ethnicity != "Native American")
df3 <- subset(df3, Race.ethnicity != "Asian/Pacific Islander")
df3 <- subset(df3, Race.ethnicity != "Mixed-Race")

#get rid of violent crime; appears to be a duplicate (other crimes totalled
#plus some small figure)
df3 <- subset(df3, Type.of.violent.crime != "Violent crime")
#get rid of footnote, percentage, and SE on percentage
df3 <- df3[,-c(4,6,7)]
#get rid of note on percent
df3 <- df3[,-5]
df3 <- mutate(df3, sd=Standard.Error.on.Count/Count)
write.csv(df3, "violence.csv")

library(plotly)
plot_ly(df4, x=~Year, y=~Count, type = "bar", 
        color =~as.factor(Race.ethnicity))%>%
  layout(barmode="stack")