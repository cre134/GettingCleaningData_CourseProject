#!/usr/bin/python
from decimal import *
from  math import *
getcontext().prec = 9

features      = ['subject', 'exercise']
testsub       = []
testexercise  = []
testdata      = []
trainsub      = []
trainexercise = []
traindata     = []

#### Read in features

filename1 = open("./UCI_HAR_Dataset/mod_features.txt","r")
if filename1:
    for line1 in filename1:
        line1 = line1.strip()
        features.append(line1.split()[1])

#### Read in Test Data

filename2 = open("./UCI_HAR_Dataset/test/subject_test.txt","r")
if filename2:
    for line2 in filename2:
        line2 = line2.strip()
        testsub.append(line2.split()[0])

filename3 = open("./UCI_HAR_Dataset/test/y_test.txt","r")
if filename3:
    for line3 in filename3:
        line3 = line3.strip()
        testexercise.append(line3.split()[0])

filename4 = open("./UCI_HAR_Dataset/test/X_test.txt","r")
if filename4:
    for line4 in filename4:
        line4 = line4.strip()
        testdata.append(line4)

### Read in Training Data

filename5 = open("./UCI_HAR_Dataset/train/subject_train.txt","r")
if filename5:
    for line5 in filename5:
        line5 = line5.strip()
        trainsub.append(line5.split()[0])

filename6 = open("./UCI_HAR_Dataset/train/y_train.txt","r")
if filename6:
    for line6 in filename6:
        line6 = line6.strip()
        trainexercise.append(line6.split()[0])

filename7 = open("./UCI_HAR_Dataset/train/X_train.txt","r")
if filename7:
    for line7 in filename7:
        line7 = line7.strip()
        traindata.append(line7)

#### Print .csv  ####

for i in range(len(features)):
    print features[i]+'\t',

print '\n'

for j in range(len(testsub)):
    print testsub[j], testexercise[j], testdata[j]

for k in range(len(trainsub)):
    print trainsub[k], trainexercise[k], traindata[k]


