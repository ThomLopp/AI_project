library(ade4)
library(adegraphics)
setwd("./")
continents=read.table("AI_project/contnent.txt",sep = ",",h=F,na.strings="str")
data=read.table("AI_project/data.txt",sep = ",",h=T)
acp=dudi.pca(data[,2:7])
s.corcircle(acp$co,xax=1,yax=2)  
s.label(acp$li,xax=1,yax = 2,labels = data$Country.Code)
summary(acp)
names(continents)[4] <- "Country.Code"
total <- merge(continents,data,by="Country.code", all.x = FALSE)
merge(x=continents, y=data, by.x='Country.code', by.y='Country.code', fill=-9999)

continents[1] = NULL  
continents[2] = NULL  
continents[3] = NULL  
continents[3] = NULL  

m1 <- merge(y=data,x=continents, by= "Country.Code")

acp=dudi.pca(m1[,3:8])
s.corcircle(acp$co,xax=1,yax=2)  
s.label(acp$li,xax=1,yax = 2,labels = m1$Country.Code)
s.class(acp$li,m1$V2,col=T)
