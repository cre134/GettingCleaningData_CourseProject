#!/usr/bin/python

filename = open("./table.txt","r")
if filename:
    for line in filename:
        line = line.strip()
        line = line.split()
        print line

