library(dplyr)

##### Read in merged dataset #####
alldata<-read.csv("cleandata.csv")

#### Change exercise names from numberic to string ####
alldata$exercise<-gsub('1','walking',alldata$exercise)
alldata$exercise<-gsub('2','walking_upstairs',alldata$exercise)
alldata$exercise<-gsub('3','walking_downstairs',alldata$exercise)
alldata$exercise<-gsub('4','sitting',alldata$exercise)
alldata$exercise<-gsub('5','standing',alldata$exercise)
alldata$exercise<-gsub('6','laying',alldata$exercise)

#### Pull out columns containing activity mean and standard dev. ####
colsmean<-grep("*mean*", names(alldata))
colsstd<-grep("*std*", names(alldata))
trimmedset<-sort(c(1,2,colsmean,colsstd))

#### Create a new dataset with only activity mean and std. dev. ####
parse_totalset<-select(alldata, trimmedset)

#### Write out File with only mean and std. dev. measurements ####
write.table(parse_totalset, file = 'parsed_data.txt', row.names = FALSE)


