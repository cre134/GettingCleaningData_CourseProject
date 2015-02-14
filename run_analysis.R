library(dplyr)
options(digits=4)

#### Read in merged dataset ####
alldata<-read.csv("cleandata.csv")

#### Change exercise names from numberic to string ####
alldata$exercise<-gsub('1','walking',alldata$exercise)
alldata$exercise<-gsub('2','stairs_down',alldata$exercise)
alldata$exercise<-gsub('3','stairs_up',alldata$exercise)
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
#write.table(parse_totalset, file = 'parsed_data.txt', row.names = FALSE)

#### group parsed table by subject and exercise ####
by_sub_exer<-group_by(parse_totalset, subject, exercise)

Answer<-summarize(by_sub_exer,  tBodyAcc_mean_X = mean(tBodyAcc_mean_X),
                                tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
                                tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
                                tBodyAcc_std_X  = mean(tBodyAcc_std_X),
                                tBodyAcc_std_Y  = mean(tBodyAcc_std_Y),
                                tBodyAcc_std_Z  = mean(tBodyAcc_std_Z),

                             tGravityAcc_mean_X = mean(tGravityAcc_mean_X),
                             tGravityAcc_mean_Y = mean(tGravityAcc_mean_Y),
                             tGravityAcc_mean_Z = mean(tGravityAcc_mean_Z),
                             tGravityAcc_std_X  = mean(tGravityAcc_std_X),
                             tGravityAcc_std_Y  = mean(tGravityAcc_std_Y),
                             tGravityAcc_std_Z  = mean(tGravityAcc_std_Z),

                            tBodyAccJerk_mean_X = mean(tBodyAccJerk_mean_X),
                            tBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y),
                            tBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z),
                            tBodyAccJerk_std_X  = mean(tBodyAccJerk_std_X),
                            tBodyAccJerk_std_Y  = mean(tBodyAccJerk_std_Y),
                            tBodyAccJerk_std_Z  = mean(tBodyAccJerk_std_Z),

                               tBodyGyro_mean_X = mean(tBodyGyro_mean_X),
                               tBodyGyro_mean_Y = mean(tBodyGyro_mean_Y),
                               tBodyGyro_mean_Z = mean(tBodyGyro_mean_Z),
                               tBodyGyro_std_X  = mean(tBodyGyro_std_X),
                               tBodyGyro_std_Y  = mean(tBodyGyro_std_Y),
                               tBodyGyro_std_Z  = mean(tBodyGyro_std_Z),

                           tBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X),
                           tBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y),
                           tBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z),
                           tBodyGyroJerk_std_X  = mean(tBodyGyroJerk_std_X),
                           tBodyGyroJerk_std_Y  = mean(tBodyGyroJerk_std_Y),
                           tBodyGyroJerk_std_Z  = mean(tBodyGyroJerk_std_Z),
                           
                               tBodyAccMag_mean = mean(tBodyAccMag_mean),
                               tBodyAccMag_std  = mean(tBodyAccMag_std),

                            tGravityAccMag_mean = mean(tGravityAccMag_mean),
                            tGravityAccMag_std  = mean(tGravityAccMag_std),

                           tBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean),
                           tBodyAccJerkMag_std  = mean(tBodyAccJerkMag_std),

                              tBodyGyroMag_mean = mean(tBodyGyroMag_mean),
                              tBodyGyroMag_std  = mean(tBodyGyroMag_std), 
            
                          tBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean),
                          tBodyGyroJerkMag_std  = mean(tBodyGyroJerkMag_std),

                                fBodyAcc_mean_X = mean(fBodyAcc_mean_X),
                                fBodyAcc_mean_Y = mean(fBodyAcc_mean_Y),
                                fBodyAcc_mean_Z = mean(fBodyAcc_mean_Z),
                                fBodyAcc_std_X  = mean(fBodyAcc_std_X),
                                fBodyAcc_std_Y  = mean(fBodyAcc_std_Y),
                                fBodyAcc_std_Z  = mean(fBodyAcc_std_Z),

                            fBodyAcc_meanFreq_X = mean(fBodyAcc_meanFreq_X),
                            fBodyAcc_meanFreq_Y = mean(fBodyAcc_meanFreq_Y),
                            fBodyAcc_meanFreq_Z = mean(fBodyAcc_meanFreq_Z),
                                    
                            fBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X),
                            fBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y),
                            fBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z),
                            fBodyAccJerk_std_X  = mean(fBodyAccJerk_std_X),
                            fBodyAccJerk_std_Y  = mean(fBodyAccJerk_std_Y),
                            fBodyAccJerk_std_Z  = mean(fBodyAccJerk_std_Z),

                        fBodyAccJerk_meanFreq_X = mean(fBodyAccJerk_meanFreq_X),
                        fBodyAccJerk_meanFreq_Y = mean(fBodyAccJerk_meanFreq_Y),
                        fBodyAccJerk_meanFreq_Z = mean(fBodyAccJerk_meanFreq_Z),

                               fBodyGyro_mean_X = mean(fBodyGyro_mean_X),
                               fBodyGyro_mean_Y = mean(fBodyGyro_mean_Y),
                               fBodyGyro_mean_Z = mean(fBodyGyro_mean_Z),
                               fBodyGyro_std_X  = mean(fBodyGyro_std_X),
                               fBodyGyro_std_Y  = mean(fBodyGyro_std_Y),
                               fBodyGyro_std_Z  = mean(fBodyGyro_std_Z),

                           fBodyGyro_meanFreq_X = mean(fBodyGyro_meanFreq_X),  
                           fBodyGyro_meanFreq_Y = mean(fBodyGyro_meanFreq_Y),  
                           fBodyGyro_meanFreq_Z = mean(fBodyGyro_meanFreq_Z), 

                               fBodyAccMag_mean = mean(fBodyAccMag_mean),
                               fBodyAccMag_std  = mean(fBodyAccMag_std),

                           fBodyAccMag_meanFreq = mean(fBodyAccMag_meanFreq),
                            
                       fBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean),
                       fBodyBodyAccJerkMag_std  = mean(fBodyBodyAccJerkMag_std),

                   fBodyBodyAccJerkMag_meanFreq = mean(fBodyBodyAccJerkMag_meanFreq),

                          fBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean),
                          fBodyBodyGyroMag_std  = mean(fBodyBodyGyroMag_std),
                        
                      fBodyBodyGyroMag_meanFreq = mean(fBodyBodyGyroMag_meanFreq),

                      fBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean),
                      fBodyBodyGyroJerkMag_std  = mean(fBodyBodyGyroJerkMag_std),
    
                  fBodyBodyGyroJerkMag_meanFreq = mean(fBodyBodyGyroJerkMag_meanFreq)
                            
)

#### Write final table summarizing the UCI HAR dataset ####

#write.table(format(Answer, digits = 4), file = 'UCI_HAR_summary.txt', sep = '\t', row.names = FALSE)
write.table(Answer, file = 'UCI_HAR_summary.txt', sep = '\t', row.names = FALSE)
