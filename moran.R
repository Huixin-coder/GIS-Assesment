#install.packages("ape")
library(ape)
#allpersonfinal<-read.csv(".csv")
male<-read.csv("C:/Users/13670/Desktop/Males_final.csv")
female<-read.csv("C:/Users/13670/Desktop/Females_final.csv")
#slice the file to facilitate the calculation of Moran's I Index
#remove the area code in the first column
frmale_deal<-female[,2:17]

#data normalization
frmale_dealed<-scale(frmale_deal, center = TRUE, scale = TRUE)
arr<- matrix(1:32,16,2)#used to store the calculated Moran's I Index
arrframe<-data.frame(arr)

#calculate Moran's I Index
library(spdep)
#import the spatial matrix (export from geoda)
#use nb2mat to convert to matrix
space<-read.gal("C:/Users/13670/Desktop/all person_rate.gal",override.id=TRUE)
space <- nb2mat(space)
#pay attention to this part because of the missing data of City of London,  there are 32 columns in csv, but 33 in shp, match them correctly
space<-space[1:32,1:32]
for(i in 1:16)
  arrframe[i,2]<-Moran.I(frmale_dealed[,i],space)$observed

#put "year" into first row
arrframe[1]<-c(2004:2019)
#draw a scatter plot
plot(arrframe$X1,arrframe$X2,xlab="年份",ylab="莫兰指数",xaxt="n",pch=16)
#make the coordinate scale interval as 1
#set X axis coordinate scale
axis(1,arrframe$X1) 
#regression analysis
lm.sol = lm(arrframe$X2~arrframe$X1,data=arrframe)
#regression statistics
summary(lm.sol)
#draw regression line
abline(lm.sol)
