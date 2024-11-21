#Import EggSubmersion data
library(readxl)
eggsub<-read_excel("EggSubmersion.xlsx")
names(eggsub)
Nest[is.na(Nest)]<-24
#build factors
fspec<-factor(Specie)
fnest<-factor(Nest)
fmethod<-factor(Method)
dseggsub<-data.frame(fmethod,fnest,fspec,Hatching)
save.image("BogdanEggsub.Rdata")

