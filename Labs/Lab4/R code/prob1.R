#problema 1
load("Bogdan1.Rdata")
#Remove Outliers
source("D:/Radu/myRappstat/Bogdan/outlierf.R", echo=TRUE)
attach(ds1);
dfx<-outlierKD(ds1,Egg_length)
detach(ds1)
attach(dfx)
dfx<-outlierKD(dfx,Egg_width)
dfx<-outlierKD(dfx,Light_UV)
dfx<-outlierKD(dfx,Light_MW)
dfx<-outlierKD(dfx,Light_LW)
dfx<-outlierKD(dfx,mean_Inc_per)
sum(is.na(Egg_length))
sum(is.na(Egg_width))
sum(is.na(Light_UV))
sum(is.na(Light_MW))
sum(is.na(Light_LW))
sum(is.na(mean_Inc_per))

dfc<-data.frame(mean_Inc_per,Light_UV,Light_MW,Light_LW);
cor(dfc)

#Correlation tests
cor.test(Light_UV,mean_Inc_per)
cor.test(Light_MW,mean_Inc_per)
cor.test(Light_LW,mean_Inc_per)

#Correlation plots
plot(mean_Inc_per,Light_UV)
abline(lm(Light_UV~mean_Inc_per),col="red")
plot(mean_Inc_per,Light_MW)
abline(lm(Light_MW~mean_Inc_per),col="red")
plot(mean_Inc_per,Light_LW)
abline(lm(Light_LW~mean_Inc_per),col="red")
save(dfx,file="Bogdandfx.Rdata")


