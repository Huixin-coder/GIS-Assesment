# GIS-Assesment
library(openxlsx)
#Set up workspace
setwd("C:/Users/hx055/Desktop/MRes那些事儿&Term 1/CASA0005 Geographic Information Systems and Science/Assesment/gis_assesment_Data")
sheetnames <- getSheetNames("Total_economic-inactivity-by-gender-reason.xlsx")
#save each sheet in '.xlsx' as '.csv'
for (i in (1:length(sheetnames))) {
  write.table(read.xlsx("C:/Users/hx055/Desktop/MRes那些事儿&Term 1/CASA0005 Geographic Information Systems and Science/Assesment/gis_assesment_Data/Total_economic-inactivity-by-gender-reason.xlsx",sheet=i),paste(sheetnames[i],'.csv',sep=""),row.names=F,sep="")
}
